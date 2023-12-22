Testing different connection methods and accessing the host and mapping volumes

### Start simple server on host

Starting up server using python bultin http.server

```bash
cd server
python -m http.server
```

## Building and Deploying

To build the docker image, you need to issue the following command:

```bash
docker build -t docker-networktest:latest .
```

```bash
docker run -it --rm docker-networktest:latest
```

This does not work:

```bash
Invoke-WebRequest -Uri "http://host.docker.internal:8000"
```

But if I run the ipconfig on host and take the ip address of the ethernet adapter vEthernet (DockerNAT) and use that instead of host.docker.internal it works.

```bash
Invoke-WebRequest -Uri "http://1762.20.128.1:8000"
```
