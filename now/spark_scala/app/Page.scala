/* SimpleApp.scala */
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._
import org.apache.spark.SparkConf

object Page {
  def main(args: Array[String]) {
//    val pagecounts = sc.textFile("file:///home/kannappan/datalake/archive/spark/ampcamp6/data/pagecounts")
//	pagecounts.take(10).foreach(println)

    val logFile = "file:///home/kannappan/datalake/archive/spark/ampcamp6/data/pagecounts" // Should be some file on your system
    val conf = new SparkConf().setAppName("Simple Application")
    val sc = new SparkContext(conf)
    val logData = sc.textFile(logFile, 2).cache()

	logData.take(10).foreach(println)
  }
}
