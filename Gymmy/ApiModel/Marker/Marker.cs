using ApiModel.RequestDTO.Marker;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.Marker
{
    public class Marker
    {
        public int Id { get; set; }
        public string Photo { get; set; }

        public Marker Mapper(Marker obj, MarkerRequestDTO dto)
        {
            obj.Id = dto.Id;
            obj.Photo = dto.Photo;

            return obj;
        }
    }
}
