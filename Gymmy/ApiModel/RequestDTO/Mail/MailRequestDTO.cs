using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.RequestDTO.Mail
{
    public class MailRequestDTO
    {
        public string Template { get; set; }
        public string Head { get; set; }
        public string Title { get; set; }
        public string Body { get; set; }
        public string Foot { get; set; }
        public string To { get; set; }
        public string Subject { get; set; }
        public string Footer { get; set; }
        public string FilePath { get; set; }

        public MailRequestDTO MapperAccountRecoveryChangePassword(MailRequestDTO dto)
        {
            dto.Head = "Recuperación de Clave";
            dto.Title = "Por favor copie el código siguiente";
            dto.Body = "El código de Recuperación es el siguiente:";
            dto.Foot = "Saludos Cordiales";
            dto.To = dto.To;
            dto.Subject = "[Soporte-Gymmy]";
            return dto;
        }
    }
}
