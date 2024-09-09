/**
 * Write a description of class MYfindPassword here.
 *
 * @author kody
 * @version 1
 */
import java.util.*;
public class Recaptcha
{
    public int RandomNumber(int upperbound){
      Random rand = new Random(); //instance of random class
      int int_random = rand.nextInt(upperbound);
      
      return int_random;
    }
    public String Recaptcha(){
        String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"; //characters to choose from
        String BypassCode = "";
        for(int i = 0; i < 5; i++){ //5 letter recaptcha sequence (for bots)
            int Index = RandomNumber(alphabet.length());
            Character CharChar = alphabet.charAt(Index); //converting to string
            String StringChar = CharChar.toString();
            BypassCode = BypassCode.concat(StringChar); //add to string
        }
        System.out.println(BypassCode);
        return BypassCode; //return
    }
}