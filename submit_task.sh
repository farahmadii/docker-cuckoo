#!/bin/bash

set -x

if [ "$1" == "" ]; then
  echo "usage: $0 package_name"
  exit 1
fi

docker run -ti --rm  \
--env-file ./vbox/config-file.env \
-v `pwd`/cuckoo-tmp/:/tmp/cuckoo-tmp/ \
-v `pwd`/cuckoo-tmp/:/tmp/cuckoo-tmp-cuckoo/ \
-v  /home/farzan/cuckoo_storage/:/cuckoo/storage/ \
-v `pwd`/vbox/conf/:/cuckoo/conf/ \
-v /home/farzan/Workspace/uni/WS2019/IT_Sec_LAB/analyzer_scripts/devsecopssamples/samples/pypi_converted/typo_packages:/cuckoo/test_packages:ro \
-v /home/farzan/cuckoo_storage/database:/cuckoo/database \
cuckoo_local submit /cuckoo/test_packages/$1
