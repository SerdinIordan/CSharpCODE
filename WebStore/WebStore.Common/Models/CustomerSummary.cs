﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebStore.Common.Models
{
    public class CustomerSummary
    {
        public int Id { get; set; }

        public int OrdersCount { get; set; }

        public decimal TotalAmmountCharged { get; set; }

        public DateTime LastOrder { get; set; }
    }
}
