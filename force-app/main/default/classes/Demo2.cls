public class Demo2 {
	
	public string helloWorldString; // Instance member variable
	private static final String DEFAULT_STRING;  //static member variable
    
    static{
        DEFAULT_STRING = 'Hello World';     //static initializer block
    }
		
	public Demo2(){
		this(DEFAULT_STRING);            //constructor
	}
	
	public Demo2(String stringToDisplay){   //overloaded constructor
		this.helloWorldString = stringToDisplay;
	}
	
	public void printOutput(){            // method
		System.debug('Display text: ' + helloWorldString);
	}
	
	public static void printOutput1(){            // static method
		System.debug('This is a static method');
	}
}