using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using VetClinic.Interfaces;
using VetClinic.Models;

namespace VetClinic.Services
{
    class AddressService : IService
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
                using (var sqlConnection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=VetClinic;Integrated Security=True"))
                {
                    using (var sqlCommand = new SqlCommand("[dbo].[GetAddresses]", sqlConnection))
                    {
                        sqlCommand.CommandType = CommandType.StoredProcedure;
                        sqlConnection.Open();

                        using (var sqlDataReader = sqlCommand.ExecuteReader())
                        {
                            while (sqlDataReader.HasRows && sqlDataReader.Read())
                            {
                                var address = new Address
                                {
                                    Id = Convert.ToInt32(sqlDataReader["AddressId"]),
                                    Street = sqlDataReader["Street"].ToString(),
                                    City = sqlDataReader["City"].ToString(),
                                    State = sqlDataReader["State"].ToString(),
                                    Zip = sqlDataReader["Zip"].ToString(),
                                };

                                result.Add(address);
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
