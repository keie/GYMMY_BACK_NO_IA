using ApiModel.Routine;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.ResponseDTO.Routine
{
    public class RoutineCategoryWithLevelsResponseDTO
    {
        public RoutineCategory RoutineCategory { get; set; }
        public IList<RoutineCategoryLevel> RoutineCategoryLevels { get; set; }
    }
}
