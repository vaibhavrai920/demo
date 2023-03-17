global class ScheduleDemo3 implements Schedulable {
    
    global void execute(SchedulableContext sc){
        system.debug('In the execute method of scheduled job');
        
        //BatchDemo1 db = new BatchDemo1();
        //Database.executeBatch(bd);
        //ScheduleDemo3 d3 = new ScheduleDemo3();
        //String sch = '20 30 8 10 2 ?';
        //String jobID = system.schedule('Schedule Job Demo 1', sch, d3);
    }

}