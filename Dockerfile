FROM node:latest
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
RUN cd /tmp && \
  git clone https://github.com/probot/autolabeler && \
  ls -al && \
  cd autolabeler && \
  yarn && \
  mv "/tmp/autolabeler" "/autolabeler"
WORKDIR "/autolabeler"
ENTRYPOINT ["/tini", "--", "yarn", "start"]
