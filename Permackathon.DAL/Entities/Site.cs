using System.Collections.Generic;

namespace Permackathon.DAL.Entities
{
    public class Site
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public Location Location { get; set; }
    }
}