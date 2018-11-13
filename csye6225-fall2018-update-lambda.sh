#!/usr/bin/env bash
pwd
ls -al

set -e lambdaName=$(aws lambda list-functions --region us-east-1 --query 'Functions[0].FunctionName' --output text)

echo "Name of lambda function is "$lambdaName

echo "updating {$lambdaName} function"

aws lambda update-function-code --zip-file=file://lambda_deployment/lambda-dpk-nmn.zip --region=us-east-1 --function-name=$lambdaName
