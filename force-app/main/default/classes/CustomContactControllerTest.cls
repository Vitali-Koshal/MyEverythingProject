@isTest
class CustomContactControllerTest {
    
    @testSetup
    private static void makeData(){
        List<Contact> contacts = new List<Contact>();
        for(Integer i = 0; i < 5; i++) {
            contacts.add(new Contact(FirstName = 'Name ' + i, LastName = 'LastName'));
        }
        insert contacts;
    }

    @isTest 
    private static void getContacts_getAllFilteredContacts_allContactsIsGot() {
        List<Contact> contacts = [SELECT Id, FirstName FROM Contact WHERE FirstName LIKE 'Name%'];

        Test.startTest();
        Integer methodContactsNumber = CustomContactController.getContacts('Name').size();
        Test.stopTest();

        System.assertEquals(contacts.size(), methodContactsNumber, 'getContacts method doesnt return all contacts');
    }

    @isTest 
    private static void getContacts_getContacts_ErrorThrown() {
        Boolean isException = false;

        Test.startTest();
        List<Contact> allContacts = [SELECT Id FROM Contact];
        delete allContacts;
        try {
            CustomContactController.getContacts('');
        } catch (Exception e) {
            if (e.getMessage().contains('Contacts list is empty')) {
                isException = true;
            }
        }
        Test.stopTest();
        
        System.assert(isException, 'Method should thrown an exception');
    }
}
