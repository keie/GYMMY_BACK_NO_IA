using ApiModel.RequestDTO.Equipment;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.Equipment
{
    public class Equipment
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Photo { get; set; }

        public Equipment Mapper(Equipment obj, EquipmentRequestDTO dto)
        {
            obj.Id = dto.Id;
            obj.Name = dto.Name;
            obj.Description = dto.Description;
            obj.Photo = dto.Photo;
            return obj;
        }
    }
}
