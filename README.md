<h1>Multi-Node Distributed Data Parallelism (PyTorch)</h1>

The purpose of this project was to gain exposure to multi-node distributed data parallelism (DDP) using PyTorch's DDP module. Performance on a single-GPU EC2 instance was compared to performance on two single-GPU EC2 instances (DDP).

All comparisons were done using AWS g5.2xlarge instances.

## Project Background
### Single-GPU
A ResNet18 model was trained and validated on ImageNet images through a Jupyter Lab notebook deployed through a Docker container on a Single-GPU Instance. Both PyTorch Automated Mixed Precision and wandb were implemented. Training was monitored over one epoch using NVIDIA-SMI, and batch size and number of workers were updated to keep GPU utilization at an initial approximation of 95%.

Training and validation altogether took a total of **75 minutes**, as indicated in the WandB report.

The notebook, screenshots, and WandB report can be found in the [single_instance] folder.

### Multi-Node DDP
The same ResNet18 models were trained and validated on ImageNet images in two Single-GPU Instances. DDP, PyTorch Automated Mixed Precision, and wandb were implemented. The same hyperparameters, functions, and settings from the single-GPU instance were applied here. Again, training was monitored over one epoch using NVIDIA-SMI, and batch size and number of workers were kept the same as the single-GPU training.

Training and validation took a total of **37 minutes**, as indicated in the WandB report. This confirms the assumption that multi-node DDP on two GPU instances is twice as fast as a single instance, with all controllable factors held equal.

The notebook, screenshots, and WandB report can be found in the [multinode] folder.

## Dataset Summary
A g2.xlarge EC2 instance is used for extracting the ImageNet data for training and validation. The dataset is processed into two EBS volumes, which are then mounted to each EC2 DDP instance.

EFS was initially used but could not rsync in time. Thus EBS volumes were used instead.

## Additional Notes
Since the purpose was to compare single-GPU and multi-node DDP processes, less attention was given to finetuning and model performance.

Due to time constraints, the hyperparameters were determined based on utilization from the beginning of training. It was difficult to gauge average GPU utilization early on in the run.  It has been noted that towards the end of the epoch, utilization would drop below 95%.


[single_instance]: https://github.com/hsiungc/multinode_ddp/tree/4d152ba0dc588197b6669b0e0db5d91136511018/single_instance
[multinode]: https://github.com/hsiungc/multinode_ddp/tree/4d152ba0dc588197b6669b0e0db5d91136511018/multinode