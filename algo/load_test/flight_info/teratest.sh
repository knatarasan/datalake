[kannappan@wn2 hive]$hadoop jar /usr/hdp/2.3.0.0-2557/hadoop-mapreduce/hadoop-mapreduce-examples-2.7.1.2.3.0.0-2557.jar terasort 10000000 /datalake/algo/load_test/flight_info/data/terasort/input


[kannappan@wn2 hive]$hadoop jar /usr/hdp/2.3.0.0-2557/hadoop-mapreduce/hadoop-mapreduce-examples-2.7.1.2.3.0.0-2557.jar terasort /datalake/algo/load_test/flight_info/data/terasort/input /datalake/algo/load_test/flight_info/data/terasort/output


[kannappan@wn2 hive]$hadoop jar /usr/hdp/2.3.0.0-2557/hadoop-mapreduce/hadoop-mapreduce-examples-2.7.1.2.3.0.0-2557.jar teravalidate /datalake/algo/load_test/flight_info/data/terasort/output /datalake/algo/load_test/flight_info/data/terasort/validate
