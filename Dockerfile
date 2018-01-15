FROM cybermaggedon/accumulo-gaffer:1.2.0

# Notes:
# - Expects a GS key at /key/private.json
# - Three environment variables as described below...

# Environment variables to set
env HDFS_VOLUMES=gs://my-project/accumulo
env NAMENODE_URI=gs://my-project/
env PROJECT_ID=my-project

# Need the Google Storage connector for Hadoop version 2.
COPY gcs-connector-latest-hadoop2.jar /usr/local/hadoop/share/hadoop/hdfs/

# HDFS settings for Google Storage added
COPY hdfs-site.xml /usr/local/hadoop/etc/hadoop/hdfs-site.xml

# Need to give more memory to processes.  Accumulo init fails when Google
# Storage connector is used.  This is best set in the Dockerfile to 'hide'
# it.
ENV ACCUMULO_OTHER_OPTS="-Xmx512m -Xms128m"

CMD sed -i "s/@PROJECT_ID@/${PROJECT_ID}/" \
    /usr/local/hadoop/etc/hadoop/hdfs-site.xml; \
    /start-accumulo

