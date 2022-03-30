const checkUsername = (username) => {
    let x = true;

     if((username.charAt(0).match(/^[a-zA-Z]/) && username.length >= 3) == false){
         x = false;
     }
    return x;
}

const checkPassword = (password) => {
    let x;
    if (password.match(/([/*+!@#$^&*-])+/)){
        x = true
    }
    else{
        x = false;
    }
    if(password.match(/([\d])+/)){
        x = true;
    }
    else{
        x = false;
    }
    if(password.match(/[A-Z]+/)){
        x = true;
    }
    else{
        x = false;
     }
    if(password.length >= 8){
        x = true;
    }
    else{
        x = false;
    }
}

const checkEmail = (email) => {
    let x = false;
    let emailvalid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if(email.match(emailvalid)){
        x = true;
    }
    return x;
}

const registerValidator= (req, res, next) =>{
    let username = req.body.username;
    let email = req.body.email;
    let password = req.body.password;
    if(checkUsername(username) == false){
        req.flash('error', 'invalid username !!!');
        req.session.save(err =>{
            res.redirect('/registration');
        })
    }
    if(checkPassword(password) == false){
        req.flash('error', 'invalid password !!!');
        req.session.save(err =>{
            res.redirect('/registration');
        })
    }
    if(checkEmail(email) == false){
        req.flash('error', 'invalid email !!!');
        req.session.save(err =>{
            res.redirect('/registration');
        })
    }
    else{
        next();
    }

}

const loginValidator= (req, res, next) =>{
    let username = req.body.username;
    let password = req.body.password;

    if(username == undefined){
        req.flash('error', 'invalid username !!!');
        req.session.save(err =>{
            res.redirect('/login');
        });
    }
    if(password == undefined){
        req.flash('error', 'invalid password !!!');
        req.session.save(err =>{
            res.redirect('/login');
        })
    }
    else{
        next();
    }

}
module.exports = {registerValidator, loginValidator}