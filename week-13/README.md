## In AWS Cloud9 create workspace ec2 instance type

- configure git username and password

git config --global user.name "Nikola Milovanovic"
git config --global user.email nikola.milovanovic.jd@gmail.com

- configure the AWS CLI credential helper for HTTPS connections

git config --global credential.helper '!aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true

- install gitflow

curl -OL https://raw.github.com/nvie/gitflow/develop/contrib/gitflow-installer.sh
chmod +x gitflow-installer.sh
sudo git config --global url."https://github.com".insteadOf git://github.com
sudo ./gitflow-installer.sh

- create and clone repository in AWS CodeCommit

aws codecommit create-repository --repository-name gitflow-workshop --repository-description "Repository for Gitflow Workshop"
git clone https://git-codecommit.us-east-1.amazonaws.com/v1/repos/gitflow-workshop

- download application

ASSETURL="https://static.us-east-1.prod.workshops.aws/public/442d5fda-58ca-41f0-9fbe-558b6ff4c71a/assets/workshop-assets.zip"; wget -O gitflow.zip "$ASSETURL"

- unzip application

unzip gitflow.zip -d gitflow-workshop/

- change directory

cd gitflow-workshop

- commit changes and push to CodeCommit repository

git add -A
git commit -m "Initial Commit"
git push origin master



## Create Elastic Beanstalk Application

- command to create cloudformation stack

aws cloudformation create-stack --template-body file://appcreate.yaml --stack-name gitflow-eb-app



## Master environment

You can deploy multiple environments when you need to run multiple versions of an application. For example, you might have development, integration, and production environments

- command to created stack 

aws cloudformation create-stack --template-body file://envcreate.yaml --parameters file://parameters.json --capabilities CAPABILITY_IAM --stack-name gitflow-eb-master

First time executing command there is error, resolution is changing node version inside envcreate.yaml and creating IAM role named aws-elasticbeanstalk-ec2-role and adding all policies for ebs 



## Lambda

- to create lambda stack execute command

aws cloudformation create-stack --template-body file://lambda/lambda-create.yaml --stack-name gitflow-workshop-lambda --capabilities CAPABILITY_IAM

There will be error, resolution for creation is to change lambda-create.yaml file:
For property "S3Bucket:" go in s3 buckets and copy name of bucket starting with elasticbeanstalk
For propert "S3Key:" in s3 bucket console enable kms encription and use s3 encription key. Copy key arn and put it in file on desktop and zip that file.
Than go in s3 console and upload zipped file to s3 bucket. Than set name of that file under property "S3Key:"

After this changes stack will be deployed successfull

Two lambda functions will be created for create and delete.
They are tested from CodeCommit triger that will call lambda



## Developmen environment

- create new branch develop by executing:

git flow init

- to create new develop env manually execute:

 aws cloudformation create-stack --template-body file://envcreate.yaml --parameters file://parameters-dev.json --capabilities CAPABILITY_IAM --stack-name gitflow-workshop-develop



## Feature branch

- execute command to create branch:

git flow feature start change-color

- change color to green in index.html and push changes

- to create env manually execute:

aws cloudformation create-stack --template-body file://envcreate.yaml --capabilities CAPABILITY_IAM --stack-name gitflow-workshop-changecolor --parameters ParameterKey=Environment,ParameterValue=gitflow-workshop-changecolor ParameterKey=RepositoryName,ParameterValue=gitflow-workshop ParameterKey=BranchName,ParameterValue=feature/change-color

 

## Cleanup
 
- Delete Develop & Master Environments

aws cloudformation delete-stack --stack-name gitflow-eb-master
aws cloudformation delete-stack --stack-name gitflow-workshop-develop

- Delete Feature Environment

aws cloudformation delete-stack --stack-name gitflow-workshop-feature-change-color

- Delete Lambda Functions

aws cloudformation delete-stack --stack-name gitflow-workshop-lambda

- Delete Elastic Beanstalk Application

aws cloudformation delete-stack --stack-name gitflow-eb-app

- Delete code commit repository

aws codecommit delete-repository --repository-name gitflow-workshop

- Delete AWS Cloud9
In the AWS Cloud9 console, highlight your Cloud9 workspace and select Delete
