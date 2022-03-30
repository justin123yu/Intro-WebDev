const { errorPrint, successPrint } = require("../helpers/debug/debugprinters");
const routeProtector ={};
routeProtector.userIsLoggedIn = function(req, res, next){
    if(req.session.username){
        successPrint("User is logged In");
        next();
    } else {
        errorPrint("User is not logged In");
        req.flash('error', 'You must be logged in to create a Post!');
        res.redirect('login');
    }
}


module.exports = routeProtector;