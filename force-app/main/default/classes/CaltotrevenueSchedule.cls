Global class CaltotrevenueSchedule implements system.Schedulable
{
    Global void execute (System.SchedulableContext Scontext)
    {
        Caltotrevenue Revenuebatch = new Caltotrevenue();
        Database.executeBatch(Revenuebatch, 10);
    }

}