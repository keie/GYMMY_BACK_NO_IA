using ApiModel.Exercise;
using ApiModel.RequestDTO.Exercise;
using ApiModel.ResponseDTO.Exercise;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Interfaces.Exercise
{
    public interface IExercisePhotosLogic
    {
        public int Insert(ExercisePhotosRequestDTO dto);
        public bool Update(ExercisePhotosRequestDTO dto);
        public ExercisePhotos GetById(int id);
        public IEnumerable<ExercisePhotosResponseDTO> GetByIdExercise(int idExercise);
        public IEnumerable<ExercisePhotos> GetList();
    }
}
