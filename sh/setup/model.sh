token=$(cat token)

git clone https://:$token@huggingface.co/CompVis/stable-diffusion-v-1-4-original
mkdir -p stable-diffusion/models/ldm/stable-diffusion-v1
# mv stable-diffusion-v-1-4-original/sd-v1-4.ckpt stable-diffusion/models/ldm/stable-diffusion-v1/model.ckpt
# rm -rf stable-diffusion-v-1-4-original
