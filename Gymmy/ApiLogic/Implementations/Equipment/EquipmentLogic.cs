using ApiLogic.Interfaces.Equipment;
using ApiLogic.Interfaces.General;
using ApiModel.RequestDTO.Equipment;
using ApiUnitOfWork.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Implementations.Equipment
{
    public class EquipmentLogic : IEquipmentLogic
    {
        private readonly IUnitOfWork _unitOfWork;
        private IExceptionCustomizedLogic _logicExceptionCustomizedLogic;
        private string _option;


        public EquipmentLogic(IUnitOfWork unitOfWork, IExceptionCustomizedLogic logicExceptionCustomizedLogic)
        {
            _unitOfWork = unitOfWork;
            _logicExceptionCustomizedLogic = logicExceptionCustomizedLogic;
            _option = "Equipment";
        }

        public int Insert(EquipmentRequestDTO dto)
        {
            ApiModel.Equipment.Equipment obj = new ApiModel.Equipment.Equipment();
            try
            { 
                return _unitOfWork.IEquipment.Insert(obj.Mapper(obj, dto));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public bool Update(EquipmentRequestDTO dto)
        {
            ApiModel.Equipment.Equipment obj = new ApiModel.Equipment.Equipment();
            try 
            { 
                return _unitOfWork.IEquipment.Update(obj.Mapper(obj, dto));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public ApiModel.Equipment.Equipment GetById(int id)
        {
            try
            { 
                return _unitOfWork.IEquipment.GetById(Convert.ToInt64(id));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public IEnumerable<ApiModel.Equipment.Equipment> GetList()
        {
            try 
            { 
                return _unitOfWork.IEquipment.GetList();
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }
    }
}
