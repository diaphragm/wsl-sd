# setup LDSR
git clone https://github.com/devilismyfriend/latent-diffusion
cd latent-diffusion

mkdir -p experiments/pretrained_models

wget -U "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" \
  -O experiments/pretrained_models/project.yaml \
  https://heibox.uni-heidelberg.de/f/31a76b13ea27482981b4/?dl=1

wget -U "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" \
  -O experiments/pretrained_models/model.ckpt \
  https://heibox.uni-heidelberg.de/f/578df07c8fc04ffbadf3/?dl=1
