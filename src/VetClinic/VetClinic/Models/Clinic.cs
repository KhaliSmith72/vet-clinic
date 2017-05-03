using System;
using System.Collections.Generic;
using System.Text;
using VetClinic.Interfaces;

namespace VetClinic.Models
{
    class Clinic : IEntity
    {
        public int ClinicId { get; set; }
        public int AddressId { get; set; }
        public string Name { get; set; }
        public string Hours { get; set; }

        public override string ToString()
        {
            return $"ClinicId: {ClinicId}, AddressId: {AddressId}, Name: {Name}, Hours: {Hours}";
        }
    }
}
