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

## push

```bash
docker rmi okimatsuraa/mayu:latest
docker tag my/mayu okimatsuraa/mayu:latest
```

```bash
#docker login
docker push okimatsuraa/mayu:latest
```
