

namespace ApiUnitOfWork.General
{
    using ApiRepositories.Profile;
    using System;
    using System.Collections.Generic;
    using System.Text;
    public interface IUnitOfWork
    {
        IUserRepository IUser { get; }
    }
}
