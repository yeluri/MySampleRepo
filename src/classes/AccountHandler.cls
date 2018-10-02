/*
  @author: Added by Satya
  modified on 29 Sep 2018 - Git & Jenkins Test
  modified on 29 Sep 2018 - Git & Jenkins Test -- 1
  modified on 02 Oct 2018 - Git & Jenkins Test -- 2
  modified on 02 Oct 2018 - Git & Jenkins Test -- 3
  modified on 02 Oct 2018 - Git & Jenkins Test -- 4
  modified on 02 Oct 2018 - Git & Jenkins Test -- 5
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
        	System.debug('Throwing Exception: ' + ex.getMessage());
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