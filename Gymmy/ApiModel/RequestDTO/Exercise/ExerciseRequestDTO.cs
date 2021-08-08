using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.RequestDTO.Exercise
{
    public class ExerciseRequestDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Photo { get; set; }
    }
}
