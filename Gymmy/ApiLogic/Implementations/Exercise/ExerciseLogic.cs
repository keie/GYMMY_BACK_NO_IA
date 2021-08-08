using ApiLogic.Interfaces.Exercise;
using ApiUnitOfWork.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Implementations.Exercise
{
    public class ExerciseLogic : IExerciseLogic
    {
        private readonly IUnitOfWork _unitOfWork;

        public ExerciseLogic(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
    }
}
