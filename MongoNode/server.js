console.log('Node');

const express = require('express');
const app = express();
const MongoClient = require("mongodb").MongoClient;

app.listen(3000, function() {
  console.log('listening on 3000/')
})

// Database Name
const dbName = 'myproject';

/*app.get('/', (req, res) => {
  res.send('Hello World')
})*/

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html')
  // Note: __dirname is directory that contains the JavaScript source code. Try logging it and see what you get!
  // Mine was '/Users/zellwk/Projects/demo-repos/crud-express-mongo' for this app.
})
//34.242.41.209/3000 ip lookup

app.get("/users", function() {
  MongoClient.connect("mongodb://localhost:27017/myproject", function(err, db) {
    if (err) next
    db
      .collection("users")
      .find()
      .toArray(function(err, result) {
        if (err) throw err;

        res.json(result)
      });
  });
  
   if (err) {
        console.log('Sorry unable to connect to MongoDB Error:', err);
    } else {
 
        var bucket = new mongodb.GridFSBucket(db, {
            chunkSizeBytes: 1024,
            bucketName: 'images'
        });
 
        fs.createReadStream('C:\Users\Administrator\Desktop\explore.jpg').pipe(
            bucket.openUploadStream('explore.jpg')).on('error', function(error) {
            console.log('Error:-', error);
        }).on('finish', function() {
            console.log('File Inserted!!');
            process.exit(0);
        });
    }
});

   