using ApiLogic.Interfaces.Routine;
using ApiUnitOfWork.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Implementations.Routine
{
    public class RoutineLogic : IRoutineLogic
    {
        private readonly IUnitOfWork _unitOfWork;

        public RoutineLogic(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
    }
}
