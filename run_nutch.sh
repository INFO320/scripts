# This script simplifies running a nutch crawl
usage() 
{ 
    echo "" 
    echo "--------------" 
    echo "This script simplifies running a nutch crawl." 
    echo "It requires 1-3 inputs:" 
    echo " - (required) the name of a file containing the urls to crawl. Assumes file is in nutch/urls/" 
    echo " - (optional - 3) the depth of the crawl 1-10 (depth is number of hops from root)" 
    echo " - (optional - 150) the topn for the crawl 1-1000000 (topn is maximum number of links to be fetched in each level)" 
    echo "--------------" 
    echo ""
    echo "Make sure conf/regex-urlfilter.txt has been updated to match url seed file"
    echo "" 
}

# Default values - URL_FILE must be specified
URL_FILE=""
DEPTH=3
TOPN=150
NUTCH_HOME="/home/student/nutch/"

# Make sure we have an acceptable number of parameters
if [ $# -lt 1 ] || [ $# -gt 3 ]
then
    usage
    exit 1
elif [ -z "$NUTCH_HOME" ]
then
    echo "The NUTCH_HOME environment variable should be set to the nutch directry"
    exit 1
else
    cd $NUTCH_HOME
    # The URL seed file must exist and be readable
    if [ -n "urls/$1" ] && [ -r "urls/$1" ]
        then
        URL_FILE=$1

        # replace the default values if the user supplies alternatives
            if [ -n "$2" ]
                    then
                    DEPTH=$2
            fi
            if [ -n "$3" ]
                    then
                    TOPN=$3
            fi
        echo "Running - "$NUTCH_HOME"bin/nutch crawl $URL_FILE -solr http://localhost:8983/solr-example/ -depth $DEPTH -topN $TOPN"
	rm -rf /tmp/hadoop-student/mapred/local/taskTracker/student/jobcache/* #clear hadoop cache
        rm -rf crawl/ #Clear out any incomplete crawls. Causes hadoop to crash if any remants are left.
        bin/nutch crawl urls/$URL_FILE -solr http://localhost:8983/solr-example/ -dir crawl/ -depth $DEPTH -topN $TOPN
    else
        echo
        echo  "Error: URL seed file '$1' does not exist in nutch/urls/"
        echo
        exit 1
    fi
fi
