using System;
using System.Collections.Generic;
using System.Text;

namespace VetClinic.Interfaces
{
    interface IService
    {
        IList<IEntity> GetData();
        int AddData(IEntity entity);
        void DeleteData(IEntity entity);
        void UpdateData(IEntity entity);
    }
}
