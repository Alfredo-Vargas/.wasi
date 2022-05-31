# To avoid typing sudo all the type when using docker commands:
```
console
sudo usermod -aG docker <user>
```

# To list all running containers
```console
docker ps -a
```

# To start a docker container
```console
docker run -i -t --name=centos7_lab centos:latest /bin/bash
```
The flag `-i` stands for interactive mode
The flag `-t` stands for `tty` allocation

# To stop a docker container
```console
docker stop <container-name>
```

# Docker permissions vs Host permissions
A nice article about this issue can be found [here](https://jtreminio.com/blog/running-docker-containers-as-current-host-user/)
Another nice article with different solutions [here](https://www.fullstaq.com/knowledge-hub/blogs/docker-and-the-host-filesystem-owner-matching-problem)
