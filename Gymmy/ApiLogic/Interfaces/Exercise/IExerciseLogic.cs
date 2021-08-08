using ApiModel.RequestDTO.Exercise;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Interfaces.Exercise
{
    public interface IExerciseLogic
    {
        public int Insert(ExerciseRequestDTO dto);
        public bool Update(ExerciseRequestDTO dto);
        public ApiModel.Exercise.Exercise GetById(int id);
        public IEnumerable<ApiModel.Exercise.Exercise> GetList();
    }
}
