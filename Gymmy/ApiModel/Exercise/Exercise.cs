using ApiModel.RequestDTO.Exercise;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.Exercise
{
    public class Exercise
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Photo { get; set; }

        public Exercise Mapper(Exercise obj, ExerciseRequestDTO dto)
        {
            obj.Id = dto.Id;
            obj.Name = dto.Name;
            obj.Description = dto.Description;
            obj.Photo = dto.Photo;

            return obj;
        }
    }
}
