using ApiLogic.Interfaces.Exercise;
using ApiLogic.Interfaces.JWT;
using ApiLogic.Interfaces.Marker;
using ApiLogic.Interfaces.Profile;
using ApiModel.RequestDTO;
using ApiModel.RequestDTO.Exercise;
using ApiModel.RequestDTO.Marker;
using ApiModel.RequestDTO.Profile;
using ApiModel.ResponseDTO.General;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Controllers.JWT
{
    [ApiController]
    [Route("[controller]")]
    public class UsersController : Controller
    {
        private readonly IUserLogic _logic;
        private ResponseDTO _ResponseDTO;

        public UsersController(IUserLogic logic)
        {
            _logic = logic;
        }


        [HttpPost]
        public IActionResult Insert([FromBody] UsersRequestDTO dto)
        {
            _ResponseDTO = new ResponseDTO();
            try
            {
                return Ok(_ResponseDTO.Success(_ResponseDTO, _logic.Insert(dto)));
            }
            catch (Exception e)
            {
                return BadRequest(_ResponseDTO.Failed(_ResponseDTO, e));
            }
        }

        [HttpPut]
        public IActionResult Update([FromBody] UsersRequestDTO dto)
        {
            _ResponseDTO = new ResponseDTO();
            try
            {
                return Ok(_ResponseDTO.Success(_ResponseDTO, _logic.Update(dto)));
            }
            catch (Exception e)
            {
                return BadRequest(_ResponseDTO.Failed(_ResponseDTO, e));
            }
        }

        [HttpPut]
        [Route("recoverPassword")]
        public IActionResult RecoverPassword()
        {
            _ResponseDTO = new ResponseDTO();
            try
            {
                _logic.RecoverPassword();
                return Ok(_ResponseDTO.Success(_ResponseDTO, null));
            }
            catch (Exception e)
            {
                return BadRequest(_ResponseDTO.Failed(_ResponseDTO, e));
            }
        }


        [HttpGet]
        public IActionResult GetList()
        {
            _ResponseDTO = new ResponseDTO();
            try
            {
                return Ok(_ResponseDTO.Success(_ResponseDTO, _logic.GetList()));
            }
            catch (Exception e)
            {
                return BadRequest(_ResponseDTO.Failed(_ResponseDTO, e));
            }
        }

        [HttpGet]
        [Route("{id:int}")]
        public IActionResult GetById(int id)
        {
            _ResponseDTO = new ResponseDTO();
            try
            {
                return Ok(_ResponseDTO.Success(_ResponseDTO, _logic.GetById(id)));
            }
            catch (Exception e)
            {
                return BadRequest(_ResponseDTO.Failed(_ResponseDTO, e));
            }
        }
    }
}
