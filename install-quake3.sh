#!/bin/bash

# Install Quake 3: Arena on a mac

# Copyright (c) 2016 simonewebdesign
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

set -e # exit on error

cd $HOME
#git clone https://github.com/nrempel/q3-server.git

git clone https://github.com/ioquake/ioq3

cd ioq3

./make-macosx.sh x86_64

cd build
cp -R release-darwin-x86_64/ /Applications/ioquake3

cd /Applications/ioquake3/baseq3

COUNT=0
while [ $COUNT -lt 9 ]; do
#    curl http://files.anitalink.com/gamecache/quake3/baseq3/pak$COUNT.pk3 > pak$COUNT.pk3
    wget https://github.com/nrempel/q3-server/raw/master/baseq3/pak$COUNT.pk3 -O  pak$COUNT.pk3
    let COUNT+=1
done

echo "Quake 3: Arena installation successful!"

rm -R $HOME/ioq3

read -p "Do you want to start the game now? (y/n) " -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
then
    open /Applications/ioquake3/ioquake3.app
fi
