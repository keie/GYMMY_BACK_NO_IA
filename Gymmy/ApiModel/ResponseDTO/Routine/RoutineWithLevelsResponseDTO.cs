using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.ResponseDTO.Routine
{
   public class RoutineWithLevelsResponseDTO
    {
        public int Id { get; set; }
        public int IdExcercise { get; set; }
        public string RoutineDescription { get; set; }
        public string Audio { get; set; }
        public IList<LevelResponseDTO> Levels { get; set; }

        public RoutineWithLevelsResponseDTO Mapper(RoutineWithLevelsResponseDTO dto, RoutineResponseDTO obj)
        {
            dto.Id = obj.Id;
            dto.IdExcercise = obj.IdExcercise;
            dto.RoutineDescription = obj.RoutineDescription;
            dto.Audio = obj.Audio;
            return dto;
        }
    }
}
