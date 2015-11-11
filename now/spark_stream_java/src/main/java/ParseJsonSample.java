import org.codehaus.jackson.map.*;
import org.codehaus.jackson.*;

import java.io.File;

/*

Execute with following jars

java -cp ./target/simple-project-1.0.jar:./target/dependency/jackson-core-asl-1.9.13.jar:./target/dependency/jackson-mapper-asl-1.9.13.jar ParseJsonSample user.json

Refered from 
http://www.ngdata.com/parsing-a-large-json-file-efficiently-and-easily/

*/

public class ParseJsonSample {
  public static void main(String[] args) throws Exception {
    JsonFactory f = new MappingJsonFactory();
    JsonParser jp = f.createJsonParser(new File(args[0]));

    JsonToken current;

    current = jp.nextToken();
    if (current != JsonToken.START_OBJECT) {
      System.out.println("Error: root should be object: quiting.");
      return;
    }

    while (jp.nextToken() != JsonToken.END_OBJECT) {
      String fieldName = jp.getCurrentName();
      // move from field name to field value
      current = jp.nextToken();
      if (fieldName.equals("records")) {
        if (current == JsonToken.START_ARRAY) {
          // For each of the records in the array
          while (jp.nextToken() != JsonToken.END_ARRAY) {
            // read the record into a tree model,
            // this moves the parsing position to the end of it
            JsonNode node = jp.readValueAsTree();
            // And now we have random access to everything in the object
            System.out.println("field1: " + node.get("field1").getValueAsText());
            System.out.println("field2: " + node.get("field2").getValueAsText());
          }
        } else {
          System.out.println("Error: records should be an array: skipping.");
          jp.skipChildren();
        }
      } else {
        System.out.println("Unprocessed property: " + fieldName);
        jp.skipChildren();
      }
    }                
  }
}
