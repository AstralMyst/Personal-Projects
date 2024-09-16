
import java.util.Scanner;
public class higherlower{
	
	
	public static int readInt(){
		Scanner input=new Scanner(System.in);
		if(input.hasNextInt()) {
			return input.nextInt();
		}
		System.out.println("Invalid Input");
		return -1;
	}

	
	public static void main(String[] args){
		
		
		System.out.println("");
		System.out.println("");
		System.out.println("");
		System.out.println("|||   Welcome to this dumb game   |||");
		System.out.println("____________________________");
		System.out.println("The premise is very simple");
		System.out.println("Guess if the next number will be higher or lower");
		System.out.println("There is a max of 100 and minimum of 0");
		System.out.println("____________________________");
		System.out.println("Type [0] to start");
		System.out.println("");
		
		int lastNum = (int)Math.floor((Math.random()*100.0)+0.5);
		int streak = 0;
		
		boolean inGame = true;
		int next = readInt();
				System.out.println("");
				System.out.println("");
				System.out.println("");
				System.out.println("");
		if (next == 0 || next == 1){
			while (inGame){
				System.out.println("");
				System.out.println("");
				System.out.println("");
				System.out.println("");
				System.out.println("ROUND "+streak);
				System.out.println("Will the next number be [greater] than or [less] than |||   "+lastNum+"   ||| ?");
				System.out.println("[0] to quit");
				System.out.println("[1] if higher");
				System.out.println("[2] if lower");
				int nextNum = (int)Math.floor((Math.random()*100.0)+0.5);
				
				while (true){ // loops until valid input is provided
					int input = readInt();
					if (input == 0){
						inGame = false;
						break;
					}
					else if (input == 1){ 
						inGame = (nextNum >= lastNum); //if the next number is greater than or equal to the last, set inGame to true
						break;
					}
					else if(input == 2){
						inGame = (nextNum <= lastNum); // the opposite of input == 1 section
						break;
					}
					else if(input == 4 && next == 1){
						System.out.println("Next number is "+nextNum); // cheat for testing purposes
					}
					else{
						System.out.println("Invalid Input"); 
					}
				}
				
				lastNum = nextNum; //set the last number to the next number
				if (inGame == true){ 
					System.out.println("[[CORRECT!]] The next number was |||   "+lastNum+"   |||");
					streak += 1;
				}
				
				
			}
			
			
		System.out.println("");
		System.out.println("");
		System.out.println("");
		System.out.println("");
		System.out.println("____________________________");
		System.out.println("|||   Game Over!   |||");
		System.out.println("The next number was "+lastNum+"."); //it looks confusing but in the loop the last number is set to the next number before looping
		System.out.println("You had a streak of "+streak);
		System.out.println("Nice try!");	
			
		}
		System.out.println("____________________________");
		System.out.println("Goodbye!");
		System.out.println("");
		System.out.println("");
		System.out.println("");
		System.out.println("");
		System.out.println("");
		
		
		
		
	}
	
	
}