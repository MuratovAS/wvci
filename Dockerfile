FROM python:3.13

RUN apt update && apt install -y graphviz \
	&& rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old
RUN pip install wireviz
COPY DIN-6771-wvci.html /usr/local/lib/python3.13/site-packages/wireviz/templates/DIN-6771-wvci.html

ADD scripts /scripts
ENV PATH="$PATH:/scripts:/tools"

USER root

ENTRYPOINT ["/bin/bash"]