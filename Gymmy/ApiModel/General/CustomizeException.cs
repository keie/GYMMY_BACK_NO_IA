using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.General
{
    public class CustomizeException : Exception
    {
        public CustomizeException(string message) : base(message)
        {

        }
    }
}
