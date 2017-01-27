# Spark on Windows Server 2016

The following are a set of steps taken in order to setup Spark on a fresh installation of Windows Server 2016. Note that this installation will not enable HiveContext, but the alternative SqlContext will be available.

## Download and Extract Spark
Download latest release of spark from [apache](spark.apache.org/downloads.html).
Be aware that it is critical that you get the right Hadoop binaries for the version of spark you choose. See section on Hadoop binaries below.
Extract with 7-zip.

## Install Java and Python
Install latest version of [64-bit Java](http://javadl.oracle.com/webapps/download/AutoDL?BundleId=218833_e9e7ea248e2c4826b92b3f075a80e441).
Install [Anaconda3 Python 3.5, 64-bit](https://repo.continuum.io/archive/Anaconda3-4.2.0-Windows-x86_64.exe) (or other version of your choice) for all users. Restart server.

## Test Java and Python
Open command line and type `java -version`. If it is installed properly you will see an output like this:
```
java version "1.8.0_121"
Java(TM) SE Runtime Environment (build 1.8.0_121-b13)
Java HotSpot(TM) 64-Bit Server VM (build 25.121-b13, mixed mode)
```
Type either `python` or `python --v`.
The first will open the python shell after showing the version information. The second will show only version information similar to this:
```
Python 3.5.2 :: Anaconda 4.2.0 (64-bit)
```

## Download Hadoop binary for Windows 64-bit
You likely don't have Hadoop installed on windows, but spark will deep within its core look for this file and possibly other binaries. Thankfully a Hadoop contributor has compiled these and has a [repository](https://github.com/steveloughran/winutils) with binaries for Hadoop 2.6. These binaries will work for spark version 2.0.2, but will not work with 2.1.0. To use spark 2.1.0 download the binaries from [here](https://github.com/karthikj1/Hadoop-2.7.1-Windows-64-binaries/releases/download/v2.7.1/hadoop-2.7.1.tar.gz).

The best tactic for this is to clone the repo and keep the Hadoop folder corresponding to your version of spark and add the hadoop-%version% folder to your path as `HADOOP_HOME`.

## Add Java and Spark to Environment
Add the path to java and spark as environment variables JAVA_HOME and SPARK_HOME respectively.

## Test pyspark
In command line, type `pyspark` and observe output. At this point spark should start in the python shell.

## Setup pyspark to use Jupyter notebook
Instructions for using interactive python shells with pyspark exist within the pyspark code and can be accessed through your editor. In order to use the Jupyter notebook before launching pyspark type the following two commands:

```
set PYSPARK_DRIVER_PYTHON=jupyter
set PYSPARK_DRIVER_PYTHON_OPTS='notebook'
```
Once those variables are set pyspark will launch in the Jupyter notebook with the default SparkContext initialized as `sc` and the SparkSession initialized as `spark`. ProTip: Open http://127.0.0.1:4040 to view the spark UI which includes lots of useful information about your pipeline and completed processes. Any additional notebooks open with spark running will be in consecutive ports i.e. 4041, 4042, etc...
