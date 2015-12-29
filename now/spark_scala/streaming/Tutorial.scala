import org.apache.spark._
import org.apache.spark.SparkContext._
import org.apache.spark.streaming._
import org.apache.spark.streaming.twitter._
import org.apache.spark.streaming.StreamingContext._
import TutorialHelper._

object Tutorial {
  def main(args: Array[String]) {
    
    // Checkpoint directory
    val checkpointDir = TutorialHelper.getCheckpointDirectory()

    // Configure Twitter credentials
	val apiKey = "ur0yZLSCOtE7TUOmGgv0OeOFG" 
	val apiSecret = "v2JLWcZKXktlJ9bpmjmlfLBzCoa12Qpwxfx7GouUvcjfPDmHDN" 
	val accessToken = "31794869-LKFB0qa2DcellcCKfgY2h4vW0BCwGWAjHTIrIeMnr" 
	val accessTokenSecret = "2paAAhkd0fE2Eytn3zYYMcRNzlPJ1cMUSNiys9yCd2zhC"

    TutorialHelper.configureTwitterCredentials(apiKey, apiSecret, accessToken, accessTokenSecret)


    // Your code goes here

	val ssc = new StreamingContext(new SparkConf(), Seconds(1))
	val tweets = TwitterUtils.createStream(ssc,None)

	val statueses = tweets.map(status => status.getText())
	statueses.print()
	ssc.checkpoint(checkpointDir)

	ssc.start()
	ssc.awaitTermination()



  }
}

