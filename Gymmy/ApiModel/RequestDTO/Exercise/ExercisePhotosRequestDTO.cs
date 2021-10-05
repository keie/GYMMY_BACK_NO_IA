using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.RequestDTO.Exercise
{
    public class ExercisePhotosRequestDTO
    {
        public int Id { get; set; }
        public int IdExercise { get; set; }
        public string Photo { get; set; }
    }
}
