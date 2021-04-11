#!/bin/bash
cd /root &&
curl -sL https://github.com/eysp/public/archive/public.tar.gz | tar xz &&
rm -rf public &&
mv public-public public &&
docker stop portainer &&
docker rm portainer &&
docker rmi portainer/portainer &&
docker rmi portainer/portainer-ce &&
docker run -d -p 8000:8000 -p 9000:9000 --name="portainer" --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data -v /root/public:/public portainer/portainer-ce
