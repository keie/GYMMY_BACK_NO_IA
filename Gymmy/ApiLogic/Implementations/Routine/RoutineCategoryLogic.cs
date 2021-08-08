using ApiLogic.Interfaces.Routine;
using ApiUnitOfWork.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Implementations.Routine
{
    public class RoutineCategoryLogic : IRoutineCategoryLogic
    {
        private readonly IUnitOfWork _unitOfWork;

        public RoutineCategoryLogic(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
    }
}
