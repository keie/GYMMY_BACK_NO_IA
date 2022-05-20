using ApiModel.ResponseDTO.Routine;
using ApiModel.Routine;
using ApiRepositories.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiRepositories.Routine
{
    public interface IRoutineCategoryRepository : IRepository<RoutineCategory>
    {
        public IEnumerable<RoutineCategory> GetListByType(int type);
        public IEnumerable<RoutineCategoryResponseDTO> GetRoutineByEquipment(int idEquipment);
        public IList<RoutineResponseDTO> GetRoutineByEquipmentAndRoutineCategory(int idEquipment,int IdRoutindCategory);
        //public IEnumerable<RoutineResponseDTO> GetRoutineByEquipmentAndRoutineCategory(int idEquipment,int IdRoutindCategory);
        public IEnumerable<RoutineCategoryLevelExerciseResponseDTO> GetRoutineExercisesByRoutineCategoryLevel(int idRoutineCategoryLevel);
        public IEnumerable<RoutineCategoryLevelExerciseResponseDTO> GetRoutineExercisesByRoutineCategoryLevelType(int idRoutineCategoryLevel, int type);
    }
}
