import requests
import simplejson as json

def print_num_found(json_obj):
    print(json_obj['response']['numFound'])

def print_url_and_boost(json_obj):
    tmp = []
    for item in json_obj['response']['docs']:
        tmp.append((float(item['boost']), item['url']))

    sort_by_boost = sorted(tmp, key=lambda x: float(x[0]), reverse=True)

    for item in sort_by_boost:
        print("Boost: {}\tUrl: {}".format(item[0], item[1]))
    
def print_all(json_obj):
    print('\n--- All output ---')
    print(json.dumps(json_obj, sort_keys = False, indent = 4))

#-------------------------------------------------------------------------------
# Main
#-------------------------------------------------------------------------------
def main():
    r = requests.get("http://localhost:8983/solr/collection1/select?q=*%3A*&rows=100&wt=json&indent=true")
    json_obj = json.loads(r.text)
    print_num_found(json_obj)
    print_url_and_boost(json_obj)
    print_all(json_obj)

if __name__ == '__main__':
    main()

