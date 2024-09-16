/*
* This game is super unbalanced but whatever. I think I should have not included the parry options
* 
*
*/



import java.util.Scanner;
public class fightinggame{
	
	public static void clearScreen(){
		for (int i = 0; i < 50; i++){
			System.out.println("");
		}
	}
	
	public static int readInt(){
		Scanner input=new Scanner(System.in);
		if(input.hasNextInt()) {
			return input.nextInt();
		}
		System.out.println("Invalid Input");
		return -1;
	}
	
	public static void main(String args[]){
		
		Scanner input=new Scanner(System.in);
		int level = 1;
		double mxHealth = 10.0;
		double Health = mxHealth;
		double Damage = 5.0;
		
		System.out.println("Welcome to the fighting game");
		System.out.println("");
		//unnecessary blob of flair
		System.out.println("Name your character:");
		String charName = "John Hero";
		charName = input.nextLine().toUpperCase();
		clearScreen();
		
		while (Health > 0.0){ 
			System.out.println("A new enemy approaches!");
			//generate villain
			String enemyName = "ENEMY";
			double enemyHealth = Math.floor((Math.random()*15.0*level)+0.5);
			double enemyDamage = Math.floor((Math.random()*5.0*level)+0.5);
			
			//combat loop
			while (enemyHealth > 0.0 && Health > 0.0){
				//all info the player needs
				
				System.out.println("==================");
				System.out.println("["+charName+"]");
				System.out.println("LVL"+level);
				System.out.println("Health: "+Health);
				System.out.println("Attack: "+Damage);
				System.out.println("==================");
				System.out.println("["+enemyName+"]");
				System.out.println("Health: "+enemyHealth);
				System.out.println("==================");
				System.out.println("[0] Block");
				System.out.println("[1] Parry");
				System.out.println("[2] Attack");
				System.out.println("[3] Give up"); // wah wah wah game too hard for you?
				System.out.println("==================");
				
				//enemy move
				String moveTxt = "";
				double enemyMove = Math.floor((Math.random()*2.0*level)+0.5); //was supposed to be an int but i accidently wrote the code as double so the easier thing to do is ot make this double
				//System.out.println(enemyMove); //TESTING ONLY
				if (enemyMove == 0.0){
					enemyMove = 0.0;
					moveTxt = enemyName+" blocks!";
				}
				else if (enemyMove == 1.0){
					enemyMove = 1.0;
					moveTxt = enemyName+" parries!";
					enemyHealth -= 1.5;
				}
				else if (enemyMove == 2.0){
					enemyMove = 2.0;
					moveTxt = enemyName+" attack!";
				}
				
				//user input
				
					int userInput = readInt();
					System.out.println("");
					System.out.println("");
					if (userInput == 0){
						System.out.println(charName + " blocks!");
						System.out.println(moveTxt);
						//calculate results
						if (enemyMove == 0.0){
							System.out.println("Nothing happened!");
						} else if (enemyMove == 1.0 || enemyMove == 2.0){
							System.out.println(charName+" blocked successfully!");
							Health -= 0.5;
							enemyHealth -= 1.5;
						}
					}
					else if (userInput == 1){
						System.out.println(charName + " parries!");
						System.out.println(moveTxt);
						//calculate results
						if (enemyMove == 0.0){
							System.out.println(enemyName+" blocked successfully!");
							Health -= 1.5;
							enemyHealth -= 0.5;
						} else if (enemyMove == 1.0){
							int chance = (int)Math.floor((Math.random()*2.0*level)+0.5);
							if (chance < 1){
								System.out.println(charName+" parried successfully!");	
								enemyHealth -= Damage/2;
							}
							else {
								System.out.println(enemyName+" parried successfully!");
								Health -= enemyDamage/2;
							}
						} else if (enemyMove == 2.0){
						System.out.println(charName+" parried successfully!");
							enemyHealth -= Damage*2;
						}
					}
					else if (userInput == 2){
						System.out.println(charName + " attack!");
						System.out.println(moveTxt);
						if (enemyMove == 0.0){
							System.out.println(enemyName+" blocked successfully!");
							Health -= 1.5;
							enemyHealth -= 0.5;
						} else if (enemyMove == 1.0){
							System.out.println(enemyName+" parried successfully!");
							Health -= enemyDamage*2;
						} else if (enemyMove == 2.0){
							System.out.println("Both attack!");
							Health -= enemyDamage;
							enemyHealth -= Damage;
						}
					}
					else{
						System.out.println(charName + " gave up like a coward!");
						Health = 0.0;
					}
			}	
			if (Health > 0.0){ // if player still alive
				
				if (Health < mxHealth){
					
					if (Health+1 < mxHealth){ //heal 1
						System.out.println("+1 Health");
						Health += 1.0;
					}
					else { //if the difference in health is less than 1, only heal that amount
						System.out.println("+"+ (mxHealth - Health) +"Health");
						Health = mxHealth;
					}
					
				}
				
				level += 1;
				System.out.println("LEVEL UP");
				System.out.println("[0] Upgrade Health");
				System.out.println("[1] Upgrade Damage");
				int userInput = readInt();
				if (userInput == 0){
					mxHealth += 2;
				}
				else if (userInput == 1){
					Damage += 2;
				}
				
				
				System.out.println("[0] to continue");
				int Input = readInt();
				System.out.println("");
				System.out.println("");
				System.out.println("");
				if(!(Input==0)){
					break;
				}
				
			}
			
		}
		System.out.println("Game Over");
		System.out.println("==================");
		System.out.println("You died at level "+level);
		System.out.println("");
		System.out.println("");
		System.out.println("");

		
	}
}