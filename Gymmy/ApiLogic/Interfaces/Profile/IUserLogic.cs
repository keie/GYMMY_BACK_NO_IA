using ApiModel.Profile;
using ApiModel.RequestDTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Interfaces.Profile
{
    public interface IUserLogic
    {
        public Users ValidateUser(LoginRequestDTO dto);
    }
}
