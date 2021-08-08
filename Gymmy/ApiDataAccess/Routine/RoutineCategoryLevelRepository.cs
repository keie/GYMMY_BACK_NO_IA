using ApiDataAccess.General;
using ApiModel.Routine;
using ApiRepositories.Routine;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiDataAccess.Routine
{
    public class RoutineCategoryLevelRepository : Repository<RoutineCategoryLevel>, IRoutineCategoryLevelRepository
    {
        public RoutineCategoryLevelRepository(string connectionString) : base(connectionString)
        {

        }
    }
}
