var express = require('express');
const {registerValidator, loginValidator} = require("../middleware/validation");
const { errorPrint, successPrint } = require("../helpers/debug/debugprinters");
const UserError = require("../helpers/error/UserError");
const UserModel = require('../models/Users');
var router = express.Router();
var db = require('../config/database');
var bcrypt = require("bcrypt");


router.post('/register', registerValidator ,(req,res,next) =>{

  let username = req.body.username;
  let email = req.body.email;
  let password = req.body.password;

  UserModel.usernameExists(username)
  .then((userDoesExist) =>{
    if(userDoesExist){
       throw new UserError(
         "Registeration Failed: Username Already exists",
         "/registration",
         200
       );
    } else {
       return UserModel.emailExists(email);
    }
  })
  .then((emailDoesExist) =>{
    if(emailDoesExist){
      throw new UserError(
        "Registeration Failed: Email Already exists",
        "/registration",
        200
      );
    } else {
      return UserModel.create(username, password, email);
    }
  })
  .then((createdUserId) => {
    if(createdUserId < 0) { 
    } else {
      successPrint("User.js --->users was created!!");
      req.flash('success', 'User account has been made!');
      req.session.save( err => {
      res.redirect('/login');
      });  
    }
  })
  .catch((err) => {
    errorPrint("user could not be made", err);
    if (err instanceof UserError) {
      errorPrint(err.getMessage());
      req.flash('error', err.getMessage());
      res.status(err.getStatus());
      res.redirect(err.getRedirectURL());
      
    } else {
      next(err);
    }
  })
 });

router.post("/login", loginValidator ,(req,res,next) => {
  let username = req.body.username;
  let password = req.body.password;

  UserModel.authenticate(username, password)
  .then((loggedUserId)=>{
    if(loggedUserId > 0){
    successPrint(`User ${username} is logged in`);
    req.session.username = username;
    req.session.userId = loggedUserId;
    res.locals.logged = true;
    req.flash('success', 'You Have Successfully logged In!');
    req.session.save( err => {
      res.redirect('/');
    });
    }
    else{
      throw new UserError("Invalid Username and/or Password","/login", 200);
    }
  })
  .catch((err) => {
    errorPrint("user login failed");
    if(err instanceof UserError){
      errorPrint(err.getMessage());
      req.flash('error', err.getMessage());
      res.status(err.getStatus());
      req.session.save( err => {
        res.redirect('/login');
        });
    }else{
      next(err);
    }
  })
})

router.post('/logout', (req, res, next) =>{
  req.session.destroy((err) =>{
    if(err){
      errorPrint('session could not be destroyed.')
      next(err);
    }else{
      successPrint("session was destroyed");
      res.clearCookie('csid');
      res.json({status: "ok", message: "user is logged out"});
    }
  })
});

module.exports = router;
