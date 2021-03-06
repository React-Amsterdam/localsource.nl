#!/bin/bash
set -e

echo "set git environment"
git config user.name "LocalSourceNL bot"
git remote rm origin
git remote add origin https://react-amsterdam:${GITHUB_TOKEN}@github.com/react-amsterdam/localsource.nl.git
git checkout master

echo "run update"
babel-node update 

echo "save dump"
git add --all dump
git commit -m $'save dump\n\n[ci skip]'
git push origin master &>/dev/null

echo "build'n'deploy"
npm run deploy
