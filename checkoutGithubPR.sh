#set -x                                                                                                                                                                        
if [ "$#" != 1  ]; then
    echo "1 argument required, which is the PR number"
    exit 1
fi
git fetch upstream pull/${1}/head:pr${1}
git checkout pr${1}

