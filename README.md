# 251-hsiungc-hw9
The purpose of HW9 is to gain exposure to multi-node DDP using PyTorch's DDP module. Performance on a single-GPU EC2 instance is compared to performance on two single-GPU EC2 instances (DDP).

All comparisons are done using AWS g5.2xlarge instances.

## Homework Background
The Single-GPU Instance trains and validates a ResNet18 model on ImageNet images through a Jupyter Lab notebook deployed through a Docker container. Both PyTorch Automated Mixed Precision and wandb are implemented. This 

Jupyter Lab is run in Docker containers that each sit on EC2 g5.2xlarge instances. Within two of the same notebooks, ResNet18 models are trained and validated on ImageNet images.



## Dataset Summary
A g2.xlarge EC2 instance was used to extract the ImageNet data for training and validation. The dataset was extracted and processed into two EBS volumes, which were then mounted to each EC2 DDP instance.

EFS was initially used but could not rsync in time. Thus EBS volumes were used instead.

## Additional Notes
Since the purpose of this homework was to compare single-GPU and multi-node DDP processes, less attention was given to finetuning and model performance.