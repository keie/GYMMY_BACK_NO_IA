﻿using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.ResponseDTO.Routine
{
    public class RoutineCategoryLevelResponseDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Photo { get; set; }
        public int IdRoutineCategory { get; set; }
    }
}
