using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.ResponseDTO.Routine
{
    public class RoutineCategoryLevelExerciseResponseDTO
    {
        public int Id { get; set; }
        public int IdRoutineCategoryLevel { get; set; }
        public int IdEquipment { get; set; }
        public int IdExcercise { get; set; }
        public int IdMark { get; set; }
        public string Description { get; set; }
        public int Repetitions { get; set; }
        public decimal Time { get; set; }
        public string Photo { get; set; }
        public string Model3D { get; set; }
        public string Marker { get; set; }
        public string Exercise { get; set; }
        public string ExerciseDescription { get; set; }
        public string Audio { get; set; }
    }
}
