#!/bin/bash
# -----------------------------------------------------------------------------------------------
### run this on your local terminal
### for m5large the total time took approx (10:45, )
### for m5xlarge the total time took approx (9:54, )
### for m52xlarge the total time took approx (4:25, )
### for m54xlarge the total time took approx (11:00, )
# -----------------------------------------------------------------------------------------------
## aws-jupyter create -c 1 --name testm5large --type m5.large # 
## aws-jupyter create -c 1 --name testm5xlarge --type m5.xlarge # 
## aws-jupyter create -c 1 --name test52xlarge --type m5.2xlarge # 
## aws-jupyter create -c 1 --name test54xlarge --type m5.4xlarge # 
## aws-jupyter create -c 1 --name test54xlargeFINAL --type m5.4xlarge # 
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