cd ../
python sample-metadata.py -s $2 --node "urn:node:LTER" --from $1-01-01T00:00:00.000Z --to $1-12-31T00:00:00.000Z && 
mkdir -m 755 -p /Users/scgordon/CrosswalksWorkflow/rawMetadata/Metarcheology/LTERthroughTime2/$1 &&
cp -r result/ /Users/scgordon/CrosswalksWorkflow/rawMetadata/Metarcheology/LTERthroughTime2/$1 && find result -mindepth 1 -delete