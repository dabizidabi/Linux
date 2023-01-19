```
# Build AWS image
docker build -f awsterraform -t awscli .

# Run Amazon CLI
docker run -it --rm -v ${PWD}:/work -w /work --entrypoint /bin/bash awscli
```
