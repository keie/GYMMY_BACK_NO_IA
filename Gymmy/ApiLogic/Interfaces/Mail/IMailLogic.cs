using ApiModel.RequestDTO.Mail;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiLogic.Interfaces.Mail
{
    public interface IMailLogic
    {
        public void SendRecoveryAccount(MailRequestDTO dto);
    }
}
