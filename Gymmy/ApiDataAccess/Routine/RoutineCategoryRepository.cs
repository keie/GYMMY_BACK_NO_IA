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

        public IList<RoutineResponseDTO> GetRoutineByEquipmentAndRoutineCategory(int idEquipment, int IdRoutindCategory)
        {
            var dynamicParameters = new DynamicParameters(new
            {
                pIdEquipment = idEquipment,
                pIdRoutindCategory= IdRoutindCategory
            });
            string sql = @"select r.id,r.[description] as 'routineDescription',r.IdExcercise, ex.description as ExerciseDescription,rcl.id AS IdRoutineCategoryLevel,rcl.[name],rcl.[description],r.repetitions, r.[time],r.photo,r.model3D,r.marker,r.audio 
                        from RoutineCategory rc inner join RoutineCategoryLevel rcl on rc.id=rcl.idRoutineCategory  inner join Routine r on r.idRoutineCategoryLevel=rcl.id
						inner join Exercise ex on ex.id = r.idExcercise inner join Equipment e on e.id=r.idEquipment WHERE r.idEquipment=@pIdEquipment and rcl.idRoutineCategory=@pIdRoutindCategory and rc.id=@pIdRoutindCategory";
            using (var connection = new SqlConnection(_connectionString))
            {
                return (IList<RoutineResponseDTO>)connection.Query<RoutineResponseDTO>(
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
            string sql = @"select r.*, e.name as Exercise, e.description as ExerciseDescription from Routine r inner join Exercise e on(r.idExcercise = e.id) 
            where r.idRoutineCategoryLevel = @pIdRoutineCategoryLevel";
            using (var connection = new SqlConnection(_connectionString))
            {
                return connection.Query<RoutineCategoryLevelExerciseResponseDTO>(
                    sql, dynamicParameters
                    );
            }
        }

        public IEnumerable<RoutineCategory> GetListByType(int type)
        {
            var dynamicParameters = new DynamicParameters(new
            {
                type = type
            });
            string sql = @"select distinct rc.* from RoutineCategory rc
            inner join RoutineCategoryLevel rcl on (rcl.idRoutineCategory = rc.id)
            inner join Routine r on (r.idRoutineCategoryLevel = rcl.id)
            inner join Exercise e on (e.id = r.idExcercise) and (e.[type] = @type or e.[type]=  4)";

            using (var connection = new SqlConnection(_connectionString))
            {
                return connection.Query<RoutineCategory>(
                    sql, dynamicParameters
                    );
            }
        }

        public IEnumerable<RoutineCategoryLevelExerciseResponseDTO> GetRoutineExercisesByRoutineCategoryLevelType(int idRoutineCategoryLevel, int type)
        {
            var dynamicParameters = new DynamicParameters(new
            {
                pIdRoutineCategoryLevel = idRoutineCategoryLevel,
                pType = type
            });
            string sql = @"select r.*, e.name as Exercise, e.description as ExerciseDescription from Routine r 
            inner join Exercise e on(r.idExcercise = e.id) 
            where r.idRoutineCategoryLevel = @pIdRoutineCategoryLevel and (e.[type]= @pType or e.[type]=  4)";
            using (var connection = new SqlConnection(_connectionString))
            {
                return connection.Query<RoutineCategoryLevelExerciseResponseDTO>(
                    sql, dynamicParameters
                    );
            }
        }

    }
}
