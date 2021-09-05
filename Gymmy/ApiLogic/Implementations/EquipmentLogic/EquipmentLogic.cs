using ApiLogic.Interfaces.EquipmentLogic;
using ApiLogic.Interfaces.General;
using ApiModel.EquipmentModel;
using ApiModel.RequestDTO.Equipment;
using ApiUnitOfWork.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Implementations.EquipmentLogic
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
            Equipment obj = new Equipment();
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
            Equipment obj = new Equipment();
            try 
            { 
                return _unitOfWork.IEquipment.Update(obj.Mapper(obj, dto));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public Equipment GetById(int id)
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

        public IEnumerable<Equipment> GetList()
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
