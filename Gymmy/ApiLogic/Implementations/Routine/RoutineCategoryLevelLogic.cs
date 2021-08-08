using ApiLogic.Interfaces.General;
using ApiLogic.Interfaces.Routine;
using ApiModel.RequestDTO.Routine;
using ApiModel.Routine;
using ApiUnitOfWork.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Implementations.Routine
{
    public class RoutineCategoryLevelLogic : IRoutineCategoryLevelLogic
    {
        private readonly IUnitOfWork _unitOfWork;
        private IExceptionCustomizedLogic _logicExceptionCustomizedLogic;
        private string _option;

        public RoutineCategoryLevelLogic(IUnitOfWork unitOfWork, IExceptionCustomizedLogic logicExceptionCustomizedLogic)
        {
            _unitOfWork = unitOfWork;
            _logicExceptionCustomizedLogic = logicExceptionCustomizedLogic;
            _option = "RoutineCategoryLevel";
        }

        public int Insert(RoutineCategoryLevelRequestDTO dto)
        {
            RoutineCategoryLevel obj = new RoutineCategoryLevel();
            try
            {
                return _unitOfWork.IRoutineCategoryLevel.Insert(obj.Mapper(obj, dto));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public bool Update(RoutineCategoryLevelRequestDTO dto)
        {
            RoutineCategoryLevel obj = new RoutineCategoryLevel();
            try
            {
                return _unitOfWork.IRoutineCategoryLevel.Update(obj.Mapper(obj, dto));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public RoutineCategoryLevel GetById(int id)
        {
            try
            {
                return _unitOfWork.IRoutineCategoryLevel.GetById(Convert.ToInt64(id));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public IEnumerable<RoutineCategoryLevel> GetList()
        {
            try
            {
                return _unitOfWork.IRoutineCategoryLevel.GetList();
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }
    }
}
