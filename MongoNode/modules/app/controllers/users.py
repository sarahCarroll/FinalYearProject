''' controller and routes for users '''
import os
from flask import request, jsonify, render_template,request,redirect,url_for # For flask implementation  
from app import app, mongo
import logger
from bson.objectid import ObjectId

ROOT_PATH = os.environ.get('ROOT_PATH')
LOG = logger.get_root_logger(
__name__,filename=os.path.join(ROOT_PATH, 'output.log'))

#Methods used in crud, each are used for different functionalities
@app.route('/data', methods=['GET', 'POST', 'DELETE', 'PATCH'])
#this method is used to be able read the database
#It uses a mongoDB query to search for the id and description
def user():
    if request.method == 'GET':
        query = request.args
        output = []
        for a in mongo.db.info.find(query):
            output.append({'_id': a['_id'], 'description' : a['description']})
        
        return jsonify({'multi' : output}), 200

    data = request.get_json()
    
    #These were to test the crud functionalities but they are not woking for the CRUD
    #This post method is to add stuff to the database it ass an id and a description
    #This uses the insert query
    if request.method == 'POST':
        if data.get('_id', None) is not None and data.get('description', None) is not None:
            mongo.db.info.insert_one(data)
            return jsonify({'ok': True, 'message': 'created successfully!'}), 200
        else:
            return jsonify({'ok': False, 'message': 'Bad request parameters!'}), 400

    #The delete method deleted the description from the database
    #It is using the Delete method and mongo query to delete
    if request.method == 'DELETE':
        if data.get('description', None) is not None:
            db_response = mongo.db.info.delete_one({'description': data['description']})
            if db_response.deleted_count == 1:
                response = {'ok': True, 'message': 'record deleted'}
            else:
                response = {'ok': True, 'message': 'no record found'}
            return jsonify(response), 200
        else:
            return jsonify({'ok': False, 'message': 'Bad request parameters!'}), 400

    #Patch is to update the database
    if request.method == 'PATCH':
        if data.get('query', {}) != {}:
            mongo.db.info.update_one(
                data['query'], {'$set': data.get('multi', {})})
            return jsonify({'ok': True, 'message': 'record updated'}), 200
        else:
            return jsonify({'ok': False, 'message': 'Bad request parameters!'}), 400

#The routes used to test the HTML
#This is used to call HTML pages
@app.route('/new', methods=['GET'])
def new():
    return render_template("add.html")

# Was testing the view page to find the id in the database
@app.route('/view', methods=["GET"])
def viewing():
    data = mongo.db.info.find_one({
    '_id': ObjectId()
     #   '_id': data['_id']

        })
    return render_template("list.html", _id=data )

#Was set to update the database with a post request
#Trying to use a mongoDB
@app.route('/update', methods=['POST'])
def update():
    data = mongo.db.info.update_one({
        '_id': ObjectId()
        }, {
            '$set': {
                'description': request.form['description'],
                }
            })
    return render_template("update.html", _id=data)

#The delete request works but it just deletes the first field in the database
#this is using a for loop to find the id in the database
@app.route('/delete', methods=["POST"])
def remove():  
    q = request.args
    out =[]
    for a in mongo.db.info.delete_one(q):
        out({_id: a['5c62f1b168b454424c0d8e15']})
    #dbR=  mongo.db.info.delete_one({
     #   '_id': request.form['_id']
      #  })
    if dbR.deleted_count == 1:
        response = {'ok': True, 'message': 'record deleted'}
    else:
        response = {'ok': True, 'message': 'no record found'}
    return jsonify(response), 200
        #'_id': ObjectId()
        #})
    #return redirect(url_for('list'))

@app.route('/add', methods=["POST"])
def adding():
    mongo.db.info.insert_one({
        '_id': request.form['_id'],
        'description': request.form['description'],         
     
        })
    return redirect(url_for("list"))


if __name__ == '__main__':
LOG.run(debug=True)

                

