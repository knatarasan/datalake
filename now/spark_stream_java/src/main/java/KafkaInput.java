/**
 * Illustrates a simple map then filter in Java
 */

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.Function;
import org.apache.spark.streaming.api.java.JavaPairDStream;
import org.apache.spark.streaming.api.java.JavaStreamingContext;
import org.apache.spark.streaming.Duration;
import org.apache.spark.streaming.kafka.*;

/*
USAGE
~/datalake/archive/spark/spark-1.5.1-bin-hadoop2.6/bin/spark-submit --class KafkaInput ./target/simple-project-1.0.jar --master local

tried following as final 

~/datalake/archive/spark/spark-1.5.1-bin-hadoop2.6/bin/spark-submit --master local --jars ~/datalake/archive/spark/spark-1.5.1-bin-hadoop2.6/lib/spark-streaming-kafka_2.11-1.5.1.jar --class KafkaInput ./target/simple-project-1.0.jar

But got following exception
---------------------------
Exception in thread "main" java.lang.NoSuchMethodError: scala.Predef$.ArrowAssoc(Ljava/lang/Object;)Ljava/lang/Object;
	at org.apache.spark.streaming.kafka.KafkaUtils$.createStream(KafkaUtils.scala:59)
	at org.apache.spark.streaming.kafka.KafkaUtils$.createStream(KafkaUtils.scala:99)
	at org.apache.spark.streaming.kafka.KafkaUtils.createStream(KafkaUtils.scala)
	at KafkaInput.main(KafkaInput.java:39)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:57)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)

Follow from ..!

http://spark.apache.org/docs/latest/streaming-kafka-integration.html

*/


public final class KafkaInput {
  public static void main(String[] args) throws Exception {
    //String zkQuorum = args[0];
    //String group = args[1];
    String zkQuorum = "wn1.kara:2181";
    String group ="now_Consumers" ;
    SparkConf conf = new SparkConf().setAppName("KafkaInput");
    // Create a StreamingContext with a 1 second batch size
    JavaStreamingContext jssc = new JavaStreamingContext(conf, new Duration(1000));
    Map<String, Integer> topics = new HashMap<String, Integer>();
    topics.put("twitter-topic", 1);
    JavaPairDStream<String, String> input = KafkaUtils.createStream(jssc, zkQuorum, group, topics);
    input.print();
    // start our streaming context and wait for it to "finish"
    jssc.start();
    // Wait for 10 seconds then exit. To run forever call without a timeout
    jssc.awaitTermination(60000);
    // Stop the streaming context
    jssc.stop();
	}
}
