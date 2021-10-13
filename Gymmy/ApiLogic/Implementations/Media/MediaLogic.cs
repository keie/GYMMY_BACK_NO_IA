using ApiLogic.Interfaces.Media;
using ApiModel.Picture;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Text;

namespace ApiLogic.Implementations.Media
{
    public class MediaLogic: IMediaLogic
    {

        private IBlobLogic _blobLogic;
        public MediaLogic(IBlobLogic blobLogic)
        {
            _blobLogic = blobLogic;
        }
        public Bitmap ConvertImage(string _base64)
        {
            byte[] bytes = Convert.FromBase64String(_base64);
            var ms = new MemoryStream(bytes);
            Bitmap bitmap = new Bitmap(ms);
            return bitmap;
        }

        public Picture SavePicture(Bitmap image)
        {

            Picture picture = new Picture();
            string hash = (DateTime.Now).ToString("yyyyMMddHHmmssffff");
            picture.FilePath = @"C:\\gymmy\\" + hash + ".jpg";
            picture.FileName = $"{hash}.jpg";

            if (!Directory.Exists(picture.FilePath))
            {
                image.Save((picture.FilePath), ImageFormat.Jpeg);
            }
            else
            {
                Directory.Delete(picture.FilePath);
                image.Save((picture.FilePath), ImageFormat.Jpeg);
            }
            return picture;
        }

        public string UploadImage(string _base64)
        {
            var bitmap = ConvertImage(_base64);
            Picture picture = SavePicture(bitmap);
            _blobLogic.UploadFileBlobAsync(picture.FilePath, picture.FileName);

            return $"https://testingblobazure.blob.core.windows.net/images/{picture.FileName}";

        }
    }
}
