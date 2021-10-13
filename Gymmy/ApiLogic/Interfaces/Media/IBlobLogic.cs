using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ApiLogic.Interfaces.Media
{
    public interface IBlobLogic
    {
        public Task UploadFileBlobAsync(string filePath, string fileName);
    }
}
