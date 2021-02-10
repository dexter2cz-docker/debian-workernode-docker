FROM debian:buster

MAINTAINER Pavel Vondruska <vondruska@cesnet.cz>

WORKDIR /tmp

COPY . .

ENV DEBIAN_FRONTEND noninteractive

RUN bash ./create_meta_debian \
    && rm -r /var/lib/apt/lists/* \
    && apt-get clean

RUN mkdir /afs /packages /auto /storage /scratch /scratch.ssd /cvmfs

RUN ln -sf /afs/ics.muni.cz/software /software

CMD ["bash"]
