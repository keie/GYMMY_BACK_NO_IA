using ApiLogic.Interfaces.Equipment;
using ApiUnitOfWork.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Implementations.Equipment
{
    public class EquipmentLogic : IEquipmentLogic
    {
        private readonly IUnitOfWork _unitOfWork;

        public EquipmentLogic(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

    }
}
