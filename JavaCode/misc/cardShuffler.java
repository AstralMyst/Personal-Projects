
import java.util.Random;

class Card {
	
	int value = 1;
	// through 1 - 52
	
	public void set(int n){
		if (n > 0 && n <= 52) {
			value = n;
		}
		
	}
	
	public String get()
	{
		String suit;
		if (value <= 13){
			suit = "Clubs";
		}
		else if (value <= 26){
			suit = "Diamonds";
		}
		else if (value <= 39){
			suit = "Hearts";
		}
		else{
			suit = "Spades";
		}
		int cardValue = (value%13==0)?(13):(value%13);

		return cardValue+" of "+suit;
	}
	
}

public class cardShuffler {
	
	public static Card[] shuffle(Card[] Deck){
		
		Random rand = new Random();
		int pos1 = rand.nextInt(52);
		int pos2 = rand.nextInt(52);
		//System.out.println("Shuffling... "+Deck[pos1].get()+" and "+Deck[pos2].get());
		Card placeHolder = Deck[pos1];
		Deck[pos1] = Deck[pos2];
		Deck[pos2] = placeHolder;
		return Deck;
	}
	
	public static void main(String[] args){
		
		Card[] Deck = new Card[52];
		System.out.println(Deck.length);
		for (int i = 0; i < Deck.length; i++){
				Deck[i] = new Card();
				Deck[i].set(i+1);
				//System.out.println(Deck[i].get());
		}
		
		//shuffle
		
		for (int i = 0; i < 52; i++){
		//System.out.println("Shuffling...");
			Deck = shuffle(Deck);
		}
		for (int i = 0; i < Deck.length; i++){
			System.out.println(Deck[i].get());
		}
	}
	
}