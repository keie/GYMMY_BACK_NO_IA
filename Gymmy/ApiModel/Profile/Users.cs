using ApiModel.RequestDTO.Profile;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace ApiModel.Profile
{
    public class Users
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Photo { get; set; }

        public Users Mapper(Users obj, UsersRequestDTO dto)
        {
            obj.Id = dto.Id;
            obj.Name = dto.Name;
            obj.Email = dto.Email;
            obj.Password = dto.Password;
            obj.Photo = dto.Photo;

            return obj;
        }
    }
}
