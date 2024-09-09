/**
 * A simple rock paper and scissors game
 * Made in free time and for fun.
 * @author kody ho
 * @version 1
 */


import java.util.*;
import javax.swing.JOptionPane; // import necessary extensions

public class rockpaperscissors {

	
	public static void Message(String string) { // basic methods I copy over from all projects using these extensions
      JOptionPane.showMessageDialog(null, string);
	}
	public static String GuiQ(String Q) {
    String GuiQ = JOptionPane.showInputDialog(Q);
    return GuiQ;
	}
	public static String GuiQ(String Q,String title) { // The same as GuiQ but with a title. They are functionally identical but with minor changes
    String GuiQ = JOptionPane.showInputDialog(title,Q);
    return GuiQ;
    }
	
	public static boolean searchChoiceIndex(String[] opt, Integer userResponse, Integer rndChoice){ //Check for user input in table of options, and compare with random number to determine winner
		if ((userResponse == rndChoice + 1 && rndChoice < opt.length)||(rndChoice == opt.length-1 && userResponse == 0)){
			return true;
		}
		return false;
	}
	
	public static int randomInt(int max) { //  basic random number method I've been using forever
    Random rand = new Random(); 
    int int_random = rand.nextInt(max); 
    return int_random;
	}
	
	public static void main (String[] args){ // the main code
		String[] opt = { // the options: modular for future changes if I wanted to add more options
			"Rock",
			"Paper",
			"Scissors",
		};
		int UserScore = 0; // track user and computer scores to track streaks.
		int PCScore = 0;
		boolean loop = true;
		while (loop){ // the main loop
			int userResponse = -1;
			while (userResponse < 0){ // loop when no input
			String response = GuiQ("Rock, Paper, or Scissors?").toUpperCase(); //toUpperCase allows input to be case blind
			for (int x = opt.length-1; x >= 0; x--){ // for every item in String[] opt, check if user's input is equal to string
				if (opt[x].toUpperCase().equals(response)){
					userResponse = x;
					break;
				}
			}
			}
			
 			Integer rndChoice = randomInt(opt.length-1); //this gets computer's random selection
			while (rndChoice == userResponse){rndChoice = randomInt(opt.length-1);} //makes sure there is never a draw
			boolean userwin = searchChoiceIndex(opt, userResponse, rndChoice);//gets whether or not the user wins
			String _message = "You: "+opt[userResponse]+". Computer: "+opt[rndChoice]+". ";
			if (userwin == true){UserScore++;Message(_message+"User wins!");}else{PCScore++;Message(_message+"Computer wins!");}
			Message("User: "+UserScore+" | Computer: "+PCScore);
			String cont = GuiQ("Yes or No","Continue?");
			loop = !(cont.toUpperCase().equals("NO")||cont.toUpperCase().equals("N"));			
		}
	}
	
}