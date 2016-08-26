@isTest
public class TestRestrictContactByName {
    @isTest static void isNameInvalid(){
        Contact c = new Contact(LastName = 'INVALIDNAME');
        insert c;
    }
}