
var errorUsername = [];
var correctUsername = [];
var correctPassword = [];
var errorPassword = [];
var errorConfirm = [];

function clearBox(tmp){
    document.getElementById(tmp).innerHTML = "";
}

function iterate(id , array){
    let message = "";
    for(let i = 0; i < array.length; i++){
         message += array[i] + "<br>";
    }
    document.getElementById(id).innerHTML = message.fontcolor("red");
}

function password(){
    let x = true;
    let password = document.getElementById("password").value;
    if (password.match(/([/*+!@#$^&*-])+/)){
        correctPassword.push("Password contains a special character")
        x = true
    }
    else{
        errorPassword.push("Password does not contain a special character")
        x = false;
    }
    if(password.match(/([\d])+/)){
        correctPassword.push("Password contains a Number")
        x = true;
    }
    else{
        errorPassword.push("Password doesn't contain a number")
        x = false;
    }
    if(password.match(/[A-Z]+/)){
        correctPassword.push("Password contains an Capital Letter");
        x = true;
    }
    else{
        errorPassword.push("Password doesn't contain a Capital Letter")
        x = false;
     }
    if(password.length >= 8){
        correctPassword.push("Password is within 8 characters");
        x = true;
    }
    else{
        errorPassword.push("Password isn't within 8 Character or more")
        x = false;
    }
    if(errorPassword.length > 0){
        iterate("errorPassword", errorPassword);
        errorPassword = [];
    }
        return x;
}
function confirmPassword(){
    let x = true;
    let confirmPassword = document.getElementById("confirm").value;
    let password = document.getElementById("password").value;
    if(!(confirmPassword === password)){
        x = false;
       errorConfirm.push("The Password is not the same");
       iterate("confirmError", errorConfirm);
       errorConfirm = [];
    }
    else if(confirmPassword === password){
            x = true;
    }
    return x;
    

}

function username(){
    let x = false;
    let username = document.getElementById("username").value;
    if(username.charAt(0).match(/^[a-zA-Z]/)){
        correctUsername.push("First character is within a - z and A - Z\n");
        x = true;
    }
    if(username.length >= 3){
        correctUsername.push("Username is more than 3 character\n");
        x = true;
    }
    if(!username.charAt(0).match(/^[a-zA-Z]/)){
        errorUsername.push("First character is not within a - z and A - z\n");
        x = false;
    }
    if(username.length < 3){
        errorUsername.push("Username is not within 3 character\n");
        x = false;
    }
    if(errorUsername.length > 0){
        iterate("errorUsername",errorUsername);
        errorUsername = [];
    }
    if(!(correctUsername.length == 2)){
        correctUsername = []
    }
    return x;
}
function validForm(){
    let x = false;
        username();
        password();
        confirmPassword();
        clearBox("errorUsername");
        clearBox("errorPassword");
        clearBox('confirmError');
        if((username()) && (password()) && (confirmPassword()) == true){
            x = true;
            alert("Submited")
        }
        return x;
}


