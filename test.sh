output=`curl localhost:30001/poke`
if [[ $output == "\"cdab\"" ]]
then
  echo "Test passed"
  exit 0
else
  echo "Test failed"
  exit 1
fi
