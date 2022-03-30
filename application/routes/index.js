var express = require('express');
var router = express.Router();
var isLoggedIn = require('../middleware/routeprotector').userIsLoggedIn;
const {getRecentPosts, getPostById, getCommentsByPostId } = require('../middleware/postsmiddleware');
var db = require('../config/database');

/* GET home page. */
router.get('/', getRecentPosts ,function(req, res, next) {
  res.render('index', { title: 'App Media Society', name:"User"} );
});

router.get('/login', function (req, res, next) {
  res.render('login', { title: 'App Media Society' , });
})

router.use('/postimage', isLoggedIn); 
router.get('/postimage', function (req, res, next) {
  res.render('postimage', { title: 'App Media Society',});
})

router.get('/registration',function(req,res,next){
  res.render("registration"), {title: "App Media Society"};
})

router.get('/viewpost', function(req, res, next) {
  res.render("viewpost"), {title: "App Media Society"};
})

router.get('/post/:id(\\d+)', getPostById, getCommentsByPostId, (req, res, next) =>{

      res.render( 'viewpost', {title: `Post ${req.params.id}`});

});

module.exports = router;
