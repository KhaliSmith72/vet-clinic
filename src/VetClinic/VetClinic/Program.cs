using System;
using VetClinic.Interfaces;
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
            var addresses = service.GetData();
            foreach (var item in addresses)
            {
                Console.WriteLine(item);
            }
        }

        static void TestClinicService()
        {
            var service = GetService(typeof(ClinicService));
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