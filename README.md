# Project

The Aim of this project os to setup a data-dependent workflow in Oozie.
Please refer to coordinator.xml for its implementation

# Set up

## Environment variables

These variables should be set on edge node prior to running the code directly or triggering Oozie jobs.

```
export PYSPARK_PYTHON=/usr/local/anaconda-notebooks/bin/python
export OOZIE_URL=http://localhost:11000/oozie
```

## Keytab should be created and moved

Keytab for the user must be created and moved to HDFS prior to commencing any Impala scripts.


## Running a workflow

To run the workflow once (this will use workflow.properties):
```
1. Copy Oozie* to edge node
2. cd into it
3. Use command "sh bin/run_workflow.sh" to run workflow
```

To schedule recurring jobs (this will use coordinator.properties):
```
1. Update coordinator.properties to match workflow.properties with the added line for the schedule
2. Copy Oozie* to edge node
3. cd into it
4. Use command "sh bin/stage_coordinator.sh" to stage coordinator to run recurring jobs.
```

# References

