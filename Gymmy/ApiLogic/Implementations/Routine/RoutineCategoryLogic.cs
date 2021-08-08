using ApiLogic.Interfaces.General;
using ApiLogic.Interfaces.Routine;
using ApiModel.RequestDTO.Routine;
using ApiModel.ResponseDTO.Routine;
using ApiModel.Routine;
using ApiUnitOfWork.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Implementations.Routine
{
    public class RoutineCategoryLogic : IRoutineCategoryLogic
    {
        private readonly IUnitOfWork _unitOfWork;
        private IExceptionCustomizedLogic _logicExceptionCustomizedLogic;
        private string _option;


        public RoutineCategoryLogic(IUnitOfWork unitOfWork, IExceptionCustomizedLogic logicExceptionCustomizedLogic)
        {
            _unitOfWork = unitOfWork;
            _logicExceptionCustomizedLogic = logicExceptionCustomizedLogic;
            _option = "RoutineCategory";
        }


        public int Insert(RoutineCategoryRequestDTO dto)
        {
            RoutineCategory obj = new RoutineCategory();
            try
            {
                return _unitOfWork.IRoutineCategory.Insert(obj.Mapper(obj, dto));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public bool Update(RoutineCategoryRequestDTO dto)
        {
            RoutineCategory obj = new RoutineCategory();
            try
            { 
                return _unitOfWork.IRoutineCategory.Update(obj.Mapper(obj, dto));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public RoutineCategory GetById(int id)
        {
            try
            {
                return _unitOfWork.IRoutineCategory.GetById(Convert.ToInt64(id));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public IEnumerable<RoutineCategory> GetList()
        {
            try
            {
                return _unitOfWork.IRoutineCategory.GetList();
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public IEnumerable<RoutineCategoryResponseDTO> GetRoutineByEquipment(int idEquipment)
        {
            try
            {
                return _unitOfWork.IRoutineCategory.GetRoutineByEquipment(idEquipment);
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public IEnumerable<RoutineResponseDTO> GetRoutineByEquipmentAndRoutineCategory(int idEquipment, int IdRoutindCategory)
        {
            try
            {
                return _unitOfWork.IRoutineCategory.GetRoutineByEquipmentAndRoutineCategory(idEquipment, IdRoutindCategory);
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }
    }
}
