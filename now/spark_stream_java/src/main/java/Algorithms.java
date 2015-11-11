import com.fasterxml.jackson.databind.ObjectMapper;
//import com.fasterxml.jackson.databind.JsonNode;
import java.io.*;

/* Usage
java -cp ./target/simple-project-1.0.jar:./target/dependency/jackson-databind-2.4.4.jar:./target/dependency/jackson-core-2.4.4.jar:./target/dependency/jackson-annotations-2.4.0.jar Algorithms

Refer to 
	User.java
	user.json
*/

public class Algorithms{
	public static void main(String []args){
		System.out.println("Hello");

	try{
		ObjectMapper mapper = new ObjectMapper(); // can reuse, share globally
		User user = mapper.readValue(new File("user.json"), User.class);

		System.out.println("First Name is "+user.getName().getFirst());

	}catch(Exception e){
		
	}

	}

}
