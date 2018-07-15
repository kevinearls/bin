#/bin/sh
git status | grep -i modified | sed 's/.*modified://g' | xargs git add
