using System;
using System.Collections.Generic;
using System.Text;
using VetClinic.Interfaces;

namespace VetClinic.Models
{
    class Doctor : IEntity
    {
        public int DoctorId { get; set; }
        public int ClinicId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }

        public override string ToString()
        {
            return $"Doctor Id: {DoctorId}, Clinic Id: {ClinicId}, First Name: {FirstName}, Last Name: {LastName}, Email: {Email}";
        }

    }
}
