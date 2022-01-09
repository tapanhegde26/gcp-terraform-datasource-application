#!/bin/bash
sudo apt-get update -y
sudo apt-get install -yq build-essential python-pip rsync
sudo apt-get install wget -y
pip install flask
sudo touch /tmp/app.py
sudo mkdir /tmp/templates
sudo chmod 777 /tmp/templates
sudo touch /tmp/templates/index.html
sudo cat << "EOF" > /tmp/templates/index.html
<!DOCTYPE html>
<html>
<style>
body {
  font-size: 100px;
}
p {text-align: center;}
</style>
<body>

<span style='font-size:500px;text-align:center'>&#127785;</span>
<p>Welcome to the Cloud &#128515;</p>

</body>
</html>
EOF
sudo chmod 777 /tmp/templates/index.html
sudo cat << "EOF" > /tmp/app.py
from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def index():
   return render_template('index.html')

app.run(host='0.0.0.0')
EOF
sudo chmod 777 /tmp/app.py
sudo python /tmp/app.py
