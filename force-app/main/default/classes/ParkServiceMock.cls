@isTest
global class ParkServiceMock implements WebServiceMock {
    
    global void doInvoke(
        Object stub,
        Object request,
        Map<string, object> response,
        string endpoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responsetype
    ){
       parkService.byCountryResponse response_x = new parkService.byCountryResponse();
        response_x.return_x = new List<string>{'One', 'Two', 'Three'};
            response.put('response_x', response_x);
    }
    

}