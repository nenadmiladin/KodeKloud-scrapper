FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install unzip python3 python3-pip wget -y
    
RUN pip3 install --upgrade pip

RUN pip3 install pandas selenium matplotlib

# Set the Chrome repo.
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# Install Chrome.
RUN apt-get update && apt-get -y install google-chrome-stable

RUN wget https://chromedriver.storage.googleapis.com/85.0.4183.87/chromedriver_linux64.zip #TRY THE LATEST VERSION OF CHROMEDRIVER

RUN unzip chromedriver_linux64.zip -d /opt

ADD scrapper.py /opt


docker run -it --net=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:rw