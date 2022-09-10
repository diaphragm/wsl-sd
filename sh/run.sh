cd stable-diffusion-webui
eval "$(conda shell.bash hook)"
conda activate ldm


options="
  --defaults ../webui.yaml
  --gfpgan-dir ../gfpgan
  --realesrgan-dir ../realesrgan
  --ldsr-dir ../latent-diffusion
  --outdir_img2img ../outputs/img2img-samples
  --outdir_imglab ../outputs/imglab-samples
  --outdir_txt2img ../outputs/txt2img-samples
"

if [ "$1" = "-o" ]; then
  echo "run in optimized and half precision"
  python scripts/webui.py $options \
    --optimized \
    --ckpt ../stable-diffusion-v-1-4-original/sd-v1-4.ckpt
elif  [ "$1" = "-t" ]; then
  echo "run in TrinArt"
  python scripts/webui.py $options \
    --no-half --precision=full \
    --ckpt ../trinart_stable_diffusion/trinart_stable_diffusion_epoch3.ckpt
elif  [ "$1" = "-t2" ]; then
  echo "run in TrinArt"
  python scripts/webui.py $options \
    --no-half --precision=full \
    --ckpt ../trinart_stable_diffusion_v2/trinart2_step115000.ckpt
elif  [ "$1" = "-w" ]; then
  echo "run in waifu-diffusion"
  python scripts/webui.py $options \
    --no-half --precision=full \
    --ckpt ../waifu-diffusion-model/wd-v1-2-full-ema.ckpt
else
  echo "run in full precision"
  python scripts/webui.py $options \
    --no-half --precision=full \
    --ckpt ../stable-diffusion-v-1-4-original/sd-v1-4.ckpt
fi
