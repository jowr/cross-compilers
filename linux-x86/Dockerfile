FROM thewtex/cross-compiler-base
MAINTAINER Steeve Morin "steeve.morin@gmail.com"

ENV HOST=i686-linux-gnu \
    TOOLCHAIN=i686-linux-gnu

ENV ARCH=i686 \
    TOOLCHAIN_ROOT=/usr/$HOST \
    CROSS_BIN=/usr/$HOST/bin \
    CROSS_COMPILE=/usr/$HOST/bin/$HOST

ENV AS=${CROSS_COMPILE}-as \
    AR=${CROSS_COMPILE}-ar \
    CC=${CROSS_COMPILE}-gcc \
    CPP=${CROSS_COMPILE}-cpp \
    CXX=${CROSS_COMPILE}-g++ \
    LD=${CROSS_COMPILE}-ld \
    PATH=${PATH}:${TOOLCHAIN_ROOT}/bin \
    LD_LIBRARY_PATH=${TOOLCHAIN_ROOT}/lib:${LD_LIBRARY_PATH}

RUN apt-get update && apt-get -y install \
                        gcc-multilib \
                        g++-multilib

COPY ${HOST}.sh $CROSS_BIN/${HOST}.sh
RUN mkdir -p ${CROSS_BIN} && \
    cd $CROSS_BIN && \
    chmod +x ${HOST}.sh && \
    ln -s /usr/bin/x86_64-linux-gnu-gcc x86_64-linux-gnu-cc && \
    ln -s /usr/bin/x86_64-linux-gnu-g++ x86_64-linux-gnu-c++ && \
    ln -s ${HOST}.sh ${HOST}-gcc && \
    ln -s ${HOST}.sh ${HOST}-cc && \
    ln -s ${HOST}.sh ${HOST}-g++ && \
    ln -s ${HOST}.sh ${HOST}-c++ && \
    for i in strip objdump ranlib nm ar as; do \
        ln -s /usr/bin/x86_64-linux-gnu-${i} ${HOST}-${i} ; \
    done
