## aws-jupyter create -c 1 --name test --type m3.xlarge
./LOCALSCRIPT.sh


aws-jupyter send-dir --local ~/DSC291 --remote /home/ubuntu/
pip install psutil
sudo chmod a+rwx -R workspace



## do you know how to give the parameters?? it

sleep 180
mkdir from_remote
aws-jupyter retrieve --remote /home/ubuntu/workspace/stats.pkl --local from_remote/

aws-jupyter terminate


# script for local
aws-jupyter create -c 1 --name test --type m3.xlarge

LOCALSCRIPT.SH
aws-jupyter send-dir --local ~/DSC291 --remote /home/ubuntu/
aws-jupyter run --script {SCRIPT FOR REMOTE}
sleep 
aws-jupyter retrieve --remote /home/ubuntu/workspace/stats.pkl --local from_remote/
aws-jupyter terminate

REMOTESCRIPT.SH
# script for remote
pip install psutil
python hw2HACK.py

