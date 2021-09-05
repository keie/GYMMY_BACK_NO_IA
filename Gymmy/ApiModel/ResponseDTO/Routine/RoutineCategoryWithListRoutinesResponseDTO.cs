using ApiModel.EquipmentModel;
using ApiModel.Routine;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.ResponseDTO.Routine
{
    public class RoutineCategoryWithListRoutinesResponseDTO
    {
        public Equipment Equipment { get; set; }
        public List<RoutineCategory> Routines { get; set; }
    }
}
