Testing different connection methods and accessing the host and mapping volumes

host.docker.internal

## Building and Deploying

To build the docker image, you need to issue the following command:

```bash
docker build -t docker-networktest:latest .
```

```bash
docker run -it --rm windows-with-curl
curl http://host.docker.internal
```

### Simple server

Starting up server using python bultin http.server

```bash
cd server
python -m http.server
```

By default, the server will listen on port 8000. If you want to use a different port, you can specify it on the command line. For example, to use port 8080, you would run:

```bash
python -m http.server 8080
```

Now, you have a server running on your host machine. You can access it from inside a Docker container using the host.docker.internal hostname.
For example, if your server is listening on port 8080, you can start a Docker container with curl installed, and use curl to send a request to your server:

```bash
docker run -it --rm curlimages/curl:latest curl http://host.docker.internal:8080
```
