using ApiModel.RequestDTO.Routine;
using ApiModel.Routine;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Interfaces.Routine
{
    public interface IRoutineCategoryLevelLogic
    {
        public int Insert(RoutineCategoryLevelRequestDTO dto);
        public bool Update(RoutineCategoryLevelRequestDTO dto);
        public RoutineCategoryLevel GetById(int id);
        public IEnumerable<RoutineCategoryLevel> GetList();
    }
}
