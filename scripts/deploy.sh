#!/bin/bash
#if [ $TRAVIS_BRANCH == 'compiled-travis' ] ; then
#	echo "Deploying to remote"
#	cd _site
#	git add .
#	git commit -m "Deploy build #$TRAVIS_BUILD_NUMBER"
#	git push deploy compiled-travis
#else
#	echo "Not deploying, since this branch isn't compiled-travis."
#fi

#eval `ssh-agent -s` #start shh agent
#ssh-add ~/.ssh/id_rsa

set -x

if [ "$TRAVIS_BRANCH" = "compiled-travis" ] ; then
#  git init;

#  git remote add deploy "deploy@45.55.35.212:/var/www/html"

  # verify remote
  git remote -v

  git config user.name "Travis CI"
  git config user.email "mayarichman+travisCI@gmail.com"
  git add -A
  git commit -m "Deploy"
  git push -f deploy compiled-travis
else
  echo "Not deploying, since this branch isn't compiled-travis."
fi