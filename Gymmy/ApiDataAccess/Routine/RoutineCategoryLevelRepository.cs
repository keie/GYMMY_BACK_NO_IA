using ApiDataAccess.General;
using ApiModel.Routine;
using ApiRepositories.Routine;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace ApiDataAccess.Routine
{
    public class RoutineCategoryLevelRepository : Repository<RoutineCategoryLevel>, IRoutineCategoryLevelRepository
    {
        public RoutineCategoryLevelRepository(string connectionString) : base(connectionString)
        {

        }

        public IEnumerable<RoutineCategoryLevel> GetListByType(int type)
        {
            var dynamicParameters = new DynamicParameters(new
            {
                type = type
            });
            string sql = @"select distinct rcl.* from RoutineCategoryLevel rcl 
            inner join Routine r on (r.idRoutineCategoryLevel = rcl.id)
            inner join Exercise e on (e.id = r.idExcercise) and (e.[type] = @type or e.[type]=  4)";

            using (var connection = new SqlConnection(_connectionString))
            {
                return connection.Query<RoutineCategoryLevel>(
                    sql, dynamicParameters
                    );
            }
        }
    }
}
