from flask import Flask,render_template
import requests
import json
import os
import boto3

os.environ['AWS_DEFAULT_REGION'] = 'us-west-2'
os.environ['AWS_PROFILE'] = "default"
ssm_client = boto3.client("ssm")


response = requests.get("https://api.themoviedb.org/3/authentication/token/new?api_key=725374be1608b260795fe92a785532b0")
def jprint(obj):
    text = json.dumps(obj, sort_keys=True, indent=4)
    print(text)

new_string_parameter = ssm_client.put_parameter(
    Name='apiToken',
    Description='this my token',
    Value=response.json().get("request_token"),
    Type='SecureString',
    Overwrite=True,
    Tier='Standard')
    

print(
    f"String Parameter created with version {new_string_parameter['Version']} and Tier {new_string_parameter['Tier']}"
)


app = Flask(__name__)

@app.route('/',methods=['GET'])
def index():
  req = requests.get('https://thronesapi.com/api/v2/Characters')
  data = json.loads(req.content)
  return render_template('index.html',data= data)

port = int(os.environ.get('PORT', 8090))
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=port)
