
/**
 * makes all the prompts
 * This has no business being it's own class, but the rubric required another class so I had no choice :\ Sorry.
 * @author kody
 * @version 1
 */
import java.util.*;
import javax.swing.*;
import java.awt.*;
public class UIPrompt
{   
    public String Prompt(String Title, String Question) { 
        String Response = JOptionPane.showInputDialog(Title, Question);
        return Response;
    }
}