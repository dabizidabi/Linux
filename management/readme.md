```
# Build AWS image
docker build -t mytoolbox -f ./mytoolbox .

# Run Amazon CLI
docker run -it --rm -v ${HOME}:/home/1000 -v ${PWD}:/work -w /work --net host --entrypoint /bin/zsh mytoolbox
```
