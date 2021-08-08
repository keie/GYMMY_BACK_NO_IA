using ApiModel.RequestDTO.Equipment;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Interfaces.Equipment
{
    public interface IEquipmentLogic
    {
        public int Insert(EquipmentRequestDTO dto);
        public bool Update(EquipmentRequestDTO dto);
        public ApiModel.Equipment.Equipment GetById(int id);
        public IEnumerable<ApiModel.Equipment.Equipment> GetList();
    }
}
