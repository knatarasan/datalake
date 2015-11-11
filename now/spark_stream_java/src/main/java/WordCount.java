import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.Function;
import org.apache.spark.api.java.function.Function2;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaPairRDD;

import org.apache.spark.api.java.function.PairFunction;
import org.apache.spark.api.java.function.FlatMapFunction;
import org.apache.spark.api.java.function.Function2;

import java.util.Arrays;
import java.util.List;
import java.lang.Iterable;

import scala.Tuple2;

public class WordCount{
	public static void main(String args[]){
		String file = args[0];

		SparkConf conf = new SparkConf();
		JavaSparkContext sc = new JavaSparkContext(conf);
	
		JavaRDD<String> logData = sc.textFile(file);

		long numAs = logData.filter(new Function<String,Boolean>(){
			public Boolean call(String s){return s.contains("medium");}
		}).count();
		

		long numBs = logData.filter(new Function<String,Boolean>(){
			public Boolean call(String s){return s.contains("low");}
		}).count();


		System.out.println("Lines with a : "+numAs + "lines with b : "+numBs);

		    JavaPairRDD<String, Integer> counts = logData.flatMap(
		      new FlatMapFunction<String, String>() {
			public Iterable<String> call(String x) {
			  return Arrays.asList(x.split(" "));
			}}).mapToPair(new PairFunction<String, String, Integer>(){
			    public Tuple2<String, Integer> call(String x){
			      return new Tuple2(x, 1);
			    }}).reduceByKey(new Function2<Integer, Integer, Integer>(){
				public Integer call(Integer x, Integer y){ return x+y;}});
			
			counts.saveAsTextFile(args[1]);
	
		System.exit(0);

	}
}
 

/*

public class WordCount {
  public static void main(String[] args) throws Exception {
	String master = args[0];
	JavaSparkContext sc = new JavaSparkContext(
      master, "wordcount", System.getenv("SPARK_HOME"), System.getenv("JARS"));

    JavaRDD<String> rdd = sc.textFile(args[1]);

    JavaPairRDD<String, Integer> counts = rdd.flatMap(

      new FlatMapFunction<String, String>() {
        public Iterable<String> call(String x) {
          return Arrays.asList(x.split(":"));
        }}).mapToPair(new PairFunction<String, String, Integer>(){
            public Tuple2<String, Integer> call(String x){
              return new Tuple2(x, 1);
            }}).reduceByKey(new Function2<Integer, Integer, Integer>(){
                public Integer call(Integer x, Integer y){ return x+y;}});

    counts.saveAsTextFile(args[2]);
	}
}
*/

