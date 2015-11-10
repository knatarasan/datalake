import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.*;
import org.apache.spark.api.java.function.Function;


public class SimpleApp{
	public static void main(String[] args){

		String logFile=args[0];

		//JavaSparkContext sc= new JavaSparkContext("local","Simple App","/usr/hdp/2.3.0.0-2557/spark/bin/spark-submit",new String[]{"target/simple-project-1.0.jar"});
		//SparkConf conf = new SparkConf().setMaster("local").setAppName("Simple App");      /*Values can be passed from command prompt*/
		SparkConf conf = new SparkConf();				
		JavaSparkContext sc= new JavaSparkContext(conf);

		JavaRDD<String> logData = sc.textFile(logFile).cache();

		long numAs = logData.filter(new Function<String,Boolean>(){
			public Boolean call(String s){ return s.contains("a");}
		}).count();

		long numBs = logData.filter(new Function<String,Boolean>(){
			public Boolean call(String s) { return s.contains("b");}
		}).count();

		System.out.println("Lines with a : "+numAs + ", lines with b: "+numBs);
		System.exit(0);

	}
}
