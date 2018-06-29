using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Diagnostics;

namespace sgwConstantes.CONEAU
{

    public static class Docentes
    {

        // Obtener la ruta de los currículums CVAR
        public static string RutaCVARBase()
        {
            return sgwNucleo.Rutas.RutaPrivada() + "\\Atenea\\Docentes\\CVAR\\";
        }

    }
}