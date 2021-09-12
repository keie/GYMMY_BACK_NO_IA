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
        public IEnumerable<RoutineCategoryResponseDTO> GetRoutineByEquipment(int idEquipment);
        public IList<RoutineResponseDTO> GetRoutineByEquipmentAndRoutineCategory(int idEquipment,int IdRoutindCategory);
    }
}
