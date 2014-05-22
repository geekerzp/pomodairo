#!/bin/bash
if ! screen -r cmus > /dev/null ; then
    screen -d -m -S cmus /usr/bin/cmus "$@"
fi
