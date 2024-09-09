/**
 * The main part of code
 * 
 * @author kody
 * @version 1
 */
public class Main{
    public static void main(String[] arg){
        UIPrompt q = new UIPrompt();
        CheckPassword cp = new CheckPassword(); 
        int MaxPasswordLength = 12;
        int Retries = 0;
        boolean loggedout = true;
        boolean recaptchad = false;
            String Username = q.Prompt("Login","Username");
            String Password = q.Prompt("Login","Password");
        while(loggedout == true){
            if(Password.length()>MaxPasswordLength){
                Password = q.Prompt("Password too long","Password");
                Retries++;
            }
            while(Retries < 2){
                boolean LoginSuccess = cp.CheckLogin(Username, Password);
                if(LoginSuccess == true){
                    loggedout = false;
                    break;
                }
                else{
                    Retries++;
                    Username = q.Prompt("Login failed;","Username"); //retry
                    Password = q.Prompt("Login failed","Password");
                    if(Retries >= 2 && recaptchad == false){
                        Recaptcha rc = new Recaptcha();
                        String BypassCode = rc.Recaptcha();
                        String BackupCode = q.Prompt("Too many failed tries","Enter backupcode");
                        if(BackupCode.equalsIgnoreCase(BypassCode)){ //if the backup code is right
                            Retries = 0;
                            recaptchad = true; //they can only recaptcha once
                        }
                    }
                    break;
                }
            }
            
        }
        if(loggedout == false){
            String Input = q.Prompt("Login Successful","yay");
        }
        else{String Input = q.Prompt("Login Failed","locked");}
    }
}