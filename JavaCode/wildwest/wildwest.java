/*
* Ok, so heres the deal. Since Java Tables can only hold one data type (kinda stupid), I don't feel like completing this because from my current skill level, I'm unable to do this efficiently
* If I were to try to accomplish this I might go insane with the number of tables I'll need. I'm pretty sure I can do something with JTables but I just don't feel like relearning that right now.
* Thus, I'm going to hold back on this until much later. Sorry.
* P.S this might be easier if I could just re-use some old Lua projects and convert that to Java but I'd rather learn how to do things myself lol.
*/




import java.util.Scanner;
public class wildwest{
	
	public static void clearScreen(){
		for (int i = 0; i < 50; i++){
			System.out.println("");
		}
	}
	
	public static int findInt(){
		Scanner input=new Scanner(System.in);
		if(input.hasNextInt()) {
			return input.nextInt();
		}
		System.out.println("Invalid Input");
		return -1;
	}
	
	public static void main(String args[]){
		Scanner input=new Scanner(System.in);
		
		//initializing important variabls
		
		int Day = 1;
		String Time = "Morning"; // days will have 3 stages; Morning, Noon, Night
		String Location = "Saloon"; //General Store, Saloon, Church, Sheriff's Office, Bank, Mines, Woods, Hideout, Black Market
		int Gold = 100; //starting coins
		int Health = 10;
		int Fame = 0;
		int Kills = 1;
		
		String Weapon = "None";
		int Bullets = 0;
		
		boolean hasPickaxe = false;
		int pickDurability = 0;
		boolean hasAxe = false;
		int axeDurability = 0;
		boolean hasRod = false;
		int rodDurability = 0;
		
		System.out.println("Welcome to the Wild West");
		System.out.println("");
		
		System.out.println("Name your character:");
		String charName = "John Cowboy";
		charName = input.nextLine();
		clearScreen();
		
		
		while (Health > 0 /*&& (Fame < 50 || Fame > -50)*/) //initially was going to end if fame reached, but decided what matters is if you die.
		{
		
		// get random event
		
		int randomEvent = (int)Math.floor((Math.random()*20.0)+0.5);
		//System.out.println(randomEvent); //testing purposes
		
		System.out.println("Day "+Day);
		System.out.println(Time);
		System.out.println("=======");
		System.out.println("Gold: "+Gold);
		System.out.println("Health: "+Health);
		System.out.println("Location: "+Location);
		System.out.println("=======");
		System.out.println("[0] Give up");
		System.out.println("[1] Move");
		System.out.println("[2] Act");
		
		int userInput = -1;
		while (userInput == -1){
			userInput = findInt();
		}
		boolean Looping = false;
		if (userInput == 0){
			if (Fame > 0){
				System.out.println(charName+" rode off into the sunset, never to be seen again...");
			}
			else {
				System.out.println(charName+" turned themselves in, tired of the criminal life.");
			}
			break;
		}
		else if(userInput == 1){
			System.out.println("[0] General Store");
			System.out.println("[1] Saloon");
			System.out.println("[2] Church");
			System.out.println("[3] Sheriff's Office");
			System.out.println("[4] Bank");
			System.out.println("[5] Mines");
			System.out.println("[6] Woods");
			if (Fame < -5){
				System.out.println("Infamy");
				System.out.println("=======");
				System.out.println("[7] Hideout");
				System.out.println("[8] Black Market");
			}
			Looping = true;
			while (Looping == true){
				userInput = -1;
			while (userInput == -1){
				userInput = findInt();
			}
			
			if (userInput == 0) {
				Location = "General Store";
				Looping = false;
			}
			else if(userInput == 1) {
				Location = "Saloon";
				Looping = false;
			}
			else if(userInput == 2) {
				Location = "Church";
				Looping = false;
			}
			else if(userInput == 3) {
				Location = "Sheriff's Office";
				Looping = false;
			}
			else if(userInput == 4) {
				Location = "Bank";
				Looping = false;
			}
			else if(userInput == 5) {
				Location = "Mines";
				Looping = false;
			}
			else if(userInput == 6) {
				Location = "Woods";
				Looping = false;
			}
			else if(userInput == 7 && Fame < -5) {
				Location = "Hideout";
				Looping = false;
			}
			else if(userInput == 8 && Fame < -5) {
				Location = "Black Market";
				Looping = false;
			}
			else
			{
				System.out.println("Invalid Location");
			}
			}
			
		}

		else if(userInput == 2){
			
		}
		else{
			System.out.println("Invalid Option");
		}
		
		clearScreen();
		
		
		
		
		
		
		}
		
		
		
		System.out.println("Game Over!");
		if (Fame > 50){
			if (Fame > 100){
				System.out.println(charName + " had become a well known figure by the end of their time.");
				System.out.println("Through their various glories, they will go down in history as one of the greatest!");
				System.out.println("They ultimately died a legend and thier story will be recounted throughout generations.");
			}
			else
			{
				System.out.println(charName + " was well liked among their peers.");
				System.out.println("The town held a major funeral for them in their honor.");
				System.out.println("Unfortunately, after a few generations, their name was forgotten.");
				System.out.println("Their story is lost to time like most others.");
			}
		}
		else if(Fame < -50){
			if (Fame < -100){
				System.out.println(charName + " had become a notorious figure by the end of their time.");
				System.out.println("Through their various escapades, they built a name for themselves as one of history's infamous few!");
				System.out.println("Despite their criminal antics, they died a legend and thier story will be recounted throughout generations.");
			}
			else
			{
				System.out.println(charName + "'s escapades finally came to an end.");
				System.out.println("Though their defeat was celebrated by the townsfolk,");
				System.out.println("after a few generations, their name was forgotten.");
				System.out.println("Their story is lost to time like most others.");
			}
		}
		else {
			System.out.println(charName + " left as they had lived. Silently, and humbly.");
				System.out.println("Their friends mourned their loss, but soon too, they forgot of them.");
				System.out.println("Their story will never be told again.");
		}
		
		System.out.println("=======");
		System.out.println("Gold: "+Gold);
		System.out.println("Health: "+Health);
		System.out.println("Fame: "+Fame);
		System.out.println("Kills: "+Kills);
		
	}
	
}