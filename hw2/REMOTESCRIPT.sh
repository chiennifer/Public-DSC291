#!/bin/bash
pip install psutil

wget http://s3.amazonaws.com/ec2metadata/ec2-metadata
chmod u+x ec2-metadata

./ec2-metadata -i

python hw2/hw2.py