using ApiLogic.Interfaces.JWT;
using ApiModel.RequestDTO;
using ApiUnitOfWork.General;
using Encryption;
using JWT.Authentication;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Implementations.JWT
{
    public class TokenLogic : ITokenLogic
    {

        private readonly IUnitOfWork _unitOfWork;
        private ITokenProvider _tokenProvider;
        private Encrypt _encryptionService;
        public TokenLogic(ITokenProvider tokenProvider, IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
            _tokenProvider = tokenProvider;
        }
        public string EncryptPass(string password)
        {
            string passFormat = "SHA512";
            string saltKey = "";
            _encryptionService = new Encrypt();
            var passwordEncrypt = _encryptionService.CreatePasswordHash(password, saltKey, passFormat);
            return passwordEncrypt;
        }

        public JsonWebToken ProcessToken(LoginRequestDTO dto)
        {
            try
            {
                dto.password = EncryptPass(dto.password);
                var user = _unitOfWork.IUser.ValidateUser(dto);
                if (user == null)
                {
                    throw new UnauthorizedAccessException("unAuthorized");
                }

                var token = new JsonWebToken
                {
                    Access_Token = _tokenProvider.CreateToken(user, DateTime.UtcNow.AddHours(8)),
                    Expires_in = 480//minutes
                };
                return token;
               
            }
            catch(Exception e)
            {
                throw new Exception(e.Message);
            }
        }
    }
}
