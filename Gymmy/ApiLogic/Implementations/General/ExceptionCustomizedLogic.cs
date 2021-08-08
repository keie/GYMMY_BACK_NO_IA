using ApiLogic.Interfaces.General;
using ApiModel.General;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Implementations.General
{
    public class ExceptionCustomizedLogic : IExceptionCustomizedLogic
    {
        private DictionaryErrors _dictionaryErrors = new DictionaryErrors();
        string _default = "error";


        public ExceptionCustomizedLogic()
        {
        }


        public Exception Decision(string option, Exception e)
        {
            if (!(e is CustomizeException))
            {
                switch (option)
                {
                    case "Users":
                        return UsersError(e.Message);
                    case "Token":
                        return Token(e.Message);
                    default:
                        return Default();
                }
            }
            else
            {
                throw e;
            }
        }

        public Exception UsersError(string e)
        {

            foreach (KeyValuePair<string, string> error in _dictionaryErrors.Users)
            {
                if (e.Contains(error.Key))
                {
                    throw new CustomizeException(error.Value);
                }
            }
            throw new CustomizeException(_default);
        }
       
        public Exception Token(string e)
        {

            foreach (KeyValuePair<string, string> error in _dictionaryErrors.Token)
            {
                if (e.Contains(error.Key))
                {
                    throw new CustomizeException(error.Value);
                }
            }
            throw new CustomizeException(_default);
        }

        public Exception Default()
        {
            throw new CustomizeException(_default);
        }
    }
}
