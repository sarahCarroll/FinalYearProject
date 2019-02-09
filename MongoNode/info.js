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
			 
		/*_id: String,
         title: String,
         author: String,*/
    
});

var Info = module.exports = mongoose.model('info', infoSchema);

module.exports.getInfo = function(callback, limit){
         Info.find(callback).limit(limit);
}