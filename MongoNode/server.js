console.log('Node');

const express = require('express');
const path = require('path');
const app = express();
const mongoose = require('mongoose');
const MongoClient = require("mongodb").MongoClient;






app.set('index', path.join(__dirname, 'index.html'));

let info = require('./info');

//var mongooseConnectionString = 'mongodb:/' + '/5:27017/reports';

 mongoose.connect("mongodb://localhost:27017/myproject");
 let db = mongoose.connection;
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

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html')
  })
//34.242.41.209/3000 ip lookup
