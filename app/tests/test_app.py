import sys, os
print("sys.path =", sys.path)
print("cwd =", os.getcwd())

from app.app import app


def test_hello():
    client = app.test_client()
    response = client.get("/")
    assert response.status_code == 200
    assert response.data.decode() == "Hello CI/CD"
