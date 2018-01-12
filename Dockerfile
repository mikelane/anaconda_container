FROM continuumio/anaconda3

MAINTAINER Mike Lane <mikelane@gmail.com>

SHELL ["/bin/bash", "-c"]

RUN useradd --create-home --shell /bin/bash --user-group jupyter
RUN mkdir -p /opt/notebooks && chown jupyter:jupyter /opt/notebooks

USER jupyter

RUN cd && mkdir -p projects && cd projects
WORKDIR /home/jupyter/projects

EXPOSE 8888/tcp

CMD ["jupyter", "notebook", "--notebook-dir=/opt/notebooks", "--port=8888", "--ip=*", "--no-browser"]

# Example docker run command assuming the image is tagged anaconda3-jupyter:
# docker run -it -p 8888:8888 -v ~/jupyter/notebooks:/opt/notebooks anaconda3-jupyter
