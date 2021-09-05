using ApiDataAccess.General;
using ApiModel.EquipmentModel;
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
            string sql = @"select  distinct(rc.[description]) as description,rc.id,rc.[name],rc.photo,e.id,e.[name],e.description,e.photo from RoutineCategory rc inner join
                        RoutineCategoryLevel rcl on rc.id=rcl.idRoutineCategory  inner join 
                        Routine r on r.idRoutineCategoryLevel=rcl.id inner join
                        Equipment e on e.id=r.idEquipment WHERE r.idEquipment=@pIdEquipment";
            using(var connection=new SqlConnection(_connectionString))
            {
                return connection.Query<RoutineCategory,Equipment, RoutineCategoryResponseDTO>(
                    sql, (routineCategory,equipment) => {
                        RoutineCategoryResponseDTO dto = new RoutineCategoryResponseDTO();
                        dto.RoutineCategory = routineCategory;
                        dto.Equipment = equipment;
                        return dto;
                    },dynamicParameters);
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


        public IEnumerable<RoutineCategoryLevelExerciseResponseDTO> GetRoutineExercisesByRoutineCategoryLevel(int idRoutineCategoryLevel)
        {
            var dynamicParameters = new DynamicParameters(new
            {
                pIdRoutineCategoryLevel = idRoutineCategoryLevel
            });
            string sql = @"select r.*, e.name as Exercise from Routine r inner join Exercise e on(r.idExcercise = e.id) 
            where r.idRoutineCategoryLevel = @pIdRoutineCategoryLevel";
            using (var connection = new SqlConnection(_connectionString))
            {
                return connection.Query<RoutineCategoryLevelExerciseResponseDTO>(
                    sql, dynamicParameters
                    );
            }
        }
    }
}
