

#A. Prepare an UDF to generate AutoIncrement value

1.create a class with following java file in eclipse
-----
import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.hive.ql.udf.UDFType;
import org.apache.hadoop.io.LongWritable;


@UDFType(deterministic = false, stateful = true)
public class myUDF extends UDF
{
  private LongWritable result = new LongWritable();

  public AutoIncrementUDF() {
    result.set(0);
  }

  public LongWritable evaluate() {
    result.set(result.get() + 1);
    return result;
  }
}
---
Following annotaion is important 
@UDFType(deterministic = false, stateful = true)

You should add jar files to that Project folder like
Right Click on project —> Build Path —> Configure Build Path —> Libraries —> Add External Jars —> Select Hadoop and Hive Lib folder Jars files and Add other Jars files In Hadoop folder —–> Click Ok.


2. Right click on project —> Export —> create Jar

provide the location of jar file to copy (eg:/home/kannappan/myUDF.jar)

3.  hive> ADD JAR /home/kannappan/datalake/dw/ingest/hive_auto_incr/myUDF.jar;

4.  hive> CREATE TEMPORARY FUNCTION incr AS 'myUDF';

5. Test 
 hive>select incr(), * from customer;


create table A (c1 int, c2 varchar(10));

insert into A values (incr(),'Summa1');
insert into A values (1,'Summa1');
insert into A values (2,'Summa2');


create table B as select incr(),c2 from A;

 
#B. Follow   datalake/dw/ingest/simple_scd2.sql for a working version of SCD2

