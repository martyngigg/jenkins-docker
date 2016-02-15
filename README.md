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

and Jenkins should be available at http://localhost:8080. Currently the GitHub server section in the Global System Setup must be filled in each time with a new set of credentials.

When testing the pull request triggering remember to clear the 'org.jenkinsci.plugins.github.pullrequest.GitHubPRRepository.runtime.xml' file or Jenkins won't rebuild things.
