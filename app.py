# credit: https://github.com/stevengill/slack-python-oauth-example
import os
import time
import threading
import slack
from flask import Flask, request

client_id = os.environ["SLACK_CLIENT_ID"]
client_secret = os.environ["SLACK_CLIENT_SECRET"]
signing_secret = os.environ["SLACK_SIGNING_SECRET"]
output_file = os.environ["OUTPUT_FILE"]
app = Flask(__name__)

def check_completed():
    while completed is None:
        time.sleep(1)
    time.sleep(1)
    os._exit(0)

completed = None
thread = threading.Thread(target=check_completed)
thread.start()

@app.route("/", methods=["GET", "POST"])
def post_install():
  global completed
  auth_code = request.args["code"]

  client = slack.WebClient()
  response = client.oauth_access(
        client_id=client_id,
        client_secret=client_secret,
        code=auth_code
  )
  token = response["access_token"]

  with open(output_file, "w") as file:
      file.write(token)
  completed = True
  return token
