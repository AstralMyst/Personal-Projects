
/**
 * Write a description of class MYfindPassword here.
 *
 * @author kody
 * @version 1
 */
public class CheckPassword
{   
    Object[][] UserList = { // 2d array of login info
        {"user1","password1"},
        {"user2","password2"},
        {"kody","iscool"},
        {"java","java#1"},
        {"cookie","monster"},
    }; 
    
    private boolean CheckUser(String Username,String Password){ //private because this check password so extra safe 
        boolean DoesMatch = false; 
        for (int i = 0; i < 2; i++){
            boolean IsUsername = Username.equals(UserList[i][0]);
            boolean IsPassword = Password.equals(UserList[i][1]);
            if(IsUsername == true && IsPassword == true){
                DoesMatch = true;
            }
        }
        return DoesMatch;
    }
    
    public boolean CheckLogin(String Username, String Password){ //public, so can be called
        boolean DoesMatch = CheckUser(Username, Password); 
        return DoesMatch;
    }
}