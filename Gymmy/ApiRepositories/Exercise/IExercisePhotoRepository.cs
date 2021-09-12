using ApiModel.Exercise;
using ApiModel.ResponseDTO.Exercise;
using ApiRepositories.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiRepositories.Exercise
{
    public interface IExercisePhotoRepository : IRepository<ExercisePhotos>
    {
        public IEnumerable<ExercisePhotosResponseDTO> GetExercisePhotos(int idExercise);
    }
}
