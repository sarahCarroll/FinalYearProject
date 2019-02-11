var mongoose = require('mongoose');
// Data Schema
console.log("hi");
var infoSchema = mongoose.Schema({
	
         title:{
			 type: String,
			 required: true
		 },
		 author:{
			 type: String,
			 required: true
		 },
		 body:{
			 type: String,
			 required: true
			 }
    
});

var Info = module.exports = mongoose.model('Info', infoSchema);

// get info
module.exports.getInfo = function(callback, limit){
         Info.find(callback).limit(limit);
}