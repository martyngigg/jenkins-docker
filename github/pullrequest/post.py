from __future__ import print_function

import requests
import json
import os

JSON_FILE = os.path.join(os.path.dirname(__file__), "example-pull-request-opened.json")
URL = "http://localhost:8080/github-webhook/"

with open(JSON_FILE) as handle:
    payload_str = handle.read()

headers = {
    'X-GitHub-Event':'pull_request',
    'content-type': 'application/json'
}
response = requests.post(URL, data=payload_str, headers=headers)

print("Response url=", response.url)
print("Response text=",response.text)
print("Response code=",response.status_code)

print
print("Remember to clear the 'org.jenkinsci.plugins.github.pullrequest.GitHubPRRepository.runtime.xml' file or the plugin things it hasn't changed")
