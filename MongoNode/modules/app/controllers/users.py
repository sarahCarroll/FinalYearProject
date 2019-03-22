''' controller and routes for users '''
import os
from flask import request, jsonify, render_template,request,redirect,url_for # For flask implementation  
from app import app, mongo
import logger


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
 
# @app.route("/list")  
# def lists ():  
#     #Display the all Tasks  
#     mongo.db.info.find()  
#     a1="active"  
#     return render_template('index.html',info=info,t=title,h=heading)  
 
# @app.route("/action", methods=['POST'])  
# def action ():  
#     #Adding a Task  
#     description=request.values.get("description")  
#     mongo.db.info.insert({ "description":description,"done":"no"})  
#     return redirect("/list")  
 
# @app.route("/remove")  
# def remove ():  
#     #Deleting a Task with various references  
#     key=request.values.get("_id")  
#     mongo.db.info.remove({"_id":ObjectId(key)})  
#     return redirect("/")  
 
# @app.route("/update")  
# def update ():  
#     id=request.values.get("_id")  
#     mongo.db.info.find({"_id":ObjectId(id)})  
#     return render_template('update.html',tasks=task,h=heading,t=title)  
 
# @app.route("/action3", methods=['POST'])  
# def action3 ():  
#     #Updating a Task with various references  
#     description=request.values.get("description")  
#     id=request.values.get("_id")  
#     info.update({"_id":ObjectId(id)}, {'$set':{ "description":description }})  
#     return redirect("/") 

#     if __name__ == "__main__":  
  
#       app.run()