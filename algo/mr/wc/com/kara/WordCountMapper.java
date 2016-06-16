                           
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

javac -cp /usr/hdp/2.3.0.0-2557/hadoop/hadoop-common.jar:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/hadoop-mapreduce-client-core.jar *.java

jar cf WC.jar *.class

export HADOOP_CLASSPATH=WC.jar

hadoop jar WC.jar WordCount /datalake/mr/data/wc/data/Animals /datalake/mr/wc/data/out

*/

public class WordCountMapper
    extends Mapper<LongWritable, Text, Text, IntWritable> {

    private final static IntWritable one = new IntWritable(1);
     private Text word = new Text();


  @Override
  public void map(LongWritable key, Text value, Context context)
      throws IOException, InterruptedException {


	     public void map(LongWritable key, Text value, OutputCollector<Text, IntWritable> output, Reporter reporter) throws IOException {
	       String line = value.toString();
	       StringTokenizer tokenizer = new StringTokenizer(line);
	       while (tokenizer.hasMoreTokens()) {
	         word.set(tokenizer.nextToken());
	         output.collect(word, one);
	       }

  }
}
