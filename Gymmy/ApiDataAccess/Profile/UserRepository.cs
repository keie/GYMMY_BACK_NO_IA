using ApiDataAccess.General;
using ApiModel.Profile;
using ApiModel.RequestDTO;
using ApiRepositories.Profile;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace ApiDataAccess.Profile
{
    public class UserRepository:Repository<Users>,IUserRepository
    {
        public UserRepository(string connectionString):base(connectionString)
        {

        }

        public Users ValidateUser(LoginRequestDTO dto)
        {
            var parameters = new DynamicParameters(new
            {
                p_email = dto.email,
                p_password = dto.password
            });
            string sql = "SELECT * FROM Users where  email=@p_email and [password]=@p_password";
            using (var connection = new SqlConnection(_connectionString))
            {
                return connection.QueryFirstOrDefault<Users>(
                    sql, parameters);
            }
        }

        public int UpdateProfile(Users obj)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@email", obj.Email);
            parameters.Add("@name", obj.Name);
            parameters.Add("@photo", obj.Photo);
            parameters.Add("@id", obj.Id);
            string sql = @" UPDATE Users set email=@email, name=@name, photo=@photo where id=@id";
            using (var connection = new SqlConnection(_connectionString))
            {
                return connection.Execute(
                    sql, parameters
                );
            }
        }
    }
}
