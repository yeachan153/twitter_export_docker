FROM ubuntu:18.04

# Env vars
ENV PYTHONUNBUFFERED=1
ENV PYTHONIOENCODING=utf-8
ENV PATH = "${PATH}:/root/.poetry/bin"

# Upgrade installed packages
RUN apt-get update && apt-get upgrade -y && apt-get clean

# Install python + git + sudo + venv
RUN apt-get install -y curl python3.7 python3.7-dev python3.7-distutils
RUN apt-get -y install git
RUN apt-get -y install python3-venv
RUN apt-get update && apt-get -y install sudo
RUN sudo apt-get install python3.7-venv

# Register the version in alternatives
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1

# Set python 3 as the default python
RUN update-alternatives --set python /usr/bin/python3.7

# Upgrade pip to latest version
RUN curl -s https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py --force-reinstall && \
    rm get-pip.py

# Get poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

# Clone repository and install
RUN git clone -b 0.2.0 https://github.com/yeachan153/twitter_scrape_export.git
WORKDIR twitter_scrape_export
RUN poetry install

# Copy executor
COPY executor.py /twitter_scrape_export

# Entrypoint command
CMD poetry run python3.7 executor.py
