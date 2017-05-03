using System;
using System.Collections.Generic;
using System.Text;
using VetClinic.Interfaces;

namespace VetClinic.Models
{
    class Patient : IEntity
    {
		public string Name { get; set; }
		public string Species { get; set; }
		public DateTime DOB { get; set; }
		public int AddressId { get; set; }
		public int PatientId { get; set; }

		public override string ToString()
		{
			return $"Name: {Name}, Species: {Species}, DOB: {DOB}, AddressId: {AddressId}, PatientId: {PatientId}";
		}
	}
}
