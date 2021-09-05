using ApiModel.EquipmentModel;
using ApiModel.RequestDTO.Equipment;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Interfaces.EquipmentLogic
{
    public interface IEquipmentLogic
    {
        public int Insert(EquipmentRequestDTO dto);
        public bool Update(EquipmentRequestDTO dto);
        public Equipment GetById(int id);
        public IEnumerable<Equipment> GetList();
    }
}
