public class HiringManagerHandler 
{
    Public static void AfterInsert(List<Hiring_Manager__C> hrs)
    {
        List<Recruiter__C> Rec = new List<Recruiter__C>();
        for(Hiring_Manager__C hr : hrs)
        {
            recruiter__C r = new Recruiter__C();
            r.Name = hr.Name;
            r.Email__C = hr.Email__C;
            r.contact__C = hr.Contact__C;
            r.Location__C= hr.Location__C;
            
            Rec.add(r);
        }
    }

}