#!/bin/shell
set -e

server=$1
username=$2
password=$3
repo=$4
sourceDir=$5
filename=$6

helm version
if [[ "$server" == "version" ]]; then
    exit 0
fi

if [[ "$server" == "" || "$username" == "" || "$password" == "" || "$repo" == "" || "$sourceDir" == "" || "$filename" == "" ]]; then
    echo "Usage: $0 <server> <username> <password> <repo> <sourceDir> <filename>"
    exit 1
fi

helm registry login ${server} --insecure --username ${username} --password ${password}

helm lint ${sourceDir}
helm package ${sourceDir}

helm push ${filename} oci://${server}/${repo} --plain-http
