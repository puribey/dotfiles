#!/bin/bash

set -e

curl -X GET -u $GITHUB_TOKEN:x-oauth-basic -H "Accept: application/vnd.github.v3+json" https://api.github.com/orgs/classdojo/actions/runners | jq '.runners | map(select(.status == "offline")) | .[] | .id' | xargs -P 24 -I {} curl -X DELETE -u $GITHUB_TOKEN:x-oauth-basic -H "Accept: application/vnd.github.v3+json" https://api.github.com/orgs/classdojo/actions/runners/{}

if [ $? -eq 0 ]; then
  echo "Done"
else
  echo "Failed"
fi
