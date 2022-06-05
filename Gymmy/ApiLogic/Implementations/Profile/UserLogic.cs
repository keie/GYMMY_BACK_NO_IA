using ApiLogic.Interfaces.General;
using ApiLogic.Interfaces.Mail;
using ApiLogic.Interfaces.Media;
using ApiLogic.Interfaces.Profile;
using ApiModel.Profile;
using ApiModel.RequestDTO;
using ApiModel.RequestDTO.Mail;
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
        private IMediaLogic _mediaLogic;
        private IMailLogic _mailLogic;
        private string _option;

        public UserLogic(IUnitOfWork unitOfWork, IExceptionCustomizedLogic logicExceptionCustomizedLogic, IMediaLogic mediaLogic, IMailLogic mailLogic)
        {
            _unitOfWork = unitOfWork;
            _mediaLogic = mediaLogic;
            _mailLogic = mailLogic;
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

        public Users Update(UsersRequestDTO dto)
        {
            Users obj = new Users();
            try
            {
                if(!String.IsNullOrEmpty(dto.PhotoBase64))
                {
                    dto.Photo = _mediaLogic.UploadImage(dto.PhotoBase64);
                }
                _unitOfWork.IUser.UpdateProfile(obj.Mapper(obj, dto));
                return obj;
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public bool RecoverPassword(int idUser)
        {
            bool result = false;
            try
            {
                var user = _unitOfWork.IUser.GetById(idUser);
                var newPassword = user.Password.Substring(0, 6);
                user.Password = EncryptPass(newPassword);
                result = _unitOfWork.IUser.Update(user);

                if (user !=null)
                {
                    _mailLogic.SendRecoveryAccount(new MailRequestDTO
                    {
                        To = user.Email,
                        Body = newPassword
                    });

                }
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }

            return result;
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
