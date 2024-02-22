#!/bin/bash

current_path=$(pwd)
case "$(uname)" in
Linux)
  bin_abs_path=$(readlink -f $(dirname $0))
  ;;
*)
  bin_abs_path=$(
    cd $(dirname $0)
    pwd
  )
  ;;
esac
base=${bin_abs_path}
config_file=$base/application.properties

export LANG=en_US.UTF-8
export BASE=$base

if [ ! -e $config_file ]; then
  echo "configration("$config_file") is not exist, please create then first!" 2>&2
  exit 1
fi

## set java path
if [ -z "$JAVA" ]; then
  JAVA=$(which java)
fi
if [ -z "$JAVA" ]; then
  echo "Cannot find a Java JDK. Please set either set JAVA or put java (>=1.8) in your PATH." 2>&2
  exit 1
fi
echo "JAVA: $JAVA"

XXL_JAVA_OPTS=${XXL_JAVA_OPTS:-"-Xms1024m -Xmx1024m"}
str=$(file -L $JAVA | grep 64-bit)
if [ -n "$str" ]; then
  JAVA_OPTS="-server $XXL_JAVA_OPTS -Xmn1024m -XX:SurvivorRatio=2 -Xss256k -XX:-UseAdaptiveSizePolicy -XX:MaxTenuringThreshold=15 -XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:+UseFastAccessorMethods -XX:+UseCMSInitiatingOccupancyOnly -XX:+HeapDumpOnOutOfMemoryError"
else
  JAVA_OPTS="-server $XXL_JAVA_OPTS -XX:NewSize=256m -XX:MaxNewSize=256m"
fi
echo "JAVA_OPTS: $JAVA_OPTS"
JAVA_OPTS=" $JAVA_OPTS -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8"

echo "CONFIG_FILE: $config_file"

$JAVA -jar $JAVA_OPTS xxl-job-executor.jar
