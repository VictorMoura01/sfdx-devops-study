public class Dummy {
    public static final String REGEX_KEY_NAME_START = '(Foreign key external ID:)';
    public static final String REGEX_KEY_NAME_END = '(not found for field).*';
    public static final String REGEX_ENTITY_NAME = '.*(entity)';
    
    public static void run(){
        try{
            MyObject__c objeto = new MyObject__c();
            objeto.Name = 'Objeto de Teste';
            objeto.Lead__r = new Lead(ExternalId__c = 'teste2');
            objeto.Account__r = new Account(ExternalId__c = 'teste2');
            insert objeto;
        }catch(DmlException e){
            if(e.getTypeName() == 'System.DmlException'){
                for(Integer index = 0; index < e.getNumDml(); index++){
                    String keyName = e.getDmlMessage(index).replaceAll(REGEX_KEY_NAME_START, '').replaceAll(REGEX_KEY_NAME_END, '').trim();
                    String entityName = e.getDmlMessage(index).replaceAll(REGEX_ENTITY_NAME, '').trim();
                    System.debug('keyName -> ' + keyName);
                    System.debug('entityName -> ' + entityName);
                    System.debug('fieldLabel -> ' + Schema.getGlobalDescribe().get(entityName).getDescribe().getLabel());
                }
            }
        }
    }
}