package com.kara;
// cc MaxTemperatureReducer Reducer for maximum temperature example
// cc MaxTemperatureReducer2 Reducer for maximum temperature example
// vv MaxTemperatureReducer
import java.io.IOException;
import java.util.Iterator;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.MapReduceBase;
import org.apache.hadoop.mapred.OutputCollector;
import org.apache.hadoop.mapred.Reducer;
import org.apache.hadoop.mapred.Reporter;

// vv MaxTemperatureReducer2
public class MaxTemperatureReducer extends MapReduceBase
  implements Reducer<Text, IntWritable, Text, IntWritable> {
	
  public int surrogate_key=1;

  public void reduce(Text key, Iterator<IntWritable> values,
      OutputCollector<Text, IntWritable> output, Reporter reporter)
      throws IOException {

//	   String str = key+"_"+surrogate_key++;
//	  
//	  Text tt = new Text(str);
    int maxValue = Integer.MIN_VALUE;
    while (values.hasNext()) {
    	System.out.println("###################");
    	System.out.println(key);
    	System.out.println("###################");
      //maxValue = Math.max(maxValue, values.next().get());
      output.collect(key, new IntWritable(values.next().get()));
    }
    //output.collect(key, new IntWritable(maxValue));
  //output.collect(key, new IntWritable(values.next().get()));
  }
}
// ^^ MaxTemperatureReducer2
// ^^ MaxTemperatureReducer