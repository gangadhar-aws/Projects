#!/bin/bash
####################
# Author: Gangadhar
# Date: 1-6-2024
#
# This script for Track AWS Resources
#
# version: v1
####################
# AWS EC2
# AWS S3
# AWS LAMBDA FUNCTIONS
# AWS IAM USERS
set -x

date +'%d-%m-%Y' >>health_monitor.txt
echo "---------------------------" >>health_monitor.txt
echo "Print list of S3 buckets" >>health_monitor.txt
aws s3 ls |awk -F" " '{print $3}'>>health_monitor.txt



# list Ec2 instances
echo "--------------------------">>health_monitor.txt
echo "List of Ec2 instances" >>health_monitor.txt
aws ec2 describe-instances |jq '.Reservations[].Instances[].InstanceId'>>health_monitor.txt


# list Aws lambda functions
echo "List of Lambda Functions" >>health_monitor.txt
aws lambda list-functions |jq '.Functions[].FunctionName' >>health_monitor.txt


# list Iam users
echo "List of IAM users" >>health_monitor.txt
aws iam list-users |jq '.Users[].UserName' >>health_monitor.txt

echo "-------------------end-------------------" >>health_monitor.txt
