var mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "my_apps"
});

con.connect(function(err) {
    if (err) throw err;
});

module.exports = con;