using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.General
{
    public class DictionaryErrors
    {

        public Dictionary<String, string> Users = new Dictionary<string, string>
        {
            {"uq_users_email", "registered-email"}
        };

        public Dictionary<String, string> Token = new Dictionary<string, string>
        {
            { "unAuthorized", "incorrect-user-password" }
        };

    }
}
