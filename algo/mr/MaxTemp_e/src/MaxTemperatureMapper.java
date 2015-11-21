                           
import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
/*
/usr/hdp/2.3.0.0-2557/hadoop/hadoop-common.jar
*/

import org.apache.hadoop.mapreduce.Mapper;
/*
/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/hadoop-mapreduce-client-core.jar

javac-cp /usr/hdp/2.3.0.0-2557/hadoop/hadoop-common.jar:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/hadoop-mapreduce-client-core.jar *.java

jar cf Max.jar *.class

export HADOOP_CLASSPATH=Max.jar

hadoop jar Max.jar MaxTemperature 

*/

public class MaxTemperatureMapper
    extends Mapper<LongWritable, Text, Text, IntWritable> {

  private static final int MISSING = 9999;
  
  @Override
  public void map(LongWritable key, Text value, Context context)
      throws IOException, InterruptedException {
    
    String line = value.toString();
    String year = line.substring(15, 19);
    int airTemperature;
    if (line.charAt(87) == '+') { // parseInt doesn't like leading plus signs
      airTemperature = Integer.parseInt(line.substring(88, 92));
    } else {
      airTemperature = Integer.parseInt(line.substring(87, 92));
    }
    String quality = line.substring(92, 93);
    if (airTemperature != MISSING && quality.matches("[01459]")) {
      context.write(new Text(year), new IntWritable(airTemperature));
    }
  }
}
