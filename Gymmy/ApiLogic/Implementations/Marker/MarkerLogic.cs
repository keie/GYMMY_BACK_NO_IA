using ApiLogic.Interfaces.Marker;
using ApiUnitOfWork.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Implementations.Marker
{
    public class MarkerLogic : IMarkerLogic
    {
        private readonly IUnitOfWork _unitOfWork;

        public MarkerLogic(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
    }
}
