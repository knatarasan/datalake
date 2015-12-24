 
import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.hive.ql.udf.UDFType;
import org.apache.hadoop.io.LongWritable;

/* test*/
@UDFType(deterministic = false, stateful = true)
public class myUDF extends UDF
{
  private LongWritable result = new LongWritable();

  public myUDF() {
    result.set(2000000);
  }

  public LongWritable evaluate() {
    result.set(result.get() + 1);
    return result;
  }
}