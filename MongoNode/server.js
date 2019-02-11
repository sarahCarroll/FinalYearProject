console.log('Node');

const express = require('express');
const path = require('path');
const app = express();
const mongoose = require('mongoose');
const MongoClient = require("mongodb").MongoClient;

Info = require('./models/info.js');


//app.set('index', path.join(__dirname, 'index.html'));

//let Info = require('./info');


//var mongooseConnectionString = 'mongodb:/' + '/5:27017/reports';

 mongoose.connect("mongodb://localhost:27017/myproject");
 var db = mongoose.connection;
 

 
 app.get('/',function(req, res){
         res.send('Please use /api/info');
});

app.get('/api/info',function(req, res){
         console.log(res.body);
         Info.getInfo(function(err, infos){

                 if(err){
                        throw err;
                 }
                 res.json(infos);
         });
});

app.listen(3000, function() {
  console.log('listening on 3000/')
})

//check for connection
db.once('open', function(){
	console.log('connected to mongodb');
});

//check for errors
db.on('error', function(error){
	console.log(err);
});


/*
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html')
  Info.find({}, function(err, info){
	  res.render('index', {
		  title:'Information',
	  info : info
	  });
  });
  })//app.get
//34.242.41.209/3000 ip lookup*/


