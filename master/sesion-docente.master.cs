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
using DevExpress.Web.ASPxGridView.Export;
using DevExpress.Web.ASPxPivotGrid;


public partial class mpCentral : System.Web.UI.MasterPage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        if (!sgwNucleo.Usuarios.EsDocente() && (!sgwNucleo.Pagina.SoloLectura()))
        {
            if (sgwNucleo.Funciones.EjecucionDesdeIDE())
                Response.Redirect("~/iniciar-sesion/");
            else
                Response.Redirect("/coneauglobal/iniciar-sesion/");
        }
    }

}