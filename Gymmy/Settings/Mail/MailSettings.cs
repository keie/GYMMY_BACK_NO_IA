using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Implementations.Mail
{
    public class MailSettings
    {
        public int Port { get; set; }
        public string MailFrom { get; set; }
        public string Pass { get; set; }
        public string Smtp { get; set; }
        public string To { get; set; }
        public bool EnableSsl { get; set; }
        public bool UseDefaultCredentials { get; set; }
    }
}
