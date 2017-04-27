#!/usr/bin/env bash
## travis.sh --- Travis CI File for Spacemacs site
##
## Copyright (c) 2017 Sylvain Benner & Contributors
##
## Author: Eugene Yaremenko <w3techplayground@gmail.com>
## URL: https://github.com/syl20bnr/develop.spacemacs.org
##
## This file is not part of GNU Emacs.
##
## License: GPLv3

docker run -d \
  --name http-server \
  --net=host \
  -v "${TRAVIS_BUILD_DIR}":/home \
  -t taka0225/alpine-http-server:latest

# give http-server time to start
sleep 5

docker run -ti \
  --name linkchecker \
  --net=host \
  --add-host spacemacs.org:127.0.0.1 \
  -v "${TRAVIS_BUILD_DIR}/travis/linkcheckerrc:/root/.linkchecker/linkcheckerrc:ro" \
  jare/linkchecker \
    --no-robots \
    http://spacemacs.org:8080

exit $?
