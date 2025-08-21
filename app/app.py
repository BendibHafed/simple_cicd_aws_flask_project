from flask import Flask
import awsgi  # provided by aws-wsgi

app = Flask(__name__)


@app.route("/")
def hello():
    return "Hello CI/CD!! I am a DevOps eng."


def lambda_handler(event, context):
    return awsgi.response(app, event, context)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
