using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using VetClinic.Interfaces;
using VetClinic.Models;

namespace VetClinic.Services
{
    class DoctorService : IService
    {

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
                                var doctor = new Doctor
                                {
                                    DoctorId = Convert.ToInt32(sqlDataReader["DoctorId"]),
                                    ClinicId = Convert.ToInt32(sqlDataReader["ClinicId"]),
                                    FirstName = (sqlDataReader["FirstName"]).ToString(),
                                    LastName = (sqlDataReader["LastName"]).ToString(),
                                    Email = (sqlDataReader["Email"]).ToString(),

                                };

                                result.Add(doctor);
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
