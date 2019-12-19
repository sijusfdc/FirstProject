public with sharing class AccountTriggerHandler {
    public static void OnBeforeInsert(List<Account> newAccount)
    {
        //Update City and State based on Zipcode typed
        AccountTriggerHelper.updatePostalCodeOnInsert(newAccount);
    }
    public static void OnAfterInsert(List<Account> newAccount)
    {
        
    }
    public static void OnAfterUpdate( List<Account> newAccount, List<Account> oldAccount, Map<ID, Account> newAccountMap , Map<ID, Account> oldAccountMap )
    {
        
    }    
   // public static void OnBeforeUpdate( List<Account> newAccount, List<Account> oldAccount, Map<ID, Account> newAccountMap , Map<ID, Account> oldAccountMap )
    public static void OnBeforeUpdate()
    {
        //Update City and State based on the changes in Zipcode
        //AccountTriggerHelper.updatePostalCodeOnEdit(newAccount,oldAccountMap); 
        AccountTriggerHelper.updatePostalCodeOnEdit((List<Account>)Trigger.New,(Map<id,Account>)Trigger.oldMap);
    }
}