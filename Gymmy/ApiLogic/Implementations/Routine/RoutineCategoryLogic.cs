using ApiLogic.Interfaces.General;
using ApiLogic.Interfaces.Routine;
using ApiModel.RequestDTO.Routine;
using ApiModel.ResponseDTO.Routine;
using ApiModel.Routine;
using ApiUnitOfWork.General;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace ApiLogic.Implementations.Routine
{
    public class RoutineCategoryLogic : IRoutineCategoryLogic
    {
        private readonly IUnitOfWork _unitOfWork;
        private IExceptionCustomizedLogic _logicExceptionCustomizedLogic;
        private string _option;


        public RoutineCategoryLogic(IUnitOfWork unitOfWork, IExceptionCustomizedLogic logicExceptionCustomizedLogic)
        {
            _unitOfWork = unitOfWork;
            _logicExceptionCustomizedLogic = logicExceptionCustomizedLogic;
            _option = "RoutineCategory";
        }


        public int Insert(RoutineCategoryRequestDTO dto)
        {
            RoutineCategory obj = new RoutineCategory();
            try
            {
                return _unitOfWork.IRoutineCategory.Insert(obj.Mapper(obj, dto));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public bool Update(RoutineCategoryRequestDTO dto)
        {
            RoutineCategory obj = new RoutineCategory();
            try
            { 
                return _unitOfWork.IRoutineCategory.Update(obj.Mapper(obj, dto));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public RoutineCategory GetById(int id)
        {
            try
            {
                return _unitOfWork.IRoutineCategory.GetById(Convert.ToInt64(id));
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public IEnumerable<RoutineCategory> GetList()
        {
            try
            {
                return _unitOfWork.IRoutineCategory.GetList();
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public RoutineCategoryWithListRoutinesResponseDTO GetRoutineByEquipment(int idEquipment)
        {
            RoutineCategoryWithListRoutinesResponseDTO dto = new RoutineCategoryWithListRoutinesResponseDTO();
            try
            {
                var list = _unitOfWork.IRoutineCategory.GetRoutineByEquipment(idEquipment);
                foreach (var x in list)
                {
                    List<RoutineCategory> routines = new List<RoutineCategory>();
                    dto.Equipment = x.Equipment;
                    foreach (var y in list)
                    {
                        if (x.Equipment.Id == y.Equipment.Id)
                        {
                            routines.Add(y.RoutineCategory);
                        }
                    }
                    dto.Routines = routines;
                }
                return dto;
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public IList<RoutineWithLevelsResponseDTO> GetRoutineByEquipmentAndRoutineCategory(int idEquipment, int IdRoutindCategory)
        {
            try
            {
                IList<RoutineWithLevelsResponseDTO> routineLevelsDTO = new List<RoutineWithLevelsResponseDTO>();
                var list = _unitOfWork.IRoutineCategory.GetRoutineByEquipmentAndRoutineCategory(idEquipment, IdRoutindCategory);
                var test = list.GroupBy(x => x.IdExcercise).Distinct();
                foreach (var x in test)
                {
                    RoutineWithLevelsResponseDTO dto = new RoutineWithLevelsResponseDTO();
                    IList<LevelResponseDTO> levelListDTO = new List<LevelResponseDTO>();
                    foreach (var y in x)
                    {
                        dto.Mapper(dto, y);
                        LevelResponseDTO levelDTO = new LevelResponseDTO();
                        levelDTO.Mapper(levelDTO, y);
                        levelListDTO.Add(levelDTO);
                    }
                    dto.Levels = levelListDTO;
                    routineLevelsDTO.Add(dto);
                }
                return routineLevelsDTO;
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }
    }
}
