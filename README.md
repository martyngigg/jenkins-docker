jenkins-docker
==============

Build the image with (assuming you are in this directory):

```
docker build --rm -t jenkins-docker .
```

Run it with:

```
docker run --rm -p 8080:8080 -ti jenkins-docker
```

and Jenkins should be available at http://localhost:8080.
