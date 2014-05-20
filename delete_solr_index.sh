# - This script deletes the current Solr index. Use with care!
echo "Do you really want to delete the current Solr index? This action cannot be reverted. y|n"
read answer
if [ "y" == "$answer" ]
then
	echo ""
	echo "Deleting index..."
	echo ""
	curl http://localhost:8983/solr-example/update -H "Content-type: text/xml" --data-binary '<delete><query>*:*</query></delete>'
	curl http://localhost:8983/solr-example/update -H "Content-type: text/xml" --data-binary '<commit />'
	curl http://localhost:8983/solr-example/update -H "Content-type: text/xml" --data-binary '<optimize />'
	echo ""
	echo "Index cleared successfully." 
	echo ""
else
	echo "Aborting delete."
fi

