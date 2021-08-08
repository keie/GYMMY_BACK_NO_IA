using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.Routine
{
    public class Routine
    {
        public int Id { get; set; }
        public int IdRoutineCategoryLevel { get; set; }
        public int IdEquipment { get; set; }
        public int IdExercise { get; set; }
        public int IdMarker { get; set; }
        public string Description { get; set; }
        public int Repetitions { get; set; }
        public decimal Time { get; set; }
        public string Photo { get; set; }

    }
}
