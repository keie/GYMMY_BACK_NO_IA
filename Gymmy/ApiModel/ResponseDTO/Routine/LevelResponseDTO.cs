using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.ResponseDTO.Routine
{
    public class LevelResponseDTO
    {
        public int IdRoutineCategoryLevel { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int Repetitions { get; set; }
        public string Photo { get; set; }
        public string Model3D { get; set; }
        public string Marker { get; set; }

        public LevelResponseDTO Mapper(LevelResponseDTO dto, RoutineResponseDTO obj)
        {
            dto.IdRoutineCategoryLevel = obj.IdRoutineCategoryLevel;
            dto.Name = obj.Name;
            dto.Description = obj.Description;
            dto.Repetitions = obj.Repetitions;
            dto.Photo = obj.Photo;
            dto.Model3D = obj.Model3D;
            dto.Marker = obj.Marker;
            return dto;
        }
    }
}
