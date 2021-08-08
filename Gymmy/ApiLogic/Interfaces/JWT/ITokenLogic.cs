using ApiModel.RequestDTO;
using JWT.Authentication;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Interfaces.JWT
{
    public interface ITokenLogic
    {
        JsonWebToken ProcessToken(LoginRequestDTO dto);
    }
}
