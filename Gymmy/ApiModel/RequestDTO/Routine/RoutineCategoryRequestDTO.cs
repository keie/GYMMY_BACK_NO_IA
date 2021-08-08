using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.RequestDTO.Routine
{
    public class RoutineCategoryRequestDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Photo { get; set; }
    }
}
