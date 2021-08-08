using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.ResponseDTO.Routine
{
    public class RoutineResponseDTO
    {
        public int Id { get; set; }
        public string RoutineDescription { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int Repetitions { get; set; }
    }
}
