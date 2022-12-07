# Easy setup for Stable Diffusion 2.0

This repository is just an easy way for my self to explore stable diffusion without doing a lot of setup and leveraging docker for the whole process. It also include setup for [xformers](https://github.com/facebookresearch/xformers) from facebook, to be more memory efficient.

In order to run this project you need to following:

- Docker (so far only tested on v20.10.21)
- Docker-compose (any version above v2.13.0)
- A capable nvidia card (Only tested on RTX 3080 mobile and RTX 3090)
- Both base model and 768 one, can be found on huggingface:
  - 512-base-ema.ckpt
  - 768-v-ema.ckpt

In order to run this container all you'll need is running: `docker-compose run --rm miniconda`

And then run any of the example [scripts](https://github.com/Stability-AI/stablediffusion/tree/main/scripts) with any of the examples found on [Stability-AI github](https://github.com/Stability-AI/stablediffusion#reference-sampling-script).

But on in short something similar to:

```python
python scripts/txt2img.py --prompt "a big dark beast eating the souls out of five humans Hans Ruedi Giger lovecraft concept art" --ckpt ./models/768-v-ema.ckpt --config configs/stable-diffusion/v2-inference-v.yaml --H 768 --W 768
```
