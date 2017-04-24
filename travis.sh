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

http-server ./ &
# give server time to start
sleep 5

mkdir -p ~/.linkchecker
echo "[checking]" >> ~/.linkchecker/linkcheckerrc
echo "sslverify=0" >> ~/.linkchecker/linkcheckerrc

linkchecker --check-html --check-css --anchors http://spacemacs.org:8080
exit $?
