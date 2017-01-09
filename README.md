# docker-chromium
Dockerfile for building Chromium on Android inside docker

`sudo docker build -t docker-chromium .`<br>
`./run.sh`<br>
`sudo docker run -it --rm  -v $(pwd):/opt/chrome --name docker-chromium docker-chromium /bin/bash`<br>
`make`<br>
