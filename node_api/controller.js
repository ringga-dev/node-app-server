'use strict';

var response = require('./res');
var connection = require('./conn');
const bcrypt = require('bcrypt');
/**get dengan tampa ada parameter apapun   url (http://localhost:3000/users)*/
exports.users = function(req, res) {
    connection.query('SELECT * FROM user_app', function(error, rows, fields) {
        if (error) {
            console.log(error)
        } else {
            response.ok(rows, res)
        }
    });
};
/**get dengan parameter tidak di devinisikan   url (http://localhost:3000/users/223)*/
exports.userId = function(req, res) {
    connection.query("SELECT * FROM user_app WHERE user_app.id_bet=" + req.params.id, function(error, rows, fields) {
        if (error) {
            console.log(error)
        } else {
            response.ok(rows, res)
        }
    });

};

/**get dengan multi parameter yang di devinisikan url (http://localhost:3000/users?id=223&id_bet=21-4905)*/
exports.userName = function(req, res) {
    connection.query("SELECT * FROM user_app WHERE id=" + `${req.query.id} AND id_bet=` + `'${req.query.id_bet}'`, function(error, row, fields) {
        if (error) {
            console.log(error)
        } else {
            response.ok(row[0], res)
        }
    });

};

/** login user degan email dan password http://localhost:3000/user/login */
exports.userLogin = function(req, res) {
    var email = req.body.email;
    var password = req.body.password;
    connection.query("SELECT * FROM `mas_users` WHERE email = " + `'${email}'`, async function(error, row, fields) {

        if (error) {
            console.log(error)
        } else {
            if (count(row) < 1) {
                response.ok("user belum terdaftar")
            }
            const hashedPassword = row[0].password
            if (await bcrypt.compare(password, hashedPassword)) {
                response.ok(row[0], res)
            } else {
                response.ok('password yang di masukkan salah', res)
            }
        }
    })
}


/** Register user dengan mengisi data di bawah ini  http://localhost:3000/user/register*/
exports.userRegister = async function(req, res) {
    const hashedPassword = await bcrypt.hash(req.body.password, 10);
    let password = encrypt(req.body.password).toString()
    connection.query("INSERT INTO `mas_users` (`id`,  `email`,  `username`,  `phone`,  `name`,  `password`,`alamat`,  `role`)" +
        ` VALUES('', '${req.body.email}','${req.body.username}','${req.body.phone}', '${req.body.name}','${hashedPassword}','${req.body.alamat}','${req.body.role}')`,
        function(error, row, fields) {
            if (!error) {
                response.ok("record inserted!", res)
            } else {
                console.log(error);
            }
        })
}



exports.index = function(req, res) {
    response.ok("Hello from the Node JS RESTful side!", res)
};


// Nodejs encryption with CTR
const crypto = require('crypto');
const { count } = require('console');
const algorithm = 'aes-256-cbc';
const key = crypto.randomBytes(32);
const iv = crypto.randomBytes(16);

function encrypt(text) {
    let cipher = crypto.createCipheriv(algorithm, Buffer.from(key), iv);
    let encrypted = cipher.update(text);
    encrypted = Buffer.concat([encrypted, cipher.final()]);
    return JSON.stringify({ iv: iv.toString('hex'), encryptedData: encrypted.toString('hex') });
}

function decrypt(text) {
    let iv = Buffer.from(text.iv, 'hex');
    let encryptedText = Buffer.from(text.encryptedData, 'hex');
    let decipher = crypto.createDecipheriv(algorithm, Buffer.from(key), iv);
    let decrypted = decipher.update(encryptedText);
    decrypted = Buffer.concat([decrypted, decipher.final()]);
    return decrypted.toString();
}

// var hw = encrypt("Some serious stuff")
// console.log(hw)
// console.log(decrypt(hw))