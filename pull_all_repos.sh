#!/bin/bash
# Copyleft (c) 2016 Some Rights Reserved
# Author: Juxi Leitner <juxi.leitner@gmail.com>
#         http;//Juxi.net

# predfinded_list_of_my_repos=( "test1" "test2" )
my_repos=( )

if [[ ${#my_repos[@]} == 0 ]]; then
  #statements
  echo "Finding all sub directories that are git repositories..."
  for dir in $(find . -name ".git")
  do
    my_repos+=( $(dirname $dir) )
  done
fi

echo "Updating" ${#my_repos[@]} "repositories..."

for repo in "${my_repos[@]}"
do
  cd "${repo}"
  echo "Pulling" ${repo}
  git pull
  cd ..
done
