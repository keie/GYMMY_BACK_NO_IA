using ApiLogic.Interfaces.Exercise;
using ApiModel.RequestDTO.Exercise;
using ApiModel.ResponseDTO.General;
using Microsoft.AspNetCore.Mvc;
using System;

namespace WebApi.Controllers.Exercise
{
    [ApiController]
    [Route("[controller]")]
    public class ExerciseController : Controller
    {
        private readonly IExerciseLogic _logic;
        private ResponseDTO _ResponseDTO;

        public ExerciseController(IExerciseLogic logic)
        {
            _logic = logic;
        }


        /// <summary>
        /// Login with JSON web token for session and access to the system
        /// </summary>
        [HttpPost]
        public IActionResult Insert([FromBody] ExerciseRequestDTO dto)
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
        public IActionResult Update([FromBody] ExerciseRequestDTO dto)
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
