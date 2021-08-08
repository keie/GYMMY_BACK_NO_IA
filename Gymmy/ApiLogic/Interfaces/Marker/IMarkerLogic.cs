using ApiModel.RequestDTO.Marker;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Interfaces.Marker
{
    public interface IMarkerLogic
    {
        public int Insert(MarkerRequestDTO dto);
        public bool Update(MarkerRequestDTO dto);
        public ApiModel.Marker.Marker GetById(int id);
        public IEnumerable<ApiModel.Marker.Marker> GetList();
    }
}
