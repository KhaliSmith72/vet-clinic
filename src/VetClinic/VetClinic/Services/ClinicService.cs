using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using VetClinic.Interfaces;

namespace VetClinic.Services
{
    class ClinicService : IService
    {
        public int ClinicId { get; set; }
        public int AddressId { get; set; }
        public string Name { get; set; }
        public string Hours { get; set; }

        public override string ToString()
        {
            return $"ClinicId: {ClinicId}, AddressId: {AddressId}, Name: {Name}, Hours: {Hours}";
        }

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
                    using (var sqlCommand = new SqlCommand("[dbo].[GetClinic]", sqlConnection))
                    {
                        sqlCommand.CommandType = CommandType.StoredProcedure;
                        //sqlCommand.Parameters.AddWithValue("@Id", id);
                        sqlConnection.Open();

                        using (var sqlDataReader = sqlCommand.ExecuteReader())
                        {
                            while (sqlDataReader.HasRows && sqlDataReader.Read())
                                                               
                                {
                                    ClinicId = Convert.ToInt32(sqlDataReader["ClinicId"]);
                                    AddressId = Convert.ToInt32(sqlDataReader["ClinicId"]);
                                    Name = sqlDataReader["Name"].ToString();
                                    Hours = sqlDataReader["Hours"].ToString();
                                }
                            Console.WriteLine();
                        };
                        return result;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            };

        }

        public void UpdateData(IEntity entity)
        {
            throw new NotImplementedException();
        }
    }
}
