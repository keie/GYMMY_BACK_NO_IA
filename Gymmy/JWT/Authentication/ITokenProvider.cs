

namespace JWT.Authentication
{
    using ApiModel;
    using ApiModel.Profile;
    using Microsoft.IdentityModel.Tokens;
    using System;
    public interface ITokenProvider
    {
        string CreateToken(Users user, DateTime expiry);
        TokenValidationParameters GetValidationParameters();
    }
}
