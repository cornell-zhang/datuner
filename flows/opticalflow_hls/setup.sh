#!/bin/sh

export LD_LIBRARY_PATH
pathadd() {
    if [ -d "$1" ] && [[ ":$LD_LIBRARY_PATH:" != *":$1:"* ]]; then
        LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+"$LD_LIBRARY_PATH:"}$1"
    fi
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
FULLDIR="$DIR/dependencies/libpng/lib"

pathadd $FULLDIR 

#LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PATH
echo $LD_LIBRARY_PATH
export LD_LIBRARY_PATH


