using ApiDataAccess.General;
using ApiModel.Exercise;
using ApiModel.ResponseDTO.Exercise;
using ApiRepositories.Exercise;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace ApiDataAccess.Exercise
{
    public class ExercisePhotosRepository : Repository<ExercisePhotos>, IExercisePhotoRepository
    {
        public ExercisePhotosRepository(string connectionString) : base(connectionString)
        {

        }

        public IEnumerable<ExercisePhotosResponseDTO> GetExercisePhotos(int idExercise)
        {
            var dynamicParameters = new DynamicParameters(new
            {
                idExercise = idExercise
            });
            string sql = @"select * from ExercisePhotos where idExercise = @idExercise";
            using (var connection = new SqlConnection(_connectionString))
            {
                return connection.Query<ExercisePhotosResponseDTO>(
                    sql, dynamicParameters
                    );
            }
        }
    }
}
