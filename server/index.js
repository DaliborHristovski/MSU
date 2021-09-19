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
const e = require("express");

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
function getAplicationInfo(x,idEve) {
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
    student.BrojNaIndex = ? AND prijava_za_ispit.idEvent = ?;`,
      [x,idEve],
    (err, result) => {
      if (err) {
        console.log(err);
      }
      resolve(result);
    }
  );  
});        
};
//we get the subjects of the student with index of x 
 

function getTotalSubjectInfo(x) {
  let y = `SELECT 
  predmet.ImeNaPredmet,
  aktiviran_predmet.AP_ID,
  snap.IdStudentiNaPredmet AS idSnap
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
      ) WHERE prijava_za_ispit.Status = 'Положена'
      )AND student.BrojNaIndex = ?`;
return new Promise(function(resolve, reject) {
db.query(
  y,
  x,
  (err, result) => {
    if (err) {
      console.log(err);
    }
    resolve( result);
  }
);     
})

};

function getEventType(x){
  return new Promise(function(resolve, reject) {
    db.query(
      `SELECT event.Type
      FROM university.event
      where idEvent = ?;`,
        x,
      (err, result) => {
        if (err) {
          console.log(err);
        }
        resolve( result[0].Type);
      }
    ); 
  })    
}



function getSubjectInfo(x,idEve,eveType) {
    let y = `SELECT 
    predmet.ImeNaPredmet,
    aktiviran_predmet.AP_ID,
    snap.IdStudentiNaPredmet AS idSnap
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
        ) WHERE prijava_za_ispit.Status = 'Положена' OR prijava_za_ispit.idEvent = ?
        )AND student.BrojNaIndex = ?`;
    if(eveType == 2) 
    { y= y + ` AND predmet.Semestar IN ('II','IV','VI');`; }
    else{
      if(eveType == 3) 
      {y= y + ` AND predmet.Semestar IN ('I','III','V');`;} 
      else { y= y + `;`;}
    }    

  return new Promise(function(resolve, reject) {
    db.query(
      y,
      [idEve,x],
      (err, result) => {
        if (err) {
          console.log(err);
        }
        resolve( result);
      }
    );     
  })
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
/* app.get("/login", (req, res) => {
//   if (req.session.user) {
//     res.send({ loggedIn: true, user: req.session.user });
//   } else {
//     res.send({ loggedIn: false });
//   }
// });
*/
function convertSub(object){
  if (Array.isArray(object)){
    return object;
  }else {
    return object = [object];
  }
  };

function AddSubjects(subjects,idEvent){
  
  if(subjects && idEvent){

  return new Promise(function(resolve, reject) {
    //console.log(typeof subjects + ` has the value of :` + subjects);
    let statement = ``;
    
  db.beginTransaction( function(err){
      if(err){throw err;}

      //Array.from(subjects).forEach(s =>{
        //new way of doing things
      convertSub(subjects).forEach(s =>{ 
        console.log("what is happening with the : " + s +" value????");

      statement =  `INSERT INTO university.prijava_za_ispit(Status,IdStudentiNaPredmet,idEvent) `+ `VALUES ('Положена',`+ s +`,`+idEvent+`); `;
      db.query( statement,function(err,result){
          if(err){
            db.rollback(
              function(){
                throw err;
              }
            )
          }
          console.log("we querried this into the transaction :" + JSON.stringify(result));
        }
      )

    });
    db.commit(function(err){
      if(err){
        db.rollback(function(){
          throw err;
        });
      }
      console.log("Succcess!!!!!");

    });

  });
  resolve( console.log("what to do"));
  }); 
};

}

app.post("/subsin/:id", (req,res) =>{
  if (req.body.predmet&&req.params.id){
    (async function(){
     await Promise.all([AddSubjects(req.body.predmet, req.params.id)]);
      console.log("will we get redirected");
       res.redirect('/event/' + req.params.id);
    })();
    

     
  }
  
  });


//on call it calls the express.static default page from the dierectory provided
app.get("/", (req, res) =>{
   res.redirect("/");
  //res.sendFile(path.join(__dirname,'../app/index.html'));
  }
);

//Destroys the session efectively loggin us out and redirecting us to index.html aka the starting page
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
//we go here from the /login post request and if we are logged in we proceed to get our data from the data base
  if ((req.session.user)&&(req.params.id == req.session.user[0].username)) {
    (async function(){
      const username = req.session.user[0].username;
      const [subInfo,studentInfo,eventInfo] = await Promise.all([getTotalSubjectInfo(username),getStudentInfo(username), getEventInfo()]);

    res.render("home",{
      prInfo: subInfo,
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
  // if the session is active, that is if we are logged in we can load the page for logging in 
  if (req.session.user) {
   res.redirect('/event/'+req.params.id);   
  } else {
    res.send({ loggedIn: false });
  }
});

app.get("/event/:id", (req, res) => {

  console.log("we are back in  event :" + req.params.id);
// if the session is active, that is if we are logged in we can load the page for logging in 
if (req.session.user) {
 const username = req.session.user[0].username;
 const idEvent = req.params.id;
 (async function(){
   // need to get the entire event and then send in eveType.Type for the type of event and calculate if the event is active  here to know if you should render the aplication section...
  const [eveType] = await Promise.all([getEventType(idEvent)]);
 (async function(){
  const [subInfo,appInfo,studentInfo,] = await Promise.all([getSubjectInfo(username,idEvent,eveType),getAplicationInfo(username,idEvent),getStudentInfo(username)]);

    res.render("exam-apply",{
      prInfo: subInfo,
      appInfo: appInfo,
      sInfo: studentInfo,
      idEvent:idEvent
    });

})();  
})();  
} else {
  res.send({ loggedIn: false });
}
});



app.listen(8000, () => {
  console.log("running server");
 
});