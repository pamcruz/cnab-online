#!/bin/sh

git checkout master

git branch -D client-production-filtered
git checkout client-production
git merge master
git branch client-production-filtered
git filter-branch -f --subdirectory-filter client -- client-production-filtered

git checkout master
git branch -D api-filtered
git branch api-filtered
git filter-branch -f --subdirectory-filter api -- api-filtered

git push origin --delete client-production-filtered
git push origin --delete api-filtered

git push origin client-production-filtered
git push origin api-filtered
#git push origin gh-pages
#git push heroku heroku-master:master
