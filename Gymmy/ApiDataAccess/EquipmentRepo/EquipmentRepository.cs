using ApiDataAccess.General;
using ApiRepositories.EquipmentRepo;
using System;
using System.Collections.Generic;
using System.Text;
using ApiModel;
using ApiModel.EquipmentModel;

namespace ApiDataAccess.EquipmentRepo
{
    public class EquipmentRepository : Repository<Equipment>, IEquipmentRepository
    {
        public EquipmentRepository(string connectionString) : base(connectionString)
        {

        }
    }
}
