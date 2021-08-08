using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Interfaces.General
{
    public interface IExceptionCustomizedLogic
    {
        public Exception Decision(string option, Exception e);
    }
}
