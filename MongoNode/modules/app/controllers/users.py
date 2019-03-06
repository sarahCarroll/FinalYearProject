''' controller and routes for users '''
import os
from flask import request, jsonify
from app import app, mongo
import logger

ROOT_PATH = os.environ.get('ROOT_PATH')
LOG = logger.get_root_logger(
    __name__, filename=os.path.join(ROOT_PATH, 'output.log'))


@app.route('/data', methods=['GET', 'POST', 'DELETE', 'PATCH'])
def user():
    if request.method == 'GET':
        query = request.args
        data = mongo.db.info.find(query)
        return jsonify(data), 200

    data = request.get_json()
<<<<<<< HEAD
=======

<<<<<<< HEAD

=======
>>>>>>> 0a705798b5d5df6e40460098a66e0ffd9278422b
>>>>>>> 3e7a1b79483ed2c5f41c0523b4e9f927178bcb93
