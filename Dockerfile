FROM jarvice/ubuntu-ibm-mldl-ppc64le
# uprev to force rebuild even if cached
ENV APP_POWERAI_VERSION 6

ADD https://raw.githubusercontent.com/nimbix/notebook-common/master/install-ubuntu.sh /tmp/install-ubuntu.sh
RUN bash /tmp/install-ubuntu.sh && rm -f /tmp/install-ubuntu.sh

COPY NAE/screenshot.png /etc/NAE/screenshot.png
COPY NAE/help.html /etc/NAE/help.html

COPY NAE/AppDef.json /etc/NAE/AppDef.json
RUN curl --fail -X POST -d @/etc/NAE/AppDef.json https://api.jarvice.com/jarvice/validate

#add Jupyter
# RUN pip install --upgrade pip
# RUN pip install notebook pyyaml
# RUN pip install jupyter
# RUN pip install ijson
# RUN pip install pandas

# RUN pip install pandas_datareader
# RUN pip install httplib2
# RUN apt-get install -y build-essential
# RUN apt-get install -y libssl-dev
# RUN apt-get install -y libffi-dev
# RUN apt-get install -y python-dev
# RUN apt-get install -y python-matplotlib
# RUN apt-get install -y python-lxml
# RUN apt-get install -y openssh-server
# RUN pip install cython
# RUN apt-get install -y python-scipy
# RUN pip install scikit-learn
# RUN apt-get install -y libxml2-dev libxmlsec1-dev
# RUN pip install dragnet

#add startupscripts
# RUN apt-get install -y supervisor

ADD cels.csv  /data
ADD CTIUS.csv  /data
ADD DAX-SP-FTSE-index.csv  /data
ADD eui.csv  /data
ADD icln.csv  /data
ADD n8wh.csv  /data
ADD qcln.csv  /data
ADD watson.csv  /data
ADD watson-results.csv  /data
ADD watson-results-test.csv /data
ADD binary-classification.png  /data
ADD feed-forward.png  /data
ADD IBM-Google-Demo-Env.png /data
ADD NN-Results.png /data
ADD Clean_Energy_Watson_V1.0.ipynb /data
ADD nyt_article_results.json /data
