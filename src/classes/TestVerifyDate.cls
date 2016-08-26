@isTest
private class TestVerifyDate {
    @isTest static void dateTwoWithen30(){
    VerifyDate.CheckDates(System.today(), System.today().addDays(10)) ;
    }
	@isTest static void dateTwoMoreThan30(){
    VerifyDate.CheckDates(System.today(), System.today().addDays(78)) ;
    }
    
}