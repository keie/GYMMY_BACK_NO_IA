using ApiDataAccess.General;
using ApiModel.ResponseDTO.Routine;
using ApiModel.Routine;
using ApiRepositories.Routine;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace ApiDataAccess.Routine
{
    class RoutineCategoryRepository : Repository<RoutineCategory>, IRoutineCategoryRepository
    {
        public RoutineCategoryRepository(string connectionString) : base(connectionString)
        {

        }

        public IEnumerable<RoutineCategoryResponseDTO> GetRoutineByEquipment(int idEquipment)
        {
            var dynamicParameters = new DynamicParameters(new
            {
                pIdEquipment=idEquipment
            });
            string sql = @"select distinct(rc.[description]),rc.id,rc.[name],rc.photo from RoutineCategory rc inner join
                        RoutineCategoryLevel rcl on rc.id=rcl.idRoutineCategory  inner join 
                        Routine r on r.idRoutineCategoryLevel=rcl.id inner join
                        Equipment e on e.id=r.idEquipment WHERE r.idEquipment=@pIdEquipment";
            using(var connection=new SqlConnection(_connectionString))
            {
                return connection.Query<RoutineCategoryResponseDTO>(
                    sql, dynamicParameters
                    );
            }
        }

        public IEnumerable<RoutineResponseDTO> GetRoutineByEquipmentAndRoutineCategory(int idEquipment, int IdRoutindCategory)
        {
            var dynamicParameters = new DynamicParameters(new
            {
                pIdEquipment = idEquipment,
                pIdRoutindCategory= IdRoutindCategory
            });
            string sql = @"select r.id,r.[description] as 'routineDescription',rcl.[name],rcl.[description],r.repetitions from RoutineCategory rc inner join
                        RoutineCategoryLevel rcl on rc.id=rcl.idRoutineCategory  inner join 
                        Routine r on r.idRoutineCategoryLevel=rcl.id inner join
                        Equipment e on e.id=r.idEquipment WHERE r.idEquipment=@pIdEquipment and rcl.idRoutineCategory=@pIdRoutindCategory and rc.id=@pIdRoutindCategory";
            using (var connection = new SqlConnection(_connectionString))
            {
                return connection.Query<RoutineResponseDTO>(
                    sql, dynamicParameters
                    );
            }
        }
    }
}
