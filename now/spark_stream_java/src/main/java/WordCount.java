import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.Function;
import org.apache.spark.api.java.JavaRDD;


public class WordCount{
	public static void main(String args[]){
		String file = args[0];

		SparkConf conf = new SparkConf();
		JavaSparkContext sc = new JavaSparkContext(conf);
	
		JavaRDD<String> logData = sc.textFile(file);

		long numAs = logData.filter(new Function<String,Boolean>(){
			public Boolean call(String s){return s.contains("a");}
		}).count();
		

		long numBs = logData.filter(new Function<String,Boolean>(){
			public Boolean call(String s){return s.contains("b");}
		}).count();

		System.out.println("Lines with a : "+numAs + "lines with b : "+numBs);
		System.exit(0);

	}
}
