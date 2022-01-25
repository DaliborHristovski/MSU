# MSU

To see the project running without building the project I recommend checking out my dockerized of this app: [MSU-Dockerized](https://github.com/DaliborHristovski/MSU-Dockerized)

## About
This app is made for presenting an automation and error reduction in the administrative process of applying for an university exam by using a web-app using a relational database.


### Gulp automation

To start Gulp run CMD or Bash on the location of this project with:

```
gulp watch 
```

Any save to a change to HTML, CSS or JS will cause an inject into browser-sync.


Changes made to the app (development version) of this build will need to be transfered to the docs (production version of the build) by using:

```
gulp build
```

The project has been built with NPM version 6.7.0



It requires an existing initialized Mysql database to build the pages and for authentication of users(students), the settings needed can be found in the server/index.js

```
//conection to a MySQL

const db = mysql.createConnection({

user: "root",

host: "localhost",

password: "Lozinka123",

database: "university"

});
```

Database_Dump is the folder where there is a sql script to create and fill the base with data.

Server is the folder where the express server .js file and can be started  form the location withh the terminal command:

```
npx nodemon index.js
```

### How to navigate the app once running:

Navigate to [localhost](localhost).

Use a number in the range 1-6 as both username and password to log in.

### Rules and restrictions of the app:
- For demonstration purposes  there are 3 active  events highlighted in yellow representing an exam session for an university where subjects from odd, even or both types of semeser can be picked if available.
- The non yellow events can be clicked on to see what subjects were picked on that event.
- The student is allowed to pick up to 5 subjects per event.
