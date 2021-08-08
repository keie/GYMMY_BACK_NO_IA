using ApiDataAccess.General;
using ApiModel.Routine;
using ApiRepositories.Routine;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiDataAccess.Routine
{
    class RoutineCategoryRepository : Repository<RoutineCategory>, IRoutineCategoryRepository
    {
        public RoutineCategoryRepository(string connectionString) : base(connectionString)
        {

        }
    }
}
