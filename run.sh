cd stable-diffusion

if [ "$1" = "-o" ]; then
  echo "run in optimized and half precision"
  python scripts/webui.py --optimized
else
  echo "run in full precision"
  python scripts/webui.py --no-half --precision=full
fi
