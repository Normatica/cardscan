FROM ubuntu:trusty
MAINTAINER Axel Amigo <contacto@amigoarnold.me>

ENV WSGI_PORT=6711

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y python2.7 tesseract-ocr ipython python-opencv python-scipy python-numpy python-pygame python-setuptools python-pip wget liblept4 libopencv-core2.4 git
RUN wget "https://bitbucket.org/3togo/python-tesseract/downloads/python-tesseract_0.9-0.5ubuntu3_trusty_amd64.deb"
RUN dpkg -i python-tesseract_0.9-0.5ubuntu3_trusty_amd64.deb && rm -f python-tesseract_0.9-0.5ubuntu3_trusty_amd64.deb

RUN pip install --upgrade pip
RUN pip install https://github.com/sightmachine/SimpleCV/zipball/develop pyyaml svgwrite

COPY . /usr/src/app

EXPOSE ${WSGI_PORT}
