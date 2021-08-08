using ApiLogic.Interfaces.General;
using ApiLogic.Interfaces.Routine;
using ApiModel.RequestDTO.Routine;
using ApiUnitOfWork.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Implementations.Routine
{
    public class RoutineLogic : IRoutineLogic
    {
        private readonly IUnitOfWork _unitOfWork;
        private IExceptionCustomizedLogic _logicExceptionCustomizedLogic;
        private string _option;

        public RoutineLogic(IUnitOfWork unitOfWork, IExceptionCustomizedLogic logicExceptionCustomizedLogic)
        {
            _unitOfWork = unitOfWork;
            _logicExceptionCustomizedLogic = logicExceptionCustomizedLogic;
            _option = "Routine";
        }

        public int Insert(RoutineRequestDTO dto)
        {
            ApiModel.Routine.Routine obj = new ApiModel.Routine.Routine();
            try
            { 
                return _unitOfWork.IRoutine.Insert(obj.Mapper(obj, dto));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public bool Update(RoutineRequestDTO dto)
        {
            ApiModel.Routine.Routine obj = new ApiModel.Routine.Routine();
            try
            {
                return _unitOfWork.IRoutine.Update(obj.Mapper(obj, dto));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public ApiModel.Routine.Routine GetById(int id)
        {
            try
            {
                return _unitOfWork.IRoutine.GetById(Convert.ToInt64(id));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public IEnumerable<ApiModel.Routine.Routine> GetList()
        {
            try
            {
                return _unitOfWork.IRoutine.GetList();
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }
    }
}
