''' controller and routes for users '''
import os
from flask import request, jsonify, render_template,request,redirect,url_for # For flask implementation  
from app import app, mongo
import logger
from bson.objectid import ObjectId

ROOT_PATH = os.environ.get('ROOT_PATH')
LOG = logger.get_root_logger(
    __name__, filename=os.path.join(ROOT_PATH, 'output.log'))

@app.route('/data', methods=['GET', 'POST', 'DELETE', 'PATCH'])
def user():
    if request.method == 'GET':
        query = request.args
        output = []
        for a in mongo.db.info.find(query):
            output.append({'_id': a['_id'], 'description' : a['description']})
        
        return jsonify({'multi' : output}), 200

    data = request.get_json()

    if request.method == 'POST':
        if data.get('_id', None) is not None and data.get('description', None) is not None:
            mongo.db.users.insert_one(data)
            return jsonify({'ok': True, 'message': 'created successfully!'}), 200
        else:
            return jsonify({'ok': False, 'message': 'Bad request parameters!'}), 400

    if request.method == 'DELETE':
        if data.get('description', None) is not None:
            db_response = mongo.db.users.delete_one({'description': data['description']})
            if db_response.deleted_count == 1:
                response = {'ok': True, 'message': 'record deleted'}
            else:
                response = {'ok': True, 'message': 'no record found'}
            return jsonify(response), 200
        else:
            return jsonify({'ok': False, 'message': 'Bad request parameters!'}), 400

    if request.method == 'PATCH':
        if data.get('query', {}) != {}:
            mongo.db.users.update_one(
                data['query'], {'$set': data.get('multi', {})})
            return jsonify({'ok': True, 'message': 'record updated'}), 200
        else:
            return jsonify({'ok': False, 'message': 'Bad request parameters!'}), 400


@app.route('/new', methods=['GET'])
def new():
    return render_template('add.html')

@app.route('/view', methods=["GET"])
def viewing(id):
    data = info.find_one({
        '_id': ObjectId(id)

        })
    return render_template('list.html', info=data)

@app.route('/update', methods=['POST'])
def update(id):
    info.update_one({
        '_id': ObjectId(id)
        }, {
            '$set': {
                'description': request.form['description'],
                }
            })
    return render_template('update.html', multi=data)

@app.route('/delete', methods=["POST"])
def remove(id):
    data = delete_many({
        '_id': ObjectId(id)

        })
    return redirect(url_for('list'))


@app.route('/add', methods=["POST"])
def adding():
    info.insert_one({
        '_id': request.form['_id'],
        'description': request.form['description'],         
     
        })
    return redirect(url_for('list'))



                

