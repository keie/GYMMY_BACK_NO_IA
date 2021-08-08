using ApiLogic.Interfaces.General;
using ApiLogic.Interfaces.Marker;
using ApiModel.RequestDTO.Marker;
using ApiUnitOfWork.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Implementations.Marker
{
    public class MarkerLogic : IMarkerLogic
    {
        private readonly IUnitOfWork _unitOfWork;
        private IExceptionCustomizedLogic _logicExceptionCustomizedLogic;
        private string _option;

        public MarkerLogic(IUnitOfWork unitOfWork, IExceptionCustomizedLogic logicExceptionCustomizedLogic)
        {
            _unitOfWork = unitOfWork;
            _logicExceptionCustomizedLogic = logicExceptionCustomizedLogic;
            _option = "Marker";
        }

        public int Insert(MarkerRequestDTO dto)
        {
            ApiModel.Marker.Marker obj = new ApiModel.Marker.Marker();
            
            try
            {
                return _unitOfWork.IMarker.Insert(obj.Mapper(obj, dto));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public bool Update(MarkerRequestDTO dto)
        {
            ApiModel.Marker.Marker obj = new ApiModel.Marker.Marker();
            try
            {
                return _unitOfWork.IMarker.Update(obj.Mapper(obj, dto));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public ApiModel.Marker.Marker GetById(int id)
        {
            try
            {
                return _unitOfWork.IMarker.GetById(Convert.ToInt64(id));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public IEnumerable<ApiModel.Marker.Marker> GetList()
        {
            try
            {
                return _unitOfWork.IMarker.GetList();
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }
    }
}
