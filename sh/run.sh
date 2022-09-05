cd stable-diffusion

options="
  --defaults ../webui.yaml
  --gfpgan-dir ../gfpgan
  --realesrgan-dir ../realesrgan
  --ldsr-dir ../latent-diffusion
  --outdir_img2img outputs/img2img-samples
  --outdir_imglab outputs/imglab-samples
  --outdir_txt2img outputs/txt2img-samples
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
else
  echo "run in full precision"
  python scripts/webui.py $options \
    --no-half --precision=full \
    --ckpt ../stable-diffusion-v-1-4-original/sd-v1-4.ckpt
fi
