using ApiLogic.Interfaces.Routine;
using ApiModel.RequestDTO.Routine;
using ApiModel.ResponseDTO.General;
using Microsoft.AspNetCore.Mvc;
using System;

namespace WebApi.Controllers.Routine
{
    [ApiController]
    [Route("[controller]")]
    public class RoutineCategoryController : Controller
    {
        private readonly IRoutineCategoryLogic _logic;
        private ResponseDTO _ResponseDTO;

        public RoutineCategoryController(IRoutineCategoryLogic logic)
        {
            _logic = logic;
        }


        [HttpPost]
        public IActionResult Insert([FromBody] RoutineCategoryRequestDTO dto)
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
        public IActionResult Update([FromBody] RoutineCategoryRequestDTO dto)
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
