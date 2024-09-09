
/**
 * Write a description of class randomChar here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */

public class randomChar
{   //these functions break down from generating ASCII data, converting to character, then assembling to a whole key.
    private String EncryptKey = "";//instance variable
    public Integer randomlowerChar(){ //generates random ASCII decimal for lowercase alphabet characters
      int min = 97;//instance variable
      int max = 122;//instance variable
      int random_int = (int)Math.floor(Math.random() * (max - min + 1) + min);
      return random_int;
    }
    public Integer randomupperChar(){ //generates random ASCII decimal for uppercase alphabet characters
      int min = 65;//instance variable
      int max = 90;//instance variable
      int random_int = (int)Math.floor(Math.random() * (max - min + 1) + min);
      return random_int;
    }
    public Integer randomNum() { //generates random ASCII decimal for the first ten digits numbers characters
      int min = 48;//instance variable
      int max = 57;//instance variable
      int random_int = (int)Math.floor(Math.random() * (max - min + 1) + min);
      return random_int;
    }
    public String charType() { //generates random character type so that we can implement all 3 types of characters.
      int min = 1;//instance variable
      int max = 3;//instance variable
      int a = 97; //placeholder value, which is not 0 because 97 is ASCII for a, and 0 ASCII is not viable for these purposes.
      int random_int = (int)Math.floor(Math.random() * (max - min + 1) + min);
      if(random_int == 3) {
        a = randomlowerChar();//another constructor
        }
      else if(random_int == 2) {
        a = randomupperChar();//another constructor
        }
      else if(random_int == 1) {
        a = randomNum();//another constructor
        }    
      String Char = Character.toString(a);//instance variable
      return Char;
    }
    public void createEncryption() //a loop that returns the entire string.
    {
        for (int i = 0;i < 15;i++){
        EncryptKey = EncryptKey.concat(charType());
      }
    }
    public String readEncryption(){//Accessor Method accessed from the other class.
        return EncryptKey;
    }
}