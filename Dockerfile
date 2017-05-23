FROM jarvice/ubuntu-ibm-mldl-ppc64le

#add Jupyter
RUN pip install --upgrade pip
RUN pip install notebook pyyaml
RUN pip install jupyter
RUN pip install ijson
RUN pip install pandas

RUN pip install pandas_datareader
RUN pip install httplib2
RUN apt-get install -y build-essential
RUN apt-get install -y libssl-dev
RUN apt-get install -y libffi-dev
RUN apt-get install -y python-dev
RUN apt-get install -y python-matplotlib
RUN apt-get install -y python-lxml
RUN apt-get install -y openssh-server
RUN pip install cython
RUN apt-get install -y python-scipy
RUN pip install scikit-learn
RUN apt-get install -y libxml2-dev libxmlsec1-dev
RUN pip install dragnet

#add startupscripts
RUN apt-get install -y supervisor
WORKDIR /etc/skel

ADD cels.csv  /etc/skel/data
Add CTIUS.csv  /etc/skel/data
ADD DAX-SP-FTSE-index.csv  /etc/skel/data
ADD eui.csv  /etc/skel/data
ADD icln.csv  /etc/skel/data
ADD n8wh.csv  /etc/skel/data
ADD qcln.csv  /etc/skel/data
ADD watson.csv  /etc/skel/data
ADD watson-results.csv  /etc/skel/data
ADD watson-results-test.csv /etc/skel/data
ADD binary-classification.png  /etc/skel/data
ADD feed-forward.png  /etc/skel/data
ADD IBM-Google-Demo-Env.png  /etc/skel/data
ADD NN-Results.png /etc/skel/data
ADD Clean_Energy_Watson_V1.0.ipynb /etc/skel/data
ADD nyt_article_results.json /etc/skel/data


# uprev to force rebuild even if cached
ENV APP_POWERAI_VERSION 6

ADD https://raw.githubusercontent.com/nimbix/notebook-common/master/install-ubuntu.sh /tmp/install-ubuntu.sh
RUN bash /tmp/install-ubuntu.sh && rm -f /tmp/install-ubuntu.sh

COPY NAE/screenshot.png /etc/NAE/screenshot.png
COPY NAE/help.html /etc/NAE/help.html

COPY NAE/AppDef.json /etc/NAE/AppDef.json
RUN curl --fail -X POST -d @/etc/NAE/AppDef.json https://api.jarvice.com/jarvice/validate
