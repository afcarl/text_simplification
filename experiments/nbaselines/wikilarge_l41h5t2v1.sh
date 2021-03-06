#!/usr/bin/env bash


#SBATCH --cluster=gpu
#SBATCH --gres=gpu:1
#SBATCH --partition=gtx1080
#SBATCH --job-name=l41h5t2v1
#SBATCH --output=l41h5t2v1.out
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=3-00:00:00
#SBATCH --qos=normal
#SBATCH --mem=16g

# Load modules
module restore

# Run the job
srun python ../../model/train.py -ngpus 1 -bsize 64 -fw transformer -out l41h5t2v1 -layer_drop 0.2 -op adagrad -lr 0.1 --mode dressnew -nhl 0 -nel 4 -ndl 1 -nh 5 -lc True --min_count 4 -eval_freq 0 -tmode teachercriticalv2 --rl_config rule=large -warm /zfs1/hdaqing/saz31/text_simplification_0424/l41h5/ckpt/model.ckpt-62547

