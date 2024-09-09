
/**
 * Write a description of class fileEncrypt here.
 * Create Code Document.
 * Initialize Class Header.
 * Generate download key out of random sequence of characters.
 * Encrypt file with key.
 * Store key on client and server side.
 * When attempting to access the file, check for the key.
 * If the user has a key, allow access.
 * If not, there is piracy.
 * Print that the user attempted to access/pirate file.
 * Showcase result on gui.
 * @author (your name)
 * @version (a version number or a date)
 */

import java.util.*;
import javax.swing.*;
import java.awt.*;
public class fileEncrypt //class header, 
{   //please note that the constructors are in the other class
    public static void Print(String text) { //i mostly made this because I was too lazy to write it a bunch of times.
        System.out.println(text);
    }
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in); //instance variable
        String Data = "Data"; //instance variable
        randomChar randomChar = new randomChar(); //instance variable
        String Encryption = ""; //instance variable
        Encryption = randomChar.readEncryption();//This is an Accessor Method, as we access the encrypted data from the other class, and are sent a COPY without access to ORIGINAL
        Print("EncKey: "+Encryption);
        Print("Enter Encryption Key");
        String EncResponse = sc.nextLine();
        for(int i = 0; i < 3;i++){
            if(EncResponse.equals(Encryption)){
                Print("Success, you can have this data");
                Print(Data);
                break;
            } 
            else{
                Print("Wrong, Try Again.");
            }
        }
    }
}