var mongoose = require('mongoose');
// Data Schema
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

let Info = module.exports = mongoose.model('info', infoSchema);