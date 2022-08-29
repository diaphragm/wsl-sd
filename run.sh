cd stable-diffusion

if [ "$1" = "-o" ]; then
  echo "run in optimized and half precision"
  python scripts/webui.py --optimized
elif  [ "$1" = "-t" ]; then
  echo "run in TrinArt"
  python scripts/webui.py --no-half --precision=full --ckpt ../trinart_stable_diffusion/trinart_stable_diffusion_epoch3.ckpt
else
  echo "run in full precision"
  python scripts/webui.py --no-half --precision=full
fi
