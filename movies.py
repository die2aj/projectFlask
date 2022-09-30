from flask import Flask,render_template
import requests
import json

import os
app = Flask(__name__)

@app.route('/',methods=['GET'])
def index():
  req = requests.get('https://thronesapi.com/api/v2/Characters')
  data = json.loads(req.content)
  return render_template('index.html',data= data)

port = int(os.environ.get('PORT', 3000))
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=port)
