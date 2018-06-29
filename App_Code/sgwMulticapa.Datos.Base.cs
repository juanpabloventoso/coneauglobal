using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

/// <summary>
/// Descripción breve de ConectorDB
/// </summary>
/// 
namespace sgwMulticapa.Datos.Base
{
    public class DBHandler
    {
        public DBHandler()
        {
        }

        public virtual void Conectar(string AConnectionString)
        {
        }

        public virtual void Desconectar()
        {
        }

        public virtual DataSet ConsultarSQL(string ASQL)
        {
            return null;
        }

        public virtual void EjecutarSQL(string ASQL)
        {
        }

        public virtual int EjecutarSQLClave(string ASQL)
        {
            return 0;
        }

    }
}