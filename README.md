
Accumulo on Google Storage.  I use this to run Gaffer.

This is similar to my Accumulo -> {Zookeeper, Hadoop} stack, except that
instead of Hadoop for HDFS, this bundles in the Google Storage connector with
Accumulo, so that Accumulo can write directly to Google Storage.

Expects environment variables:
- `HDFS_VOLUMES` specifies the bucket location.  Use a URI in the form:
  `gs://MY-BUCKET/accumulo`.
- `NAMENODE_URI` specifies the bucket location.  Use a URI in the form:
  `gs://MY-BUCKET/`.
- `PROJECT_ID` name of my project.

Expects a private key of a service accounts with GS access at
/key/private.json.

