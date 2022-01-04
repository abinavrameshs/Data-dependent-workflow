#!/bin/bash
set -x

#oozie validate -oozie http://localhost:11000/oozie workflow/workflow.xml
oozie validate -oozie http://localhost:11000/oozie  workflow/workflow.xml

# params
use_case=data_dependent_wf

# prepare destination folder on HDFS
hdfs dfs -rm -R /user/$USER/$use_case
hdfs dfs -mkdir /user/$USER/$use_case

# put workflow/ into hdfs directory
hdfs dfs -put workflow /user/$USER/$use_case

# Put keytab into the directory - For Impala
hdfs dfs -put -f /home/$USER/$USER.keytab /user/$USER/$use_case/workflow/lib/scripts/

# change permission so Oozie service can access root directory for the use case and its content
chmod -R 755 ~/$use_case

# launching Oozie workflow using current configuration
#oozie job -verbose -oozie http://localhost:11000/oozie -config config/workflow.properties -run

oozie job -verbose -oozie http://localhost:11000/oozie -config config/workflow.properties -run