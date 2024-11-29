FROM ubuntu:20.04 AS build

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt -y update
RUN apt install -y gcc g++ libboost-all-dev libudev-dev libusb-1.0-0-dev make
RUN apt install -y git
RUN mkdir /source
WORKDIR /source
RUN chmod 6777 /source
RUN useradd mayu
USER mayu
#RUN git clone https://github.com/kenhys/mayu.git
RUN git clone https://github.com/oonishi870//mayu.git
WORKDIR /source/mayu
RUN ./configure --with-boost-libdir=/usr/lib/x86_64-linux-gnu/
RUN make CXXFLAGS="-Wno-narrowing -pthread"


FROM ubuntu:20.04

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt -y update
RUN apt install -y libboost-regex1.71.0 libusb-1.0-0

COPY --from=build /source/mayu/mayu /bin/mayu

RUN mkdir /mayu
WORKDIR /mayu

COPY --from=build /source/mayu/*.mayu /mayu/
ENV HOME=/mayu
CMD ["/bin/mayu"]
