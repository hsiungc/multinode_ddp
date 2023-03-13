# Setup Commands
# Each command should be run separately

# Train and validation tar file processing
tar -xvf xxxxxxxx.tar
sh run_train.sh
sh run_val.sh
sh run_tar.sh

# VM Setup
# Once both VMs are running, make sure the following are installed
pip install nfs-common
pip install nvidia-nccl

# EBS Mounting and formatting
mkfs -t ext4 /dev/xvdf
mount /dev/xvdf /data

# EFS Mounting and syncing
mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport 172.31.47.16:/ /data/efs

# Run docker container
docker run --rm -v /data:/data --net=host --gpus=all -ti nvcr.io/nvidia/pytorch:23.02-py3 bash
cd /data && jupyter lab --ip=0.0.0.0 --allow-root

# Check NVIDIA SMI
nvidia-smi