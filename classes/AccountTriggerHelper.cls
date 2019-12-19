public with sharing class AccountTriggerHelper {
    //Validate the Zip code,update City and State Before Insert
    public Static void updatePostalCodeOnInsert(List<Account> newAccount) {        
        for(Account acc: newAccount){                
            if(String.isNotBlank(acc.BillingPostalCode) && PostalCodes__c.getValues(acc.BillingPostalCode) != null ){
                acc.ZipcodeCity__c = PostalCodes__c.getValues(acc.BillingPostalCode).City__c;
                acc.ZipcodeState__c = PostalCodes__c.getValues(acc.BillingPostalCode).StateID__c;                        
            }else{
                acc.BillingPostalCode.addError('Invalid Zip Code Entered');
            }          
        }
    }    
    //Validate the zipcode, update City and Statebefore Update
    public Static void updatePostalCodeOnEdit(List<Account> newAccount,Map<ID,Account> oldAccountMap) {        
       for(Account acc: newAccount){
            if(String.isNotBlank(acc.BillingPostalCode) && oldAccountMap.get(acc.id).BillingPostalCode != acc.BillingPostalCode && 
                PostalCodes__c.getValues(acc.BillingPostalCode) != null){
                acc.ZipcodeCity__c = PostalCodes__c.getValues(acc.BillingPostalCode).City__c;
                acc.ZipcodeState__c = PostalCodes__c.getValues(acc.BillingPostalCode).StateID__c;                        
            }else{
                acc.BillingPostalCode.addError('Invalid Zip Code Entered');
            }    
        }    
    }
}