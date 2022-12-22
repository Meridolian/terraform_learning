import pytest
import boto3
import json
from dotenv import dotenv_values
from christmas_lambda.utils.locate import abspath_root


@pytest.fixture
def session(monkeypatch):
    env_files = [".unittests.env", ".aws.env"]
    env_values = {}
    for fname in env_files:
        values = dotenv_values(abspath_root() / fname)
        for key, val in values.items():
            env_values.update({key: val})
    session = boto3.Session(
        aws_access_key_id=env_values["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key=env_values["AWS_SECRET_ACCESS_KEY"],
        aws_session_token=env_values["AWS_SESSION_TOKEN"],
        region_name=env_values["AWS_REGION"],
    )
    return session


@pytest.fixture
def client(session):
    client = session.client("lambda")
    return client


def test_handler(client):
    result = client.invoke(FunctionName="christmas-lambda")
    assert result["StatusCode"] == 200
    pl = json.loads(result["Payload"].read().decode("utf8"))
    assert pl["statusCode"] == 200
    assert pl["body"] == "Merry Christmas 🎄"
