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
            Console.WriteLine("\n\nbegin testing clinic service\n");

            var addressService = GetService(typeof(AddressService));

            var addressId = addressService.AddData(new Address
            {
                //Id = 0,
                Street = "21 Jump St",
                City = "Beverly Hills",
                State = "CA",
                Zip = "90210"
            });

            if (addressId == -1)
            {
                throw new Exception("Record was not added");
            }

            var clinicservice = GetService(typeof(ClinicService));

            // add new stuff
            var id = clinicservice.AddData(new Clinic
            {
                //id = 0,
                Name = "The Bowsery",
                Hours = "9am - 5pm",
                AddressId = addressId 
            });

            if (id == -1)
            {
                throw new Exception("record was not added");
            }

            var service = GetService(typeof(ClinicService));
            var clinics = service.GetData();
            foreach (var item in clinics)
            {
                Console.WriteLine(item);
            }
            Console.WriteLine("\nend testing clinic service\n");

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
			Console.WriteLine("\n\nBEGIN TESTING PATIENT SERVICE\n");

			var addressService = GetService(typeof(AddressService));
			
			var addressId = addressService.AddData(new Address
			{
				//Id = 0,
				Street = "123 Main",
				City = "Scottsdale",
				State = "AZ",
				Zip = "85255"
			});

			if (addressId == -1)
			{
				throw new Exception("Record was not added");
			}

            var patientService = GetService(typeof(PatientService));

			var patientId = patientService.AddData(new Patient
			{
				Name = "Mr.Bubbles",
				Species = "Unknown",
				DOB = DateTime.Now,
				AddressId = addressId
			});

            if (patientId == -1)
            {
                throw new Exception("Record was not added");
            }

            var patients = patientService.GetData();
            foreach (var item in patients)
            {
                Console.WriteLine(item);
            }
            Console.WriteLine("\nEND TESTING PATIENT SERVICE\n");

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