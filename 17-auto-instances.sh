#!/bin/bash

AMI_ID="ami-0220d79f3f480ecf5"
SG_ID="sg-031674407f289d035"
INSTANCE_TYPE="t2.micro"


for instance in $@
do
 INSTANCE_ID=$(aws ec2 run-instances  --image-id $AMI_ID  --instance-type $INSTANCE_TYPE --security-group-ids $SG_ID --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value="'$instance'"}]' --query 'Instances[0].InstanceId' --output text')


 if [ $instance != "frontend" ]; then
    IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].Instances[0].PrivateIpAddress' --output text)
 else
    IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)
 fi 

done

echo "$instance: $IP"