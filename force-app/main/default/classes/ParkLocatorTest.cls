@isTest
private class ParkLocatorTest {
    @isTest 
    static void testCallout(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String country = 'USA';
        system.assertEquals(new List<String>{'one','two','three'}, ParkLocator.country(country));
    }
    
}