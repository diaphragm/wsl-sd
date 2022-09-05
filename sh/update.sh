cd stable-diffusion

if [ "$1" = "-f" ]; then
  git fetch
  git reset --hard origin/main
else
  git pull
fi
