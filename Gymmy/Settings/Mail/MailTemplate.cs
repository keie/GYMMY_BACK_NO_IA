using ApiModel.RequestDTO.Mail;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.Mail
{
    public class MailTemplate
    {
        public string Head { get; set; }
        public string Title { get; set; }
        public string Footer { get; set; }
        public string Subject { get; set; }
        public string FilePath { get; set; }
        public bool Status { get; set; }

        public void Mapper(MailTemplate template, MailRequestDTO dto)
        {
            dto.Head = template.Head;
            dto.Title = template.Title;
            dto.Footer = template.Footer;
            dto.Subject = template.Subject;
            dto.FilePath = template.FilePath;
        }
    }
}
