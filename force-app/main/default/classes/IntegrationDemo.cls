@RestResource(urlMapping='/Opportunities/*')
global with sharing class IntegrationDemo {
@HttpGet
global static Opportunity getOpportunityById(){
RestRequest request = RestContext.request;
// grab the opp id fromt the url
String oppId = request.requestURI.substring(request.requestURI.lastIndexof('/')+1);
Opportunity result = [select name, stagename, leadsource, closedate, probability from opportunity where id =:oppId];
return result;
}

@HttpPost
global static ID createOpportunity(String name, String stage, String closedate, String source){
	Opportunity newOpportunity = new Opportunity(name=name, stagename=stage,leadsource=source,closedate=date.valueOf(closedate));
	insert newOpportunity;
	return newOpportunity.id;
}	

@HttpDelete
global static void deleteOpportunity(){
	RestRequest request = RestContext.request;
	String oppId = request.requestURI.substring(request.requestURI.lastIndexof('/')+1);
	Opportunity thisOpp = [select id from opportunity where id = :oppId];
	delete thisOpp;
}

@HttpPut
global static ID upsertOpportunity(String name, String stage, String closedate, String source, String id){
	Opportunity thisOpportunity = new Opportunity(Id=id, name=name,stagename= stage, leadsource=source,closedate=Date.valueOf(closedate));
	upsert thisOpportunity;
	return thisOpportunity.id;
}

/*@HttpPatch
global static ID updateOpportunityFields(){
	RestRequest request = RestContext.request;
	String OpportunityId = request.requestURI.substring(request.requestURI.lastIndexOf('/') +1);
	Opportunity thisOpportunity = [SELECT id from Opportunity where id =:OpportunityId];
	Map<String, Object> params = (Map<String, Object>).JSON.deserializeUntyped(request.requestbody.tostring());
	for(String fieldName : params.keySet()){
		thisOpportunity.put(fieldName, params.get(fieldName));
	}
	update thisOpportunity;
	return thisOpportunity.id;
	
}*/

}