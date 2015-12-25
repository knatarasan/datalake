 
import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.hive.ql.udf.UDFType;
import org.apache.hadoop.io.LongWritable;
/*
Refer
http://hadooptutorial.info/writing-custom-udf-in-hive-auto-increment-column-hive/
	
*/	
/* Without the annotation @UDFType(deterministic = false) 
 		this UDF creates only one value 11  (10+1), ie, every call to UDF will return 11 
 
 But using annotation @UDFType(deterministic = false) would work good
 		every call to UDF will return increment    
 */
@UDFType(deterministic = false,stateful=true)

public class myUDF extends UDF
{
  private LongWritable result = new LongWritable();

  public myUDF() {
    result.set(20);
  }

  public LongWritable evaluate() {
    result.set(result.get() + 1);
    return result;
  }
}