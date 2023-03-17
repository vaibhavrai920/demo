public class AnimalLocator {

    public static String getAnimalNameById(Integer id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String strResp = '';
        system.debug('status code' +response.getStatusCode());
        system.debug('response body' +response.getBody());
        if(response.getStatusCode()==200)
        {
            Map<string, Object> results = (Map<string, Object>) json.deserializeUntyped(response.getBody());
            Map<string, Object> animals = (Map<string, Object>) results.get('animal');
            system.debug('Received following animal' +animals);
            strResp = string.valueof(animals.get('name'));
            system.debug('strResp' +strResp);
        }
        return strResp;
    }
}