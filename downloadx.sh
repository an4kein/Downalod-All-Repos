#!/bin/bash

# Clone all github.com repositories for a specified user.

if [ $# -eq 0 ]
  then
    echo "Usage: $0 <user_name> "
    exit;
fi

USER=$1

# clone all repositories for user specifed
for repo in `curl -s https://api.github.com/users/$USER/repos?per_page=1000 |grep clone_url |cut -d"\"" -f4`;do
git clone $repo;
done;
