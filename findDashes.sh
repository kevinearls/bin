find . -name pom.xml | xargs grep "<version>.*\-.*<\/version>" | grep -v SNAPSHOT
