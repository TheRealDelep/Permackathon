using System;
using System.Collections.Generic;

namespace Permackathon.DAL.Entities
{
    public class ToDo : Entity
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public DateTime DateStart { get; set; }
        public DateTime DateEnd { get; set; }

        public Member Author { get; set; }
        public Member Responsable { get; set; }
        public Site Site { get; set; }
        public Priority Priority { get; set; }
        public List<Category> Categories { get; set; }
        public State State { get; set; }
    }
}