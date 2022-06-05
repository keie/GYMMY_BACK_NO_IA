using ApiLogic.Interfaces.General;
using ApiLogic.Interfaces.Mail;
using ApiModel.RequestDTO.Mail;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Reflection;
using System.Resources;
using System.Text;
using System.Threading.Tasks;

namespace ApiLogic.Implementations.Mail
{
    public class MailLogic: IMailLogic
    {

        private IExceptionCustomizedLogic _logicExceptionCustomizedLogic;
        private readonly string _option;
        private readonly IOptions<MailSettings> _mailSettings;

        public MailLogic(IExceptionCustomizedLogic logicExceptionCustomizedLogic, IOptions<MailSettings> mailSettings)
        {
            _logicExceptionCustomizedLogic = logicExceptionCustomizedLogic;
            _mailSettings = mailSettings;
            _option = "Mail";
        }

        public async Task SendEmail(MailRequestDTO dto)
        {
            try
            {
                string body = BuildTemplateEmail(dto);
                MailMessage mailMessage = new MailMessage(_mailSettings.Value.MailFrom, dto.To, dto.Subject, body);
                mailMessage.IsBodyHtml = true;
                SmtpClient smtpClient = new SmtpClient(_mailSettings.Value.Smtp);
                smtpClient.EnableSsl = true;
                smtpClient.UseDefaultCredentials = true;
                smtpClient.Port = _mailSettings.Value.Port;
                mailMessage.BodyEncoding = UTF8Encoding.UTF8;
                NetworkCredential credential = new NetworkCredential(_mailSettings.Value.MailFrom, _mailSettings.Value.Pass);
                smtpClient.Credentials = credential;
                smtpClient.Send(mailMessage);
                smtpClient.Dispose();
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }


        public async void SendRecoveryAccount(MailRequestDTO dto)
        {
            try
            {
                dto.MapperAccountRecoveryChangePassword(dto);
                await SendEmail(dto);
            }
            catch (Exception e)
            {
                throw _logicExceptionCustomizedLogic.Decision(_option, e);
            }
        }

        public string BuildTemplateEmail(MailRequestDTO dto)
        {
            var mailRuta = "D:/Email/EmailTemplate.html";
            string html = File.ReadAllText(mailRuta);

            var str = html
                .Replace("{head}", dto.Head)
                .Replace("{title}", dto.Title)
                .Replace("{body}", dto.Body)
                .Replace("{footer}", dto.Foot);
            return str;
        }
    }
}
