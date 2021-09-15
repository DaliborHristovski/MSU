const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const ejs = require("ejs");

//CookieParser is no longer needed
//const cookieParser = require("cookie-parser");
const session = require("express-session");


const bcrypt = require("bcrypt");
const saltRounds = 10;

const app = express();

const path = require('path');
const { response } = require("express");
const { resolve } = require("path");
const { loadavg } = require("os");

// may use router if i decide that i need many pages as of now it is not worth using
const router = express.Router();



app.use(express.json());


//CookieParser is no longer needed
//app.use(cookieParser());


//#################################################

// /*needed to comment out the corrse check for development sake Build version should work fine with it eneabled
// app.use( cors({origin: ["http://localhost:8000"],methods: ["GET", "POST"],credentials: true}));
// */
//#########################################################################################################




app.use(express.urlencoded({ extended: false }));

//login session declaration
app.use(
  session({
    key: "userId",
    secret: "Water is not wet!",
    resave: false,
    unset: 'destroy',
    saveUninitialized: false,
    cookie: {
      expires: 60 * 60 * 24 * 1000,
    },
  })
);

//conection to a MySQL 
const db = mysql.createConnection({
  user: "root",
  host: "localhost",
  password: "Lozinka123",
  database: "university"
});

function getStudentInfo(x) {
  return new Promise (function(resolve, reject) {
  db.query(
    `SELECT 
    student.BrojNaIndex AS BrojNaIndex,
    CONCAT(student.Ime,SPACE(1),student.Prezime) AS ImeIPrezime
FROM
    student
WHERE
    student.BrojNaIndex = ?;`,
      x,
    (err, result) => {
      if (err) {
        console.log(err);
      }
      resolve(result);    
    }
  );
});         
};
function getAplicationInfo(x) {
  return new Promise (function(resolve, reject) {
  db.query(
    `SELECT 
    prijava_za_ispit.ID AS ID,
    predmet.ImeNaPredmet AS ImeNaPredmet,
    predmet.KodNaPredmet AS KodNaPredmet,
    predmet.Semestar AS Semestar,
    predmet.Krediti AS Krediti,
    aktiviran_predmet.UcebnaGodina AS UcebnaGodina,
    CONCAT(profesor.Ime, SPACE(1), profesor.Prezime) AS Profesor
FROM
    (prijava_za_ispit
    JOIN snap ON (prijava_za_ispit.IdStudentiNaPredmet = snap.IdStudentiNaPredmet)
    JOIN aktiviran_predmet ON (snap.AP_ID = aktiviran_predmet.AP_ID)
    JOIN student ON (snap.BrojNaIndex = student.BrojNaIndex)
    JOIN predmet ON (aktiviran_predmet.KodNaPredmet = predmet.KodNaPredmet)
    JOIN profesor ON (aktiviran_predmet.IDNaVaraboten = profesor.IDNaVraboten))
WHERE
    student.BrojNaIndex = ?;`,
      x,
    (err, result) => {
      if (err) {
        console.log(err);
      }
      resolve(result);
    }
  );  
});        
};
function getSubjectInfo(x) {
  return new Promise(function(resolve, reject) {
  db.query(
    `SELECT 
    predmet.ImeNaPredmet,
    aktiviran_predmet.AP_ID
FROM (university.snap
        JOIN aktiviran_predmet ON (snap.AP_ID = aktiviran_predmet.AP_ID)
        JOIN predmet ON (aktiviran_predmet.KodNaPredmet = predmet.KodNaPredmet)
        JOIN student ON (snap.BrojNaIndex = student.BrojNaIndex)
        )where aktiviran_predmet.AP_ID NOT IN(    
    SELECT 
		aktiviran_predmet.AP_ID
    FROM
        (
prijava_za_ispit
        JOIN snap ON (prijava_za_ispit.IdStudentiNaPredmet = snap.IdStudentiNaPredmet)
        JOIN aktiviran_predmet ON (snap.AP_ID = aktiviran_predmet.AP_ID)
        JOIN student ON (snap.BrojNaIndex = student.BrojNaIndex)
        JOIN predmet ON (aktiviran_predmet.KodNaPredmet = predmet.KodNaPredmet)
        JOIN profesor ON (aktiviran_predmet.IDNaVaraboten = profesor.IDNaVraboten)
        )
        )AND student.BrojNaIndex = ?;`,
      x,
    (err, result) => {
      if (err) {
        console.log(err);
      }
      resolve( result);
    }
  );     
  }); 
};
function getEventInfo(){
  return new Promise(function(resolve, reject) {
  db.query(
    `SELECT
    event.idEvent,
    event.EventStart,
    event.EventEnd,
    event.Type
FROM university.event 
ORDER BY event.EventStart DESC;`,
    (err, result) => {
      if (err) {
        console.log(err);
      }
      resolve( result);
    }
  );  
}); 
};

