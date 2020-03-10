﻿using System.Collections.Generic;

namespace Permackathon.DAL.Entities
{
    public class Member
    {
        public int id { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public List<Role> Roles { get; set; }
    }
}