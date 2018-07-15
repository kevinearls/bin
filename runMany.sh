#/bin/bash
iterations=3
tests=(JournalTest)
tests=("${tests[@]}" PageFileTest)
for test in "${tests[@]}"
do
    echo "Test is" $test
    repeat $iterations $test
done