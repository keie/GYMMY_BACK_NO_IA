using ApiModel.RequestDTO.Routine;
using ApiModel.ResponseDTO.Routine;
using ApiModel.Routine;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Interfaces.Routine
{
    public interface IRoutineCategoryLogic
    {
        public int Insert(RoutineCategoryRequestDTO dto);
        public bool Update(RoutineCategoryRequestDTO dto);
        public RoutineCategory GetById(int id);
        public IEnumerable<RoutineCategory> GetList();
        public RoutineCategoryWithListRoutinesResponseDTO GetRoutineByEquipment(int idEquipment);
        public IList<RoutineWithLevelsResponseDTO> GetRoutineByEquipmentAndRoutineCategory(int idEquipment, int IdRoutindCategory);
    }
}
