''' controller and routes for users '''
import os
from flask import request, jsonify, render_template,request,redirect,url_for # For flask implementation  
from bson.objectid import ObjectId # For ObjectId to work 
from app import app, mongo
import logger


ROOT_PATH = os.environ.get('ROOT_PATH')
LOG = logger.get_root_logger(
    __name__, filename=os.path.join(ROOT_PATH, 'output.log'))

# def redirect_url():  
#     return request.args.get('next') or \  
#            request.referrer or \  
#            url_for('index') 

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
        if data.get('name', None) is not None and data.get('email', None) is not None:
            mongo.db.users.insert_one(data)
            return jsonify({'ok': True, 'message': 'User created successfully!'}), 200
        else:
            return jsonify({'ok': False, 'message': 'Bad request parameters!'}), 400

    if request.method == 'DELETE':
        if data.get('email', None) is not None:
            db_response = mongo.db.users.delete_one({'email': data['email']})
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
                data['query'], {'$set': data.get('payload', {})})
            return jsonify({'ok': True, 'message': 'record updated'}), 200
        else:
            return jsonify({'ok': False, 'message': 'Bad request parameters!'}), 400
# @app.route("/list")  
# def lists ():  
#     #Display the all Tasks  
#     infos=mongo.db.info.find()  
#     a1="active"  
#     return render_template('index.html', a1=a1,information=infos)  
 
# @app.route("/action", methods=['POST'])  
# def action ():  
    # if data.get('_id', None) is not None and data.get('description', None) is not None:
    #     mongo.db.info.insert_one(data)
    #     return jsonify({'ok': True, 'message': 'User created successfully!'}), 200
    # else:
    #     return jsonify({'ok': False, 'message': 'Bad request parameters!'}), 400
#     #Adding a Task  
#     description=request.values.get("description")  
#     mongo.db.info.insert({ "description":description,"done":"no"})  
#     return redirect("/list")  
 
# @app.route("/remove",  methods=['DELETE'])  
# def remove ():  
    # if data.get('_id', None) is not None:
    #             project_db = mongo.db.info.delete_one({'_id': data['_id']})
    #             if project_db.deleted_count == 1:
    #                 response = {'ok': True, 'message': 'record deleted'}
    #             else:
    #                 response = {'ok': True, 'message': 'no record found'}
    #             return jsonify(response), 200
    #         else:
    #             return jsonify({'ok': False, 'message': 'Bad request parameters!'}), 400
#     #Deleting a Task with various references  
#     key=request.values.get("_id")  
#     mongo.db.info.remove({"_id":ObjectId(key)})  
#     return redirect("/")  
 
# @app.route("/update", methods=['Patch'])  
# def update ():  
        # if data.get('query', {}) != {}:
        #     mongo.db.info.update_one(
        #         data['query'], {'$set': data.get('description', {})})
        #     return jsonify({'ok': True, 'message': 'record updated'}), 200
        # else:
        #     return jsonify({'ok': False, 'message': 'Bad request parameters!'}), 400
#     id=request.values.get("_id")  
#     task=mongo.db.info.find({"_id":ObjectId(id)})  
#     return render_template('update.html', tasks=task)  
 
# @app.route("/action3", methods=['POST'])  
# def action3 ():  
#     #Updating a Task with various references  
#     description=request.values.get("description")  
#     id=request.values.get("_id")  
#     mongo.db.info.update({"_id":ObjectId(id)}, {'$set':{ "description":description }})  
#     return redirect("/") 

#     # if __name__ == "__main__":  
  
#     #   app.run()