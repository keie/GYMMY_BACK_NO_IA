using System;
using System.Collections.Generic;
using System.Text;
using ApiModel.EquipmentModel;
using ApiModel.Routine;

namespace ApiModel.ResponseDTO.Routine
{
    public class RoutineCategoryResponseDTO
    {
        public Equipment Equipment { get; set; }
        public RoutineCategory RoutineCategory { get; set; }
    }
}
