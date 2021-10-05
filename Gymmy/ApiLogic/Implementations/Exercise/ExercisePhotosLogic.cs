using ApiLogic.Interfaces.Exercise;
using ApiLogic.Interfaces.General;
using ApiModel.Exercise;
using ApiModel.RequestDTO.Exercise;
using ApiModel.ResponseDTO.Exercise;
using ApiUnitOfWork.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Implementations.Exercise
{
    public class ExercisePhotosLogic : IExercisePhotosLogic
    {
        private readonly IUnitOfWork _unitOfWork;
        private IExceptionCustomizedLogic _logicExceptionCustomizedLogic;
        private string _option;

        public ExercisePhotosLogic(IUnitOfWork unitOfWork, IExceptionCustomizedLogic logicExceptionCustomizedLogic)
        {
            _unitOfWork = unitOfWork;
            _logicExceptionCustomizedLogic = logicExceptionCustomizedLogic;
            _option = "ExercisePhotos";
        }

        public int Insert(ExercisePhotosRequestDTO dto)
        {
            ExercisePhotos obj = new ExercisePhotos();
            try
            {
                return _unitOfWork.IExercisePhotos.Insert(obj.Mapper(obj, dto));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public bool Update(ExercisePhotosRequestDTO dto)
        {
            ExercisePhotos obj = new ExercisePhotos();
            try
            {
                return _unitOfWork.IExercisePhotos.Update(obj.Mapper(obj, dto));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public ExercisePhotos GetById(int id)
        {
            try
            {
                return _unitOfWork.IExercisePhotos.GetById(Convert.ToInt64(id));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public IEnumerable<ExercisePhotosResponseDTO> GetByIdExercise(int idExercise)
        {
            try
            {
                return _unitOfWork.IExercisePhotos.GetExercisePhotos(idExercise);
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public IEnumerable<ExercisePhotos> GetList()
        {
            try
            {
                return _unitOfWork.IExercisePhotos.GetList();
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }
    }
}
