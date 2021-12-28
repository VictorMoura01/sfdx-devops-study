public class TesteQueueable implements Queueable{

    public void execute(QueueableContext context){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            List<Object> animals = (List<Object>) results.get('animals');
            List<MyObject__c> objetos = [SELECT Id, Name FROM MyObject__c];
            for(MyObject__c objeto : objetos){
                for(Object animal: animals) {
                	objeto.Name = (String)animal;
            	}
            }
            update objetos;
        }         
    }
    
}