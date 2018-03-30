/*
  @author: Added by Satya
*/
public class AccountHandler {

    public AccountHandler(){
    	   Account retAcc = insertNewAccount('Trailhead Acc');
        	system.debug('retAcc' + retAcc);
          // Account retAcc1 = insertNewAccount('');
          contact c = [select id, Account.Industry from Contact where Phone='415.555.1212'];
          updateConAccount(c);
    }
    
    public static Account insertNewAccount(string accName){
        Account a;
        try{
            a = new Account(Name=accName);
            upsert a;
            Id acctId = a.Id;
            
            Contact c = new Contact(
                FirstName=accName,
                LastName='Con',
                Phone='415.555.1212',
     //           SPID__c='12334',
                AccountId=acctID);
			upsert c;
            
        }catch(DMLException ex){
            return null;
        }
        return a;
    }
    
    public static void updateConAccount(Contact c){
        
        Contact con = c;
        con.Account.Industry = 'Technology';
		update con;
        
        update con.account;
    }
}