using System;
using System.Collections.Generic;
using VetClinic.Interfaces;
using VetClinic.Models;
using VetClinic.Services;

namespace VetClinic
{
    class Program
    {

        static void Main(string[] args)
        {
            TestAddressService();
            TestClinicService();
            TestDoctorService();
            TestPatientService();
            Console.ReadLine();
		}
		  
        static void TestAddressService()
        {
            var service = GetService(typeof(AddressService));
        }

        static void TestClinicService()
        {
            var service = GetService(typeof(ClinicService));
        }

        static void TestDoctorService()
        {
            var service = GetService(typeof(DoctorService));
        }

        static void TestPatientService()
        {
            var service = GetService(typeof(PatientService));
			var list = service.GetData();
			
			foreach (var item in list)
			{
				Console.WriteLine(item);
			}
			
			
        }

        static IService GetService(Type type)
        {
            if (type == typeof(ClinicService))
            {
                return new ClinicService();
            }
            else if (type == typeof(DoctorService))
            {
                return new DoctorService();
            }
            else if (type == typeof(AddressService))
            {
                return new AddressService();
            }
            else if (type == typeof(PatientService))
            {
                return new PatientService();
            }
            else
            {
                throw new Exception("Type not recognized");
            }
        }
    }
}