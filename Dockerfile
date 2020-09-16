FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install unzip vim git python3 python3-pip wget -y
    
RUN pip3 install --upgrade pip

RUN pip3 install pandas selenium

# Set the Chrome repo.
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# Install Chrome.
RUN apt-get update && apt-get -y install google-chrome-stable

RUN wget https://chromedriver.storage.googleapis.com/85.0.4183.87/chromedriver_linux64.zip #TRY THE LATEST VERSION OF CHROMEDRIVER

RUN unzip chromedriver_linux64.zip -d /opt

ADD scrapper_v1.py /opt

WORKDIR /opt

CMD ["python3", "scrapper_v1.py"]
