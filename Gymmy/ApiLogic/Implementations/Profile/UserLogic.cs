using ApiLogic.Interfaces.General;
using ApiLogic.Interfaces.Profile;
using ApiModel.Profile;
using ApiModel.RequestDTO;
using ApiModel.RequestDTO.Profile;
using ApiUnitOfWork.General;
using Encryption;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Implementations.Profile
{
    public class UserLogic : IUserLogic
    {
        private readonly IUnitOfWork _unitOfWork;
        private Encrypt _encryptionService;
        private IExceptionCustomizedLogic _logicExceptionCustomizedLogic;
        private string _option;

        public UserLogic(IUnitOfWork unitOfWork, IExceptionCustomizedLogic logicExceptionCustomizedLogic)
        {
            _unitOfWork = unitOfWork;
            _logicExceptionCustomizedLogic = logicExceptionCustomizedLogic;
            _option = "Users";
        }

        public string EncryptPass(string password)
        {
            string passFormat = "SHA512";
            string saltKey = "";
            _encryptionService = new Encrypt();
            var passwordEncrypt = _encryptionService.CreatePasswordHash(password, saltKey, passFormat);
            return passwordEncrypt;
        }

        public Users ValidateUser(LoginRequestDTO dto)
        {
            try
            {
                return _unitOfWork.IUser.ValidateUser(dto);
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public int Insert(UsersRequestDTO dto)
        {
            Users obj = new Users();
            try
            {
                dto.Password = EncryptPass(dto.Password);
                return _unitOfWork.IUser.Insert(obj.Mapper(obj, dto));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public bool Update(UsersRequestDTO dto)
        {
            Users obj = new Users();
            try
            {
                return _unitOfWork.IUser.Update(obj.Mapper(obj, dto));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public Users GetById(int id)
        {
            try
            {
                return _unitOfWork.IUser.GetById(Convert.ToInt64(id));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public IEnumerable<Users> GetList()
        {
            try
            {
                return _unitOfWork.IUser.GetList();
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }
    }
}
