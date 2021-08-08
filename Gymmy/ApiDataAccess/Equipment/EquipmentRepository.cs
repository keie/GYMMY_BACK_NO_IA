using ApiDataAccess.General;
using ApiRepositories.Equipment;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiDataAccess.Equipment
{
    public class EquipmentRepository : Repository<ApiModel.Equipment.Equipment>, IEquipmentRepository
    {
        public EquipmentRepository(string connectionString) : base(connectionString)
        {

        }
    }
}
