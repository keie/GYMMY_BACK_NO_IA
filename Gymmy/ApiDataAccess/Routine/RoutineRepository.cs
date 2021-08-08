using ApiDataAccess.General;
using ApiRepositories.Routine;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiDataAccess.Routine
{
    public class RoutineRepository : Repository<ApiModel.Routine.Routine>, IRoutineRepository
    {
        public RoutineRepository(string connectionString) : base(connectionString)
        {

        }
    }
}
