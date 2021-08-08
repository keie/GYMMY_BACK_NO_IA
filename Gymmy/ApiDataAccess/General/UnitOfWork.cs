using ApiDataAccess.Profile;
using ApiRepositories.Profile;
using ApiUnitOfWork.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiDataAccess.General
{
    public class UnitOfWork: IUnitOfWork {
        public IUserRepository IUser { get; }
        public UnitOfWork(string connectionString)
        {
            IUser = new UserRepository(connectionString);
        }

        
    }
}
