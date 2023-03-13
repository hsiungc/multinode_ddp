# 251-hsiungc-hw9
The purpose of HW9 was to gain exposure to multi-node DDP using PyTorch's DDP module. Performance on a single-GPU EC2 instance was compared to performance on two single-GPU EC2 instances (DDP).

All comparisons were done using AWS g5.2xlarge instances.

## Homework Background
### Single-GPU
A ResNet18 model was trained and validated on ImageNet images through a Jupyter Lab notebook deployed through a Docker container on a Single-GPU Instance. Both PyTorch Automated Mixed Precision and wandb were implemented. Training was monitored over one epoch using NVIDIA-SMI, and batch size and number of workers were updated to keep GPU utilization at an initial approximation of 95%. Training and validation took a total of 75 minutes.

| ![alt text](https://github.com/hsiungc/251-hsiungc-hw9/blob/d3f52f2764f2692667435c390355c122b41ade64/single_instance/Screen%20Shot%202023-03-12%20at%207.47.46%20PM.png) |

The notebook, screenshots, and WandB report can be found in the [single_instance] folder.

### Multi-Node DDP
The same ResNet18 models were trained and validated on ImageNet images in two Single-GPU Instances. DDP, PyTorch Automated Mixed Precision, and wandb were implemented. The same hyperparameters, functions, and settings from the single-GPU instance were applied here. Again, training was monitored over one epoch using NVIDIA-SMI, and batch size and number of workers were updated to keep GPU utilization at approximately 95%.

Training and validation took a total of 

## Dataset Summary
A g2.xlarge EC2 instance is used for extracting the ImageNet data for training and validation. The dataset is processed into two EBS volumes, which are then mounted to each EC2 DDP instance.

EFS was initially used but could not rsync in time. Thus EBS volumes were used instead.

## Additional Notes
Since the purpose of this homework was to compare single-GPU and multi-node DDP processes, less attention was given to finetuning and model performance.

Due to time constraints, the hyperparameters were determined based on utilization from the beginning of training. It was difficult to gauge average GPU utilization early on in the run.  It has been noted that towards the end of the epoch, utilization would level out and drop below 95%.


[single_instance]: https://github.com/hsiungc/251-hsiungc-hw9/tree/d3f52f2764f2692667435c390355c122b41ade64/single_instance