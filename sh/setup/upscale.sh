# setup GFPGAN
mkdir -p gfpgan/experiments/pretrained_models
wget -P gfpgan/experiments/pretrained_models \
  https://github.com/TencentARC/GFPGAN/releases/download/v1.3.0/GFPGANv1.3.pth

# setup RealESRGAN
mkdir -p realesrgan/experiments/pretrained_models
wget -P realesrgan/experiments/pretrained_models \
  https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.0/RealESRGAN_x4plus.pth \
  https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.2.4/RealESRGAN_x4plus_anime_6B.pth
