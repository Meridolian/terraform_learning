import boto3


def lambda_handler(event, context):
    result = "Merry Christmas 🎄"
    return {
        "statusCode": 200,
        "body": result
    }
