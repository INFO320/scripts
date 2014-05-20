import requests
import simplejson as json

r = requests.get("http://localhost:8983/solr/collection1/select?q=*%3A*&rows=100&wt=json&indent=true")
json_obj = json.loads(r.text)
print(json_obj['response']['numFound'])
tmp = []
for item in json_obj['response']['docs']:
    tmp.append((float(item['boost']), item['url']))

sort_by_boost = sorted(tmp, key=lambda x: float(x[0]), reverse=True)

for item in sort_by_boost:
    print("Boost: {}\tUrl: {}".format(item[0], item[1]))

