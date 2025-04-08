FROM python:3.9

ENV TRAVIS_TAG=4.0.0

RUN pip install --upgrade pip
RUN pip install pandas==1.5.3 numpy==1.26.4 networkx==3.2.1 scipy tables==3.7.0 \
                scikit-learn>=0.21.2 hmmlearn>=0.2.1 pyyaml==5.2 matplotlib==3.1.3 \
                jupyterlab tensorflow==2.18.1 cvxpy==1.6.4
RUN git clone https://github.com/nilmtk/nilmtk.git
RUN git clone https://github.com/nilmtk/nilm_metadata.git
RUN mkdir app

WORKDIR /nilmtk
RUN python setup.py install
WORKDIR /nilm_metadata
RUN python setup.py install
WORKDIR /app/nilmtk-contrib
