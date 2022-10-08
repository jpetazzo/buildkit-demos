#!/bin/sh
# Check https://cloud-images.ubuntu.com/locator/ for image ids

# 20.04
#AMI=ami-0a0929d6a878fe378

# 22.04
AMI=ami-0c0f5f4411004770e

aws ec2 run-instances --key-name=SHA256Ii-jp --instance-type=t4g.medium --image-id=$AMI
