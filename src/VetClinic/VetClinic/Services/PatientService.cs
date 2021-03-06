﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using VetClinic.Interfaces;
using VetClinic.Models;

namespace VetClinic.Services
{
    class PatientService : IService
    {
        public int AddData(IEntity entity)
        {
			var result = -1;
			try
			{
				//using (var sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Model1"].ConnectionString))
				using (var sqlConnection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=VetClinic;Integrated Security=True"))
				{
					using (var sqlCommand = new SqlCommand("[dbo].[AddPatients]", sqlConnection))
					{
						var patients = (Patient)entity;
						sqlCommand.Parameters.AddWithValue("@Name", patients.Name);
						sqlCommand.Parameters.AddWithValue("@DOB", patients.DOB);
						sqlCommand.Parameters.AddWithValue("@Species", patients.Species);
						sqlCommand.Parameters.AddWithValue("@AddressId", patients.AddressId);
						sqlCommand.Parameters.AddWithValue("@PatientId", patients.PatientId).Direction = ParameterDirection.Output;

						sqlCommand.CommandType = CommandType.StoredProcedure;
						//sqlCommand.Parameters.AddWithValue("@Id", id);
						sqlConnection.Open();

						sqlCommand.ExecuteNonQuery();
						result = Convert.ToInt32(sqlCommand.Parameters["@PatientId"].Value);
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
			var result = new List<IEntity>();
			try
			{
				//using (var sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Model1"].ConnectionString))
				using (var sqlConnection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=VetClinic;Integrated Security=True"))
				{
					using (var sqlCommand = new SqlCommand("[dbo].[DeletePatients]", sqlConnection))
					{
						sqlCommand.CommandType = CommandType.StoredProcedure;
						//sqlCommand.Parameters.AddWithValue("@Id", id);
						sqlConnection.Open();

						using (var sqlDataReader = sqlCommand.ExecuteReader())
						{
							while (sqlDataReader.HasRows && sqlDataReader.Read())
							{
								var patient = new Patient
								{
									PatientId = Convert.ToInt32(sqlDataReader["PatientId"]),
									AddressId = Convert.ToInt32(sqlDataReader["AddressId"]),
									DOB = Convert.ToDateTime(sqlDataReader["DOB"]),
									Name = sqlDataReader["Name"].ToString(),
									Species = sqlDataReader["Species"].ToString()

								};
								result.Remove(patient);
							}
						}
					}
				}
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.Message);
			}
			
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
								var patient = new Patient
								{
									PatientId = Convert.ToInt32(sqlDataReader["PatientId"]),
									AddressId = Convert.ToInt32(sqlDataReader["AddressId"]),
									DOB = Convert.ToDateTime(sqlDataReader["DOB"]),
									Name = sqlDataReader["Name"].ToString(),
									Species = sqlDataReader["Species"].ToString()

								};
								result.Add(patient);
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