app.set("view engine", "ejs");

//#################################################
// Final Build block
//#################################################

//used after building the project for deployment
/*
app.set("views", path.join('../docs'));
app.use("/static", express.static(path.resolve('../docs')));
*/
//end of build block
//#################################################

//#################################################
//EJS developer settings 
//#################################################

//testing for browsersync with prebuilt version
// /*
app.use("/", express.static(path.resolve('../app')));
app.set("views", path.join('../app/'));
// */
//end of test block
//#################################################

app.get("/", (req, res) =>{
   res.redirect("/");
  //res.sendFile(path.join(__dirname,'../app/index.html'));
  //res.render("index");
  }
);


// app.get("/login", (req, res) => {
//   if (req.session.user) {
//     res.send({ loggedIn: true, user: req.session.user });
//   } else {
//     res.send({ loggedIn: false });
//   }
// });


//Need to add a button that calls this in the pages
app.get("/logout", function(req,res){ 
  if (req.session) {
    // delete session object
    req.session.destroy(function(err) {
        if(err) {
            return next(err);
        } else {
            req.session = null;
            console.log("logout successful");
            return res.redirect('/');
        }
    });
}  


  //req.session.destroy(req.sessionID);
  //res.status(200).redirect("/");  
});

//this is what will get called to input into the db.login for user that joins for the first time
function Regis(userName, inputPassword) {
  const username = userName;
  const password = inputPassword;

  bcrypt.hash(password, saltRounds, (err, hash) => {
    if (err) {
      console.log(err);
    }

    db.query(
      "INSERT INTO login (username, password) VALUES (?,?)",
      [username, hash],
      (err, result) => {
        console.log(err);
      }
    );
  });
};


app.get("/home/:id", (req, res) => {
// console.log("are we loged in ? : " + req.session.user)
console.log(req.params.id + " is it equal to " + req.session.user[0].username);
  if ((req.session.user)&&(req.params.id == req.session.user[0].username)) {
    (async function(){
      const username = req.session.user[0].username;
      const [subInfo,appInfo,studentInfo,eventInfo] = await Promise.all([getSubjectInfo(username),getAplicationInfo(username),getStudentInfo(username), getEventInfo()]);

    res.render("home",{
      prInfo: subInfo,
      appInfo: appInfo,
      sInfo: studentInfo,
      eInfo: eventInfo
    });
  })();   
  } else {
     res.redirect("/");
  }
});

//new login path that sends us to the event page with all the event application elements listed
app.post("/login", (req, res, next) => {
  const username = req.body.username;
  const password = req.body.password;
  
  db.query("SELECT * FROM login WHERE username = ?;",  username, (err, result) => {
      if (err) {
        res.send({ err: err });
      }
      if (result.length > 0) {
        //comparing encripted values
        bcrypt.compare(password, result[0].password, (error, response) => {
          if (response) {
            req.session.user = result;
             res.redirect("/home/"+username);
          } else {
            console.log("Wrong username/password combination!");
            res.redirect("/home/"+username);
          }
        });
      }      
       else 
      {
        db.query(
          "SELECT * From student WHERE student.BrojNaIndex = ?;", 
          username,
          (err, result) => {
            if (err) { res.send({ err: err });
            }
            if (result.length > 0 && result.EMBG == password) {
              Regis(username,password);
              req.session.user = result;
               res.redirect("/home/"+username);
            }else{
              console.log("User doesn't exist");
               res.redirect("/home/"+username);
            };
           }
        )
      }
    })
});

//when we pick one of the events 
app.post("/event/:id", (req, res) => {

  //console.log(req.params.id + " we are loged in if this prints 1 = "+ req.session.user[0].username);
  
  // if the session is active, that is if we are logged in we can load the page for logging in 
  if (req.session.user) {
   res.redirect('/event/'+req.params.id);   
  } else {
    res.send({ loggedIn: false });
  }
});

app.get("/event/:id", (req, res) => {

//console.log(req.params.id + " we are loged in if this prints 1 = "+ req.session.user[0].username);

// if the session is active, that is if we are logged in we can load the page for logging in 
if (req.session.user) {
 const username = req.session.user[0].username;
 (async function(){
  const [subInfo,appInfo,studentInfo,eventInfo] = await Promise.all([getSubjectInfo(username),getAplicationInfo(username),getStudentInfo(username), getEventInfo()]);

    res.render("exam-apply",{
      prInfo: subInfo,
      appInfo: appInfo,
      sInfo: studentInfo,
      eInfo: eventInfo
    });

})();   
} else {
  res.send({ loggedIn: false });
}
});



app.listen(8000, () => {
  console.log("running server");
 
});