﻿using System;
using System.Collections.Generic;
using System.Text;

namespace ApiModel.RequestDTO.Profile
{
    public class UsersRequestDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Photo { get; set; }
        public string PhotoBase64 { get; set; }
    }
}
