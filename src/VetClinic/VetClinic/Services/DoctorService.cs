using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using VetClinic.Interfaces;

namespace VetClinic.Services
{
    class DoctorService : IService
    {
        public int DoctorId { get; set; }
        public int CliniId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }

        public int AddData(IEntity entity)
        {
            throw new NotImplementedException();
        }

        public void DeleteData(IEntity entity)
        {
            throw new NotImplementedException();
        }

        public IList<IEntity> GetData()
        {
            var result = new List<IEntity>();
            try
            {
                //using (var sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Model1"].ConnectionString))
                using (var sqlConnection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=VetClinic;Integrated Security=True"))
                {
                    using (var sqlCommand = new SqlCommand("[dbo].[GetDoctor]", sqlConnection))
                    {
                        sqlCommand.CommandType = CommandType.StoredProcedure;
                        //sqlCommand.Parameters.AddWithValue("@Id", id);
                        sqlConnection.Open();

                        using (var sqlDataReader = sqlCommand.ExecuteReader())
                        {
                            while (sqlDataReader.HasRows && sqlDataReader.Read())
                            {
                                var doctorId = new DoctorService();
                                var ClinicId = new DoctorService();
                                var firstName = new DoctorService();
                                var lastName = new DoctorService();
                                var email = new DoctorService();



                                doctorId = Convert.ToInt32(sqlDataReader["DoctorId"]),



                                //Id = Convert.ToInt32(sqlDataReader["Id"]),
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return result;
        }

        public void UpdateData(IEntity entity)
        {
            throw new NotImplementedException();
        }
    }
}
