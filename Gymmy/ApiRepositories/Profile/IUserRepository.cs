using ApiModel.Profile;
using ApiModel.RequestDTO;
using ApiRepositories.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiRepositories.Profile
{
    public interface IUserRepository: IRepository<Users>
    {
        /// <summary>
        /// Interface ValidateUser
        /// </summary>
        /// <remarks>
        /// the implementation interface is on DataAccess 
        /// </remarks>
        Users ValidateUser(LoginRequestDTO dto);
        public int UpdateProfile(Users obj);
    }
}
