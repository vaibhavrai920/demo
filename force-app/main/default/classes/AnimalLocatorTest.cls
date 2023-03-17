@isTest
private class AnimalLocatorTest {
    @istest static void AnimalLocatorMock1(){
        Test.setMock(HttpCallOutMock.class, new AnimalLocatorMock());
        string result = AnimalLocator.getAnimalNameById(3);
        string expectedResult = 'cow';
        system.assertEquals(result, expectedResult);
    }

}