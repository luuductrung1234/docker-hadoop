# Learn Hadoop

learn Hadoop and deploy Pseudodistributed Hadoop cluster on Docker.

## How to use

Build necessary Hadoop component images

```bash
make infras_version="1.0.0" build
```

Deploy Hadoop cluster

```bash
make deploy
```

## Clean up

Remove all images

```bash
make infras_version="1.0.0" clean
```
