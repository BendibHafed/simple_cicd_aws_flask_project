from flask import Flask
from awslambdaric.lambda_context import LambdaContext
from aws_lambda_wsgi import response as wsgi_response

app = Flask(__name__)


@app.route("/")
def hello():
    return "Hello CI/CD"


def lambda_handler(event, context: LambdaContext):
    from aws_lambda_wsgi import handle_request
    return handle_request(app, event, context)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
