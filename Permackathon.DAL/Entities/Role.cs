namespace Permackathon.DAL.Entities
{
    public class Role
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Member Member { get; set; }
    }
}