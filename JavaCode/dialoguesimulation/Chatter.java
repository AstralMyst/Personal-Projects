/**
 * Write a description of class AITeacher here.
 *
 * @author Kody Ho
 * @version (a version number or a date)
 */
import java.util.*;
import javax.swing.JOptionPane;
public class Chatter { 
  public static void Message(String string) {
      JOptionPane.showMessageDialog(null, string);
  }
  public static String GuiQ(String Q) {
    String GuiQ = JOptionPane.showInputDialog(Q);
    return GuiQ;
  }
  public static String GuiQ(String Q,String title) { 
    String GuiQ = JOptionPane.showInputDialog(title,Q);
    return GuiQ;
    }
  public static int randomInt(int max) {
      Random rand = new Random(); 
      int int_random = rand.nextInt(max); 
      return int_random;
  }
  public void Main() {
    String[][] keywords = {          
        { "hi", "hello", "hey", "yo"},
        { "On a scale from 1 to 10", "from 1 to 10", "from 1 - 10","rate his","rate her","rate my", "can you rate", "what do you think about", "what are your thoughts on", "how do you feel about",},
        { "who", "what", "when", "where", "how", "why", },     
        { "can i", "can you", "can she", "can he", "can they", "can it", "am i", "are you", "is she", "is he", "is it", "could i", "could you", "could she", "could he", "could they", "could it", "do you", "do i", "does he", "does she", "does it", 
        "did you", "did i", "did he", "did she", "did it","will it", "will i", "will you", "will they", "will she", "will he", "would you", "would i", "would it", "would she", "would he", "would they", "were you", "were they", "were there", "were it",},  
        {"what about","what do","what is","what can",},
        { "where are", "where is", "where will", "where should", "where do", "where can", },                                                                                                                          
    };

    String[][] Answers = {
      { "Hi.", "Hello.", "Hey"},
      { "1/10","2/10","3/10","4/10","5/10","6/10","7/10","8/10","9/10","10/10","11/10",},
      { "I think they are cool.","They're great.","I don't like them.","I think they are bad.","I think they're good","I think they're great." , },
      { "Yes.", "No.", "I don't know." },
      {"That's a great question.","I don't know"},
      { "Over there.", "Right there.", "I don't know."},
    };
    
    String Username = GuiQ("Name", "Please log in");
    System.out.println("Logged in User: "+Username+".");
    Message("Welcome, "+Username+"!");
    
    //Scanner sc = new Scanner(System.in);
    System.out.println("Chatter is online. Ask your question.");
    System.out.println("Your chat experience will be logged here.");
    Message("Chatter is online. Ask your question.");
    
    
    while(true){ //infinite loop
        //String question = sc.nextLine(); //input
        String question = GuiQ("Input","Talk to Chatter");
        System.out.println(Username+": "+question);
        if (question == null){
            System.out.println("Chatter is offline.");
            Message("Chatter is offline.");
            break;
        }
        question = question.toLowerCase(); //to lowercase
        question = " "+question+" ";
        boolean found = false;
        if(question.equalsIgnoreCase(" stop ")){ //if user wants to stop, we stop
            break; //stop
        }
        else{ //if question, check for match
        for(int y = 0; y < keywords.length; y++){ // for each index Y
            for(int x = 0; x < keywords[y].length; x++){ // for each index X in Y
               if(question.contains(" "+keywords[y][x].toLowerCase()+" ")){ //if question is keyword and make sure that it isn't part of another word
                   int responseX = randomInt((Answers[y].length));                   
                   System.out.println("Friend: "+Answers[y][responseX]); //print response.
                   Message(Answers[y][responseX]);
                   question = "";
                   found = true;
                   break; //stop searching
               }
            }
            if(question == "" && found == true){break;} // stop searching Y index
        }
        if(found == false){
            String[] confusion = {"what","i don't understand","can you repeat that","okay","I don't agree","I agree"}; //in case no keyword found
            String rand = confusion[randomInt(confusion.length)];
            System.out.println(rand);
            Message(rand);
        }
        }
    }
    System.out.println("Chatter is offline.");
    Message("Chatter is offline.");
  }
}