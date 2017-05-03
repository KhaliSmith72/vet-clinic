using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using VetClinic.Interfaces;
using VetClinic.Models;

namespace VetClinic.Services
{
    class ClinicService : IService
    {
        
        public int AddData(IEntity entity)
        {
            var result = -1;

            try
            {
                using (var sqlConnection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=VetClinic;Integrated Security=True"))
                {
                    using (var sqlCommand = new SqlCommand("[dbo].[AddClinic]", sqlConnection))
                    {
                        var clinic = (Clinic)entity;
                        sqlCommand.Parameters.AddWithValue("@Name", clinic.Name);
                        sqlCommand.Parameters.AddWithValue("@Hours", clinic.Hours);
                        sqlCommand.Parameters.AddWithValue("@AddressId", clinic.AddressId);
                        sqlCommand.Parameters.AddWithValue("@clinicId", clinic.ClinicId).Direction = ParameterDirection.Output;
                        sqlCommand.CommandType = CommandType.StoredProcedure;
                        sqlConnection.Open();

                        sqlCommand.ExecuteNonQuery();
                        result = Convert.ToInt32(sqlCommand.Parameters["@ClinicId"].Value);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return result;
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
                    using (var sqlCommand = new SqlCommand("[dbo].[GetClinic]", sqlConnection))
                    {
                        sqlCommand.CommandType = CommandType.StoredProcedure;
                        //sqlCommand.Parameters.AddWithValue("@Id", id);
                        sqlConnection.Open();

                        using (var sqlDataReader = sqlCommand.ExecuteReader())
                        {
                            while (sqlDataReader.HasRows && sqlDataReader.Read())
                            {

                                var clinic = new Clinic
                                {
                                    ClinicId = Convert.ToInt32(sqlDataReader["ClinicId"]),
                                    AddressId = Convert.ToInt32(sqlDataReader["AddressId"]),
                                    Name = sqlDataReader["Name"].ToString(),
                                    Hours = sqlDataReader["Hours"].ToString(),
                                };
                                result.Add(clinic);
                            }
                            Console.WriteLine();
                        };
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            };
            return result;
        }

        public void UpdateData(IEntity entity)
        {
            throw new NotImplementedException();
        }
    }
}
