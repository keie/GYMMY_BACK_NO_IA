using ApiDataAccess.General;
using ApiRepositories.Marker;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApiDataAccess.Marker
{
    public class MarkerRepository : Repository<ApiModel.Marker.Marker>, IMarkerRepository
    {
        public MarkerRepository(string connectionString) : base(connectionString)
        {

        }
    }
}
