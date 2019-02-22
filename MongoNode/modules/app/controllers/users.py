''' controller and routes for users '''
import os
from flask import request, jsonify
from app import app, mongo
import logger
import pymongo

ROOT_PATH = os.environ.get('ROOT_PATH')
LOG = logger.get_root_logger(
    __name__, filename=os.path.join(ROOT_PATH, 'output.log'))


@app.route('/data', methods=['GET', 'POST', 'DELETE', 'PATCH'])
def user():
    if request.method == 'GET':
        query = request.args
        data = mongo.db.info.find_one(query)
        return jsonify(data), 200

    data = request.get_json()