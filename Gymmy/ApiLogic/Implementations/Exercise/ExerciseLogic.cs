using ApiLogic.Interfaces.Exercise;
using ApiLogic.Interfaces.General;
using ApiModel.RequestDTO.Exercise;
using ApiUnitOfWork.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Implementations.Exercise
{
    public class ExerciseLogic : IExerciseLogic
    {
        private readonly IUnitOfWork _unitOfWork;
        private IExceptionCustomizedLogic _logicExceptionCustomizedLogic;
        private string _option;

        public ExerciseLogic(IUnitOfWork unitOfWork, IExceptionCustomizedLogic logicExceptionCustomizedLogic)
        {
            _unitOfWork = unitOfWork;
            _logicExceptionCustomizedLogic = logicExceptionCustomizedLogic;
            _option = "Exercise";
        }

        public int Insert(ExerciseRequestDTO dto)
        {
            ApiModel.Exercise.Exercise obj = new ApiModel.Exercise.Exercise();
            try
            {
                return _unitOfWork.IExercise.Insert(obj.Mapper(obj, dto));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public bool Update(ExerciseRequestDTO dto)
        {
            ApiModel.Exercise.Exercise obj = new ApiModel.Exercise.Exercise();
            try 
            { 
                return _unitOfWork.IExercise.Update(obj.Mapper(obj, dto));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
}

        public ApiModel.Exercise.Exercise GetById(int id)
        {
            try 
            { 
                return _unitOfWork.IExercise.GetById(Convert.ToInt64(id));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public IEnumerable<ApiModel.Exercise.Exercise> GetList()
        {
            try
            {
                return _unitOfWork.IExercise.GetList();
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }
    }
}
