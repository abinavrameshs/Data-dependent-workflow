#!/bin/bash

set -x

### Obtain arguements
echo "start_date: "$1
echo "end_date: "$2
echo "keytab_path: "$3
echo "nominalTime: "$4
echo "LAST_MONTH: "$5
echo "TWO_DAYS_PREVIOUS: "$6
echo "ACTUAL_TIME: "$7
echo "DATA_IN_EVENT_DS_INPUT1: "$8
echo "DATA_IN_EVENT_DAILY_FEED: "$9
echo "DATA_OUT: "${10}
echo "CURRENT_DAY: "${11}
echo "nameNode: "${12}
echo "jobTracker: "${13}
echo "launchUser: "${14}


start_date=$1
end_date=$2
keytab_path=$3
nominalTime=$4
LAST_MONTH=$5
TWO_DAYS_PREVIOUS=$6
ACTUAL_TIME=$7
DATA_IN_EVENT_DS_INPUT1=$8
DATA_IN_EVENT_DAILY_FEED=$9
DATA_OUT=${10}
CURRENT_DAY=${11}
nameNode=${12}
jobTracker=${13}
launchUser=${14}

echo "Print out contents : "
ls -alrth

main_function() {
    echo "start_date: "$start_date
    echo "end_date: "$end_date
    echo "keytab_path: "$keytab_path
    echo "nominalTime: "$nominalTime
    echo "LAST_MONTH: "$LAST_MONTH
    echo "TWO_DAYS_PREVIOUS: "$TWO_DAYS_PREVIOUS
    echo "ACTUAL_TIME: "$ACTUAL_TIME
    echo "DATA_IN_EVENT_DS_INPUT1: "$DATA_IN_EVENT_DS_INPUT1
    echo "DATA_IN_EVENT_DAILY_FEED: "$DATA_IN_EVENT_DAILY_FEED
    echo "DATA_OUT: "${CURRENT_DAY}
    echo "CURRENT_DAY: "${CURRENT_DAY}
}

main_function >> variables.txt

#main_function 2>&1 >> ~/variables.txt

cat variables.txt

hdfs dfs -put variables.txt  ${nameNode}/user/${launchUser}/output_feed/$CURRENT_DAY/