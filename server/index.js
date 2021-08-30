const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const ejs = require("ejs");


//const cookieParser = require("cookie-parser");
const session = require("express-session");


const bcrypt = require("bcrypt");
const saltRounds = 10;

const app = express();

const path = require('path');
const { response } = require("express");
const router = express.Router();

let subInfo;
let appInfo;
let studentInfo;

app.set("view engine", "ejs");
app.set("views", path.join('../docs/views'));

app.use(express.json());
app.use( cors({
    origin: ["http://localhost:3000"],
    methods: ["GET", "POST"],
    credentials: true,
  })
);
//app.use(cookieParser());


app.use(express.urlencoded({ extended: false }));


app.use(
  session({
    key: "userId",
    secret: "Water is not wet!",
    resave: false,
    saveUninitialized: false,
    cookie: {
      expires: 60 * 60 * 24 * 1000,
    },
  })
);

const db = mysql.createConnection({
  user: "root",
  host: "localhost",
  password: "Lozinka123",
  database: "university"
});

async function getStudentInfo(x) {
  db.query(
    `    SELECT 
    student.BrojNaIndex AS BrojNaIndex,
    CONCAT(student.Ime,
      ' ',
      student.Prezime) AS 'ImeIPrezime'
FROM
    student
WHERE
    student.BrojNaIndex = ?;`,
      x,
    (err, result) => {
      if (err) {
        console.log(err);
      }
      studentInfo = result;
      console.log(result);
    }
  );         
};

async function getAplicationInfo(x) {
  db.query(
    `    SELECT 
    prijava_za_ispit.ID AS ID,
    predmet.ImeNaPredmet AS ImeNaPredmet,
    predmet.KodNaPredmet AS KodNaPredmet,
    predmet.Semestar AS Semestar,
    predmet.Krediti AS Krediti,
    aktiviran_predmet.UcebnaGodina AS UcebnaGodina,
    CONCAT(profesor.Ime, ' ', profesor.Prezime) AS Profesor
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
      appInfo = result;
    }
  );         
};

async function getSubjectInfo(x) {
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
      subInfo = result;
    }
  );     
      
};


app.use(express.static(path.resolve('../docs')));
//router.get('/',function(req,res){res.sendFile(path.resolve('../app/index.html'));});
app.get("/", (req, res) =>{
  //res.sendFile(path.join(__dirname,'../docs/index.html'));
  }
);

//no longer used and it is integrated within the login call
// app.post("/register", (req, res) => {
//   const username = req.body.username;
//   const password = req.body.password;

//   bcrypt.hash(password, saltRounds, (err, hash) => {
//     if (err) {
//       console.log(err);
//     }

//     db.query(
//       "INSERT INTO login (username, password) VALUES (?,?)",
//       [username, hash],
//       (err, result) => {
//         console.log(err);
//       }
//     );
//   });
// });

app.get("/login", (req, res) => {
  if (req.session.user) {
    res.send({ loggedIn: true, user: req.session.user });
  } else {
    res.send({ loggedIn: false });
  }
});

//Need to add a button that calls this in the pages
app.get("/logout", function(req,res) {
  req.session.destroy();
  res.status(200).send('ok');  
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

app.post("/login", (req, res) => {
  const username = req.body.username;
  const password = req.body.password;
  
  getSubjectInfo(username);
  getAplicationInfo(username);
  getStudentInfo(username);

  db.query(
    "SELECT * FROM login WHERE username = ?;",
    username,
    (err, result) => {
      if (err) {
        res.send({ err: err });
      }
      
      if (result.length > 0) {
        //comparing encripted values
        bcrypt.compare(password, result[0].password, (error, response) => {
          if (response) {
            req.session.user = result;
            studentIndex = req.session.user[0].username; 
            
            //res.send(result);
            //res.sendFile(path.resolve('../docs/index.html'))
            //res.render(path.resolve('../docs/views/home.ejs'))
            res.render("home",{
              prInfo: subInfo,
              appInfo: appInfo,
              sInfo: studentInfo
            });
          } else {
            res.send({ message: "Wrong username/password combination!" });
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
              res.render("home",{
                prInfo: subInfo,
                appInfo: appInfo,
                sInfo: studentInfo
              });
            }else{
              res.send({ message: "User doesn't exist" });
            };
        
           }
        )
      }}
  )
});



app.listen(3000, () => {
  console.log("running server");
 
});