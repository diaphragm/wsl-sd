token=$(cat token)

# install git lfs to clone model data
sudo apt-get update
sudo apt-get upgrade -y git-lfs
git lfs install


# install cuda driver
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
rm cuda-wsl-ubuntu.pin
wget https://developer.download.nvidia.com/compute/cuda/11.7.1/local_installers/cuda-repo-wsl-ubuntu-11-7-local_11.7.1-1_amd64.deb
sudo dpkg -i cuda-repo-wsl-ubuntu-11-7-local_11.7.1-1_amd64.deb
rm cuda-repo-wsl-ubuntu-11-7-local_11.7.1-1_amd64.deb
sudo cp /var/cuda-repo-wsl-ubuntu-11-7-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda


# install miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sudo sh Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3
rm  Miniconda3-latest-Linux-x86_64.sh
/opt/miniconda3/bin/conda init bash


# clone stable-diffusion (fork)
git clone https://github.com/hlky/stable-diffusion.git


# setup model data
git clone https://:$token@huggingface.co/CompVis/stable-diffusion-v-1-4-original
mkdir -p stable-diffusion/models/ldm/stable-diffusion-v1
mv stable-diffusion-v-1-4-original/sd-v1-4.ckpt stable-diffusion/models/ldm/stable-diffusion-v1/model.ckpt
rm -rf stable-diffusion-v-1-4-original


# setup GFPGAN
wget -P stable-diffusion/src/gfpgan/experiments/pretrained_models \
  https://github.com/TencentARC/GFPGAN/releases/download/v1.3.0/GFPGANv1.3.pth

# setup RealESRGAN
wget -P stable-diffusion/src/realesrgan/experiments/pretrained_models \
  https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.0/RealESRGAN_x4plus.pth \
  https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.2.4/RealESRGAN_x4plus_anime_6B.pth


# setup stable-diffusion
cd stable-diffusion
conda env create -f environment.yaml
echo "conda activate ldm" >> ~/.bashrc
. ~/.bashrc
