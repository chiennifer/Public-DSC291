#!/bin/bash
# -----------------------------------------------------------------------------------------------
### run this on your local terminal
### for m5large the total time took approx (10:45, )
### for m5xlarge the total time took approx (10:55, )
### for m52xlarge the total time took approx (10:58, )
# -----------------------------------------------------------------------------------------------
## aws-jupyter create -c 1 --name test2 --type m5.2xlarge
# ./LOCALSCRIPT.sh

# -----------------------------------------------------------------------------------------------
### THIS IS THE ACTUAL BODY OF THE SCRIPT
# -----------------------------------------------------------------------------------------------
aws-jupyter send-dir --local ~/Desktop/DSC291/Public-DSC291/hw2 --remote /home/ubuntu/workspace/
aws-jupyter run --script REMOTESCRIPT.sh

# -----------------------------------------------------------------------------------------------
### to check when the hw2.py file is done, i have a print statement at the end that should be 
### added to the /tmp/stdout.log file so you can type 
### tail -f /tmp/stdout.log 
### and when you see the final print statement you can run the rest of the commands
# -----------------------------------------------------------------------------------------------
# mkdir from_remote
# aws-jupyter retrieve --remote /tmp/stderr.log --local from_remote/
# aws-jupyter retrieve --remote /tmp/stdout.log --local from_remote/
# aws-jupyter retrieve --remote /home/ubuntu/workspace/stats.csv --local from_remote/
# aws-jupyter terminate