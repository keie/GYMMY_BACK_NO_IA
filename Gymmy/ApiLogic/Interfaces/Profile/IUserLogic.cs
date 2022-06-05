using ApiModel.Profile;
using ApiModel.RequestDTO;
using ApiModel.RequestDTO.Profile;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Interfaces.Profile
{
    public interface IUserLogic
    {
        public Users ValidateUser(LoginRequestDTO dto);
        public int Insert(UsersRequestDTO dto);
        public Users Update(UsersRequestDTO dto);
        public Users GetById(int id);
        public IEnumerable<Users> GetList();
        public bool RecoverPassword(int idUser);
    }
}
