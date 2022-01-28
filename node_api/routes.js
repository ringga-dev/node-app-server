'use strict';

module.exports = function(app) {
    var todoList = require('./controller');

    app.route('/')
        .get(todoList.index);

    app.route('/users')
        .get(todoList.users);

    app.route('/users/:id')
        .get(todoList.userId)

    app.route('/user')
        .get(todoList.userName)

    app.route('/user/login')
        .post(todoList.userLogin)

    app.route('/user/register')
        .post(todoList.userRegister)


};