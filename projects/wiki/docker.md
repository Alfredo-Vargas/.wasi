# Docker commands
- **First add yourself to the docker group**, this avoids to type `sudo` all the time in the consecutive commands
- `sudo usermod -aG docker <username>`
- `docker ps -a` : To list all containers
- `docker stop <container-name>` : to stop a container
- `docker container prune` : it will remove all stopped containers
- `docker run -i -t --name=centos7_lab centos:latest /bin/bash`  : the flag `-i` is for interactive mode and the flag `-t` is for `tty` allocation

- Example create a ubuntu container to practice ssh. The flag `-d` demonizes it. We share the home directory from the local system to the ubuntu container. Then we join the docker container
```bash
docker run -it -d --name sshpractice -v /home/alfredo:/home/alfredo ubuntu bash
docker exec -it sshpractice bash
```

# Docker permissions vs Host permissions
A nice article about this issue can be found [here](https://jtreminio.com/blog/running-docker-containers-as-current-host-user/)
Another nice article with different solutions [here](https://www.fullstaq.com/knowledge-hub/blogs/docker-and-the-host-filesystem-owner-matching-problem)
