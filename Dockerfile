FROM google/cloud-sdk:alpine

COPY run.sh run.sh
RUN chmod +x run.sh

ENTRYPOINT ["/usr/bin/time", "./run.sh"]