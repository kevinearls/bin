#!/bin/sh  
M2_REPO=${HOME}/.m2 
OLDFILES=/tmp/oldfiles.txt 
AGE=31  

find "${M2_REPO}" -name '*jar' -atime +${AGE} -exec dirname {} \; >> ${OLDFILES} 
find "${M2_REPO}" -name '*war' -atime +${AGE} -exec dirname {} \; >> ${OLDFILES}  
find "${M2_REPO}" -name '*zip' -atime +${AGE} -exec dirname {} \; >> ${OLDFILES}  

for x in `cat ${OLDFILES}`; do rm -rf "$x"; done
