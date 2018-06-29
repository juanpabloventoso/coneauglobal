using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using sgwMulticapa.Datos.Base;
using sgwMulticapa.Datos.Oracle;


/// <summary>
/// Descripción breve de sgwMulticapa
/// </summary>
namespace sgwMulticapa.Datos
{
    public static class Funciones
    {
        public static DBHandler ObtenerConector(string AMotor)
        {

            string FMotor;
            DBHandler FConector;

            // Si no se especifica un motor, conectar al motor predeterminado
            // en el archivo web.config

            if (AMotor == "")
                FMotor = ConfigurationManager.AppSettings["MotorDB"];
            else
                FMotor = AMotor;
            FConector = new OracleDBHandler();
            return FConector;
        }

    }
}