# ==================================================================
# module list
# ------------------------------------------------------------------
# python        3.6    (apt)
# ==================================================================

FROM python:3.6.15-buster

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6 -y

# ===================Module Dependencies============================

RUN pip3 install cycler imageio kiwisolver matplotlib numpy opencv-python Pillow pyparsing python-dateutil scipy 

# ===============bqapi for python3 Dependencies=====================
# Might be necessary to specify which verision of each, in that case use
# requests-toolbelt==0.6.2, requests==2.18.4, and six==1.13.0
RUN pip3 install six
RUN pip3 install lxml
RUN pip3 install requests==2.18.4
RUN pip3 install requests-toolbelt

# =====================Build Directory Structure====================
RUN mkdir /module
WORKDIR /module

COPY src /module/src
COPY PythonScriptWrapper.py /module/
COPY bqapi/ /module/bqapi
COPY EdgeDetection.xml /module/EdgeDetection.xml


ENV PATH /module:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

CMD [ 'PythonScriptWrapper' ]
