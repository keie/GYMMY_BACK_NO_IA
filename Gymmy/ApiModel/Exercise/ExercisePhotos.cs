using ApiModel.RequestDTO.Exercise;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.Exercise
{
    public class ExercisePhotos
    {
        public int Id { get; set; }
        public int IdExercise { get; set; }
        public string Photo { get; set; }

        public ExercisePhotos Mapper(ExercisePhotos obj, ExercisePhotosRequestDTO dto)
        {
            obj.Id = dto.Id;
            obj.IdExercise = dto.IdExercise;
            obj.Photo = dto.Photo;

            return obj;
        }
    }
}
