let mysql = require('mysql');

let connnection = mysql.createConnection({
    user: "root",
    host: "localhost",
    password: "Lozinka123",
    database: "todoapp",
});

connnection.connect(function(err){
if(err){
    return console.error('error: ' + err.message);
}
var pool = mysql.createPool({
    connectionLimit: 5,
    host: 'localhost',
    user: 'root',
    password: '', 
    database: 'todoapp'
});


pool.getConnection(function(err, connection) {
    // execute query
    // ...
    connnection.release();
  });

console.log('Connected to the MySQl server.')
});

connection.end(function(err) {
    if (err) {
      return console.log('error:' + err.message);
    }
    console.log('Close the database connection.');
  });

  pool.end(function(err) {
    if (err) {
      return console.log(err.message);
    }
    // close all connections
  });