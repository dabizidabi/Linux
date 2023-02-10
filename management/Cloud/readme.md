```
# Build AWS image
docker build -t awscli -f ./AllInOneDocker .

# Run Amazon CLI
docker run -it --rm -v ${HOME}:/root -v ${PWD}:/work -w /work --net host --entrypoint /bin/bash awscli
```
