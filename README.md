# docker-mayu
docker image for kenhys/mayu


## build image

```bash
docker build -t my/mayu .

```


## run

```bash

docker run --rm -it                    \
    --name mayu-dvorak                 \
    --privileged                       \
    -v ./mayu.mayu:/mayu/.mayu         \
    -v ./dvorak.mayu:/mayu/dvorak.mayu \
    my/mayu mayu

```

```bash
docker stop mayu-dvorak

```

