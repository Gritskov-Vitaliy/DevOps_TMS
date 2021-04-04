FROM ubuntu
VOLUME /testdir
RUN groupadd --gid 1000 NOBODY \
  && useradd --uid 1000 --gid NOBODY --shell /bin/bash --create-home NOBODY
USER NOBODY
