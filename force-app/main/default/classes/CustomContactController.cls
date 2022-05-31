public with sharing class CustomContactController {

    @AuraEnabled
    public static List<Contact> getContacts(String searchValue){
        String searchPatern = '%' + searchValue + '%';
        List<Contact> contacts = [
            SELECT Id, FirstName, LastName, Email, Account.Name, MobilePhone, CreatedDate, AccountId
            FROM Contact 
            WHERE FirstName 
            LIKE :searchPatern
            ORDER BY FirstName
            LIMIT 20
        ];
        if (contacts.isEmpty() && String.isEmpty(searchValue)) {
            throw newMessageExeption('Contacts list is empty');
        }
        return contacts;
    }

    private static AuraHandledException newMessageExeption(String message) {
        AuraHandledException auraException = new AuraHandledException(message);
        auraException.setMessage(message);
        return auraException;
    }
}
