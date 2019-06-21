FROM centos:latest
LABEL maintainer="ZhongKun Wu<wuzk@asiainfo.com>" imageinfo="image for python 2.7.13 version"
ADD 3rd /3rd/
ENV http_proxy=http://134.200.54.45:8081   \
    https_proxy=https://134.200.54.45:8890 \
    ORACLE_HOME=/3rd/oracle/app/11204      \
    LD_LIBRARY_PATH=${ORACLE_HOME}/lib:${ORACLE_HOME} \
    PATH=./:${ORACLE_HOME}/bin:${PATH}

RUN yum -y install gcc gcc-c++ gdb make wget dstat sysstat libpcap libpcap-devel net-tools iproute    && \    
    yum -y install zlib-devel sqlite-devel readline-devel openssl openssl-devel bzip2 bzip2-devel     && \
    yum -y install python-devel telnet mysql nc openssh-clients                                       && \
    cd /3rd/Python-2.7.13 && ./configure && make && make install                                      && \
    rm -rf /usr/bin/python && rm -rf /usr/bin/python2 		               			      && \
    ln -s /usr/local/bin/python2.7 /usr/bin/python                                                    && \
    ln -s /usr/local/bin/python2.7 /usr/bin/python2                                                   && \
    cd /3rd/setuptools-40.6.2 && python setup.py build && python setup.py install                     && \
    cd /3rd/pip-9.0.1 && python setup.py build && python setup.py install                             && \ 
    pip --retries=100 install --upgrade pip                                                           && \
    pip --retries=100 install aniso8601                                                               && \
    pip --retries=100 install attrs                                                                   && \
    pip --retries=100 install certifi                                                                 && \
    pip --retries=100 install chardet                                                                 && \
    pip --retries=100 install click                                                                   && \
    pip --retries=100 install crypto                                                                  && \
    pip --retries=100 install cx-Oracle                                                               && \
    pip --retries=100 install dominate                                                                && \
    pip --retries=100 install enum34                                                                  && \
    pip --retries=100 install Flask                                                                   && \
    pip --retries=100 install Flask-Bootstrap                                                         && \
    pip --retries=100 install Flask-Login                                                             && \
    pip --retries=100 install Flask-OAuthlib                                                          && \
    pip --retries=100 install Flask-OpenID                                                            && \
    pip --retries=100 install Flask-RESTful                                                           && \
    pip --retries=100 install flask-restplus                                                          && \
    pip --retries=100 install Flask-SQLAlchemy                                                        && \
    pip --retries=100 install Flask-WTF                                                               && \
    pip --retries=100 install functools32                                                             && \
    pip --retries=100 install idna                                                                    && \
    pip --retries=100 install itsdangerous                                                            && \
    pip --retries=100 install Jinja2                                                                  && \
    pip --retries=100 install jsonschema                                                              && \
    pip --retries=100 install lxml                                                                    && \
    pip --retries=100 install MarkupSafe                                                              && \
    pip --retries=100 install Naked                                                                   && \
    pip --retries=100 install oauthlib                                                                && \
    pip --retries=100 install optionaldict                                                            && \
    pip --retries=100 install plyvel                                                                  && \
    pip --retries=100 install PyMySQL                                                                 && \
    pip --retries=100 install pyrsistent                                                              && \
    pip --retries=100 install python-dateutil                                                         && \
    pip --retries=100 install python-openid                                                           && \
    pip --retries=100 install pytz                                                                    && \
    pip --retries=100 install PyYAML                                                                  && \
    pip --retries=100 install redis                                                                   && \
    pip --retries=100 install relativetimebuilder                                                     && \
    pip --retries=100 install requests                                                                && \
    pip --retries=100 install requests-oauthlib                                                       && \
    pip --retries=100 install shellescape                                                             && \
    pip --retries=100 install six                                                                     && \
    pip --retries=100 install SQLAlchemy                                                              && \
    pip --retries=100 install urllib3                                                                 && \
    pip --retries=100 install visitor                                                                 && \
    pip --retries=100 install wechatpy                                                                && \
    pip --retries=100 install Werkzeug                                                                && \
    pip --retries=100 install WTForms                                                                 && \
    pip --retries=100 install xmltodict                                                               && \
    pip --retries=100 install pycrypto                                                                && \
    pip --retries=100 install setproctitle
   
