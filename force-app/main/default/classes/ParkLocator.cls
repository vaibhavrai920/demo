public class ParkLocator {
    public static string[] country(string country){
        ParkService.ParksImplPort prk = new ParkService.ParksImplPort();
        return prk.byCountry(country);
    }
}