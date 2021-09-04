using ApiModel.RequestDTO.Routine;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.Routine
{
    public class RoutineCategory
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string? Description { get; set; }
        public string Photo { get; set; }

        public RoutineCategory Mapper(RoutineCategory obj, RoutineCategoryRequestDTO dto)
        {
            obj.Id = dto.Id;
            obj.Name = dto.Name;
            obj.Description = dto.Description;
            obj.Photo = dto.Photo;

            return obj;
        }
    }
}
