using ApiModel.RequestDTO.Routine;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Interfaces.Routine
{
    public interface IRoutineLogic
    {
        public int Insert(RoutineRequestDTO dto);
        public bool Update(RoutineRequestDTO dto);
        public ApiModel.Routine.Routine GetById(int id);
        public IEnumerable<ApiModel.Routine.Routine> GetList();
    }
}
