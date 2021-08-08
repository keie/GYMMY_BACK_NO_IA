using ApiLogic.Interfaces.Profile;
using ApiModel.Profile;
using ApiModel.RequestDTO;
using ApiUnitOfWork.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Implementations.Profile
{
    public class UserLogic : IUserLogic
    {
        private readonly IUnitOfWork _unitOfWork;

        public UserLogic(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        
        public Users ValidateUser(LoginRequestDTO dto)
        {
            try
            {
                return _unitOfWork.IUser.ValidateUser(dto);
            }catch(Exception e)
            {
                throw new Exception(e.Message);
            }
        }
    }
}
