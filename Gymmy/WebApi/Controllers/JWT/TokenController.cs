using ApiLogic.Interfaces.JWT;
using ApiModel.RequestDTO;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Controllers.JWT
{
    [ApiController]
    [Route("[controller]")]
    public class TokenController : Controller
    {
        private readonly ITokenLogic _logic;

        public TokenController(ITokenLogic logic)
        {
            _logic = logic;
        }
        /// <summary>
        /// Login with JSON web token for session and access to the system
        /// </summary>
        /// <remarks>
        ///userLogin.username;userLogin.password
        /// </remarks>
        [HttpPost]
        public IActionResult ProcessToken([FromBody] LoginRequestDTO userLogin)
        {
            try
            {
                return Ok(_logic.ProcessToken(userLogin));
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }
    }
}
