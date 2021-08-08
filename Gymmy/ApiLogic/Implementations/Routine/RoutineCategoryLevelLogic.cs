using ApiLogic.Interfaces.Routine;
using ApiUnitOfWork.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Implementations.Routine
{
    public class RoutineCategoryLevelLogic : IRoutineCategoryLevelLogic
    {
        private readonly IUnitOfWork _unitOfWork;

        public RoutineCategoryLevelLogic(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
    }
}
