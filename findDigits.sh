set -x 
find . -name pom.xml -print | xargs grep -in "<version>" | grep -v "\${" | grep -v SNAPSHOT
