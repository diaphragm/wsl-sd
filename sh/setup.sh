sudo apt-get update

# install git lfs to clone model data
bash sh/setup/git_lfs.sh

# install cuda driver
bash sh/setup/cuda.sh

# install miniconda
bash sh/setup/miniconda.sh

# setup model data
bash sh/setup/model.sh

# setup trinart model data
bash sh/setup/trinart.sh

# setup wifu model data
bash sh/setup/wd.sh

# setup stable-diffusion (fork)
bash sh/setup/sd.sh

# setup upscale
bash sh/setup/upscale.sh
