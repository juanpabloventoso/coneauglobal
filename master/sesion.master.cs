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


public partial class mpSesion : System.Web.UI.MasterPage
{

    // Información del sistema actual
    public int sistemaID = 0;
    public string sistemaNombre = "";
    public string sistemaSubnombre = "";
    public string sistemaDesc = "";
    public string sistemaCodename = "";

    // Información del favorito
    public bool esFavorito = true;
    public string idFavorito = "";


    protected void Page_Init(object sender, EventArgs e)
    {
        // Redireccionar al login si no se inició sesión
        if (!sgwNucleo.Usuarios.UsuarioAutenticado())
        {
            if (sgwNucleo.Funciones.EjecucionDesdeIDE())
                Response.Redirect("~/iniciar-sesion/?ir=" + ((mpBase)Master).urlActual);
            else
                Response.Redirect("/coneauglobal/iniciar-sesion/?ir=" + ((mpBase)Master).urlActual);
            return;
        }

        // Obtener los datos del favorito
        sgwMulticapa.Gestor.Gestor FGestor = new sgwMulticapa.Gestor.Gestor();
        DataSet FData = FGestor.LeerSQL("SELECT ID_USUARIOS_ESCRITORIOS FROM SIS_MAINFRAME.USUARIOS_ESCRITORIOS WHERE ID_USUARIOS = " + 
            Session["UsuarioID"].ToString() + " AND LOWER(URL) LIKE '%" + ((mpBase)Master).urlActual + "%'");
        esFavorito = FData.Tables[0].Rows.Count == 1;
        if (esFavorito) idFavorito = FData.Tables[0].Rows[0].ItemArray[0].ToString();

        // Obtener los datos del sistema actual
        FData = FGestor.LeerSQL("SELECT * FROM SIS_MAINFRAME.SISTEMAS WHERE '" + ((mpBase)Master).urlActual.Replace("/coneauglobal/", "") + 
            "' LIKE '%' || RUTA_RELATIVA || '%'");
        if (FData.Tables[0].Rows.Count > 0)
        {
            sistemaID = int.Parse(FData.Tables[0].Rows[0]["ID_SISTEMAS"].ToString());
            sistemaNombre = FData.Tables[0].Rows[0]["SISTEMA"].ToString();
            sistemaSubnombre = FData.Tables[0].Rows[0]["SUBSISTEMA"].ToString();
            sistemaDesc = FData.Tables[0].Rows[0]["DESCRIPCION"].ToString();
            sistemaCodename = FData.Tables[0].Rows[0]["CODENAME"].ToString();
        }
    }

    public void ocultarMenu()
    {
        ScriptManager.RegisterStartupScript((System.Web.UI.Page)System.Web.HttpContext.Current.Handler, typeof(Page), "pagina",
         "<script  language='javascript' type='text/javascript'>$('.div-menu-holder').hide();</script>", false);
    }

}