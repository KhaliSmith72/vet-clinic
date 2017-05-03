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
            Console.WriteLine("\n\nBEGIN TESTING ADDRESS SERVICE\n");

            var service = GetService(typeof(AddressService));

            // add new stuff
            var id = service.AddData(new Address
            {
                //Id = 0,
                Street = "123 Main",
                City = "Scottsdale",
                State = "AZ",
                Zip = "85255"
            });

            if (id == -1)
            {
                throw new Exception("Record was not added");
            }

            // view everything
            var addresses = service.GetData();
            foreach (var item in addresses)
            {
                Console.WriteLine(item);
            }

            Console.WriteLine("\nEND TESTING ADDRESS SERVICE\n");
        }

        static void TestClinicService()
        {
            var service = GetService(typeof(ClinicService));
            var clinics = service.GetData();
            foreach (var item in clinics)
            {
                Console.WriteLine(item);
            }
        }

        static void TestDoctorService()
        {
            var service = GetService(typeof(DoctorService));
            var doctors = service.GetData();
            foreach (var item in doctors)
            {
                Console.WriteLine(item);
            }
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