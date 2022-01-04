#!/bin/bash
set -x

#oozie validate -oozie http://localhost:11000/oozie workflow/workflow.xml
oozie validate -oozie http://localhost:11000/oozie  workflow/coordinator.xml


# params
use_case=data_dependent_coord
#start_date=`date -u +%Y-%m-%dT%H:%MZ`
#end_date=`date -u +%Y-%m-%dT%H:%MZ -d '+2 days'`
#end_date=`date -u +%Y-%m-%dT%H:%MZ -d '+22 years'`

# prepare destination folder on HDFS
hdfs dfs -rm -R /user/$USER/$use_case
hdfs dfs -mkdir /user/$USER/$use_case

# put workflow/ into hdfs directory
hdfs dfs -put workflow /user/$USER/$use_case

# Put keytab into the directory - For Impala
hdfs dfs -put -f /home/$USER/$USER.keytab /user/$USER/$use_case/workflow/lib/scripts/

# change permission so Oozie service can access root directory of the use case and its content
hdfs dfs -chmod -R 777 /user/$USER/$use_case
hdfs dfs -chmod -R 777 /user/$USER/output_feed
hdfs dfs -chmod -R 755 /user/$USER/daily_feed
hdfs dfs -chmod -R 755 /user/$USER/ds_input1

# staging Oozie coordinator using current configuration
# oozie job -oozie http://localhost:11000/oozie -config config/coordinator.properties -run
oozie job -oozie http://localhost:11000/oozie  -config config/coordinator.properties -run

#-D start_date=${start_date} -D end_date=${end_date} 