using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using VetClinic.Interfaces;

namespace VetClinic.Services
{
    class PatientService : IService
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
					using (var sqlCommand = new SqlCommand("[dbo].[GetPatients]", sqlConnection))
					{
						sqlCommand.CommandType = CommandType.StoredProcedure;
						//sqlCommand.Parameters.AddWithValue("@Id", id);
						sqlConnection.Open();

						using (var sqlDataReader = sqlCommand.ExecuteReader())
						{
							while (sqlDataReader.HasRows && sqlDataReader.Read())
							{
								//Id = Convert.ToInt32(sqlDataReader["Id"]),
								P
								
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
