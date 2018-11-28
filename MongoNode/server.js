console.log('Node');

const express = require('express');
const app = express();
const MongoClient = require("mongodb").MongoClient;

app.listen(3000, function() {
  console.log('listening on 3000/')
})



/*app.get('/', (req, res) => {
  res.send('Hello World')
})*/

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html')
  // Note: __dirname is directory that contains the JavaScript source code. Try logging it and see what you get!
  // Mine was '/Users/zellwk/Projects/demo-repos/crud-express-mongo' for this app.
})

app.get("/users", function() {
  MongoClient.connect("mongodb://localhost:27017/test", function(err, db) {
    if (err) next
    db
      .collection("users")
      .find()
      .toArray(function(err, result) {
        if (err) throw err;

        res.json(result)
      });
  });
});
