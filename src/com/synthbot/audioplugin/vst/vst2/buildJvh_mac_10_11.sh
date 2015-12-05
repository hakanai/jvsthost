#!/bin/sh

set -e

export LD_LIBRARY_PATH=.

JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home
MAC_OSX_SDK=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk
VST_SDK=./sdk


# -O3 optimise!
# -g3 -ggdb3 debug!
gcc -framework CoreFoundation -framework Carbon -o libjvsthost.jnilib -fPIC -dynamiclib -O3  \
-I${VST_SDK}/ \
-I${VST_SDK}/public.sdk/source/vst2.x/ \
-I${JAVA_HOME}/include \
-I${JAVA_HOME}/include/darwin \
-F${MAC_OSX_SDK}/System/Library/Frameworks \
${VST_SDK}/public.sdk/source/vst2.x/audioeffect.cpp \
JVstHost.cpp \
-lc -lstdc++ -lm

ls -l ./libjvsthost.jnilib
