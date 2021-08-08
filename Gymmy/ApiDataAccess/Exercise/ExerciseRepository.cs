using ApiDataAccess.General;
using ApiRepositories.Exercise;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiDataAccess.Exercise
{
    public class ExerciseRepository : Repository<ApiModel.Exercise.Exercise>, IExerciseRepository
    {
        public ExerciseRepository(string connectionString) : base(connectionString)
        {

        }
    }
}
