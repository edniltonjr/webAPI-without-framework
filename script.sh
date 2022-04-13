
echo '\n\n request all heroes'
curl localhost:5005/heroes

echo '\n\n requesting flash'
curl localhost:5005/heroes/1

echo '\n\n requesting with wrong body'
curl --silent -X POST \
    --data-binary '{"invalid": "data"}' \
    localhost:5005/heroes

echo '\n\n requesting with wrong body'
CREATE=$(curl --silent -X POST \
    --data-binary '{"name": "Chapolin", "age": 100, "power": "Strenght"}' \
    localhost:5005/heroes)

echo $CREATE

ID=$(echo $CREATE | jq .id)

echo '\n\n requesting chapolin'
curl localhost:5005/heroes/$ID

