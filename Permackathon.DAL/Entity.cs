﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Permackathon.DAL
{
    public abstract class Entity
    {
        public int Id { get; protected set; }
    }
}