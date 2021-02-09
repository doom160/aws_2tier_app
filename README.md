Node.js Docker Image simple CRUD
========

Simple Node.js ExpressJS app that performs basic CRUD. This app is wired to Github workflow to perform basic CI/CD, push to ECR and deploy to ECS

## Pre-requisite
1. Follow the steps mentioned in [Terraform Repository](https://github.com/doom160/aws_2tier_tf). It will create the necessary resources such as ECR, ECS, RDS, etc.

It requires following DB schema which can be performed via Lambda function in the above repository.
```
create database test;

use test;

CREATE TABLE users (
id int(11) NOT NULL auto_increment,
name varchar(100) NOT NULL,
age int(3) NOT NULL,
email varchar(100) NOT NULL,
PRIMARY KEY (id)
);
```
2. Create Github secrets for these keys
   * AWS_ACCESS_KEY
   * AWS_SECRET_KEY
   * RDS_USER
   * RDS_PASSWORD
3. Branch off and PR Merge, it will be deployed to Dev ECS cluster
4. Once Workflow completes, run follow command to get ALB Url
`aws elbv2 describe-load-balancers --output text --query "LoadBalancers[?LoadBalancerName =='node-app-lb'].DNSName"`
![Sample App](screenshots/outcome.jpg?raw=true "Sample App")

## CI/CD Workflow
![CI/CD](screenshots/github-workflow.jpg?raw=true "CI/CD")

Since source code is stored in github, it can leverage on existing Github CI/CD i.e. Github workflow. It is ideal to adopt Github Flow branching strategy which is a variant of Thrunk based development.

### DEV
Reference: `.github/workflow/node.yml`
1. Developers branch off from main branch
2. Developers apply the code changes
3. Developer conduct local test before raising pull request
4. Pull request invokes github workflow which performs build,unit test, code scan/lint, docker build, push to ECR, deploy to dev for smoke test, functional test (if any) and tear down. Docker image tag is referenced by commit hash
5. Code can only merged after build is successful, code is reviewed

### UAT
1. Once code is merged into UAT, another workflow can be triggered to deploy the new changes to UAT ECS cluster

### PROD
1. PROD deployment can be applied to any commit that was PR merged earlier
2. Workflow will retag image from commit hash to semantic version and deploy to PROD ECS cluster