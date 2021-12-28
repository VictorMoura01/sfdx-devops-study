trigger MyObjectTrigger on MyObject__c (after insert, after update) {
    hurdur();
    
    public static void hurdur(){
      String cronExp = '0 33 09 * * ?';
      if(!System.isFuture()) System.schedule('Jean tá de sacanagem', cronExp, new JeanTaDeSacanagem('sfsfsdfg'));
    }
}