@IsTest
public class DummyTest {

    @TestSetup
    static void setup(){
        Account acc = new Account(Name = 'teste', ExternalId__c = 'teste');
        insert acc;
    }
    
    @IsTest
    static void jeanTaDeSacanagem(){
        Dummy.run();
    }
    
    @IsTest
    static void testExternalObject(){
        
    }
}