jenkins-docker
==============

Build the image with (assuming you are in this directory):

```
docker build --rm -t jenkins-docker .
```

Run it with:

```
docker run --rm -p 8080:8080 -p 80:80 -ti jenkins-docker
```

and Jenkins should be available at http://localhost:8080. The port 80 mapping is so that the github commit status updater works.

Notes:

- It requires a custom build of the `github` plugin from https://github.com/martyngigg/github-plugin/tree/parametrized-commit-notifier. It should be uploaded from the advanced menu in the 'Manage Plugins' section.
- Currently the GitHub server section in the Global System Setup must be filled in each time with a new set of credentials.
- When testing the pull request triggering remember to clear the 'org.jenkinsci.plugins.github.pullrequest.GitHubPRRepository.runtime.xml' file or Jenkins won't rebuild things.

### Building the github plugin

It requires `maven` to be installed.

Run:

```
git clone https://github.com/martyngigg/github-plugin.git
cd github-plugin
mvn install -DskipTests
```

The `.hpi` file will appear in the `target/` directory.
