using ApiModel.RequestDTO.Routine;
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

        public Routine Mapper(Routine obj, RoutineRequestDTO dto)
        {
            obj.Id = dto.Id;
            obj.IdRoutineCategoryLevel = dto.IdRoutineCategoryLevel;
            obj.IdEquipment = dto.IdEquipment;
            obj.IdExercise = dto.IdExercise;
            obj.IdMarker = dto.IdMarker;
            obj.Description = dto.Description;
            obj.Repetitions = dto.Repetitions;
            obj.Time = dto.Time;
            obj.Photo = dto.Photo;

            return obj;
        }

    }
}
