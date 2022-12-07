FROM continuumio/miniconda3

# Maybe needed for xformers
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y

WORKDIR /root

RUN git clone https://github.com/Stability-AI/stablediffusion.git stable

WORKDIR /root/stable
RUN mkdir /root/stable/models

RUN conda env create -f environment.yaml

RUN echo "source activate ldm" > ~/.bashrc
ENV PATH /opt/conda/envs/ldm/bin:$PATH

RUN conda install pytorch==1.12.1 torchvision==0.13.1 -c pytorch
RUN pip install transformers==4.19.2 diffusers invisible-watermark
RUN pip install -e .
RUN conda install -c conda-forge gcc
RUN conda install -c conda-forge gxx_linux-64=9.5.0
RUN pip install xformers
