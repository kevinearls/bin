set -x
if [ "$1" = "" ]
then
  echo "Usage: $0 <branchName>"
  exit 1
fi

echo Ok, about to delete $1
git push origin --delete $1
git branch -D $1
