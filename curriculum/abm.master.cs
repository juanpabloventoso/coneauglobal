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

public partial class formABM : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["ID_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2"))
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            if (Session["ID_DOCENTES"] == null)
            {
                DataSet FDatos = FGestor.LeerSQL("SELECT ID_DOCENTES FROM SIS_DOCENTES.DOCENTES D WHERE D.ID_USUARIOS = " + Session["UsuarioID"].ToString());
                Session["ID_DOCENTES"] = FDatos.Tables[0].Rows[0].ItemArray[0].ToString();
            }
            if (Session["ID_DOCENTES"] != null)
            {
                DataSet FData = FGestor.LeerSQL("SELECT CVAR FROM SIS_DOCENTES.DOCENTES_ORIGENES_CV WHERE ID_DOCENTES_ORIGENES_CV IN (SELECT MAX(ID_DOCENTES_ORIGENES_CV) FROM " +
                "SIS_DOCENTES.DOCENTES_ORIGENES_CV WHERE ID_DOCENTES = " + Session["ID_DOCENTES"].ToString() + " AND FECHA < '" + Session["FECHA_PRESENTADA"].ToString() + "')");
                try
                {
                    Session["CVAR"] = FData.Tables[0].Rows[0].ItemArray[0].ToString();
                    if ((Session["CVAR"].ToString() == "S") && (!Request.Url.PathAndQuery.Contains("cvar")))
                        Response.Redirect(Request.Url.AbsoluteUri.Replace("abm", "cvar/abm"));
                    if ((Session["CVAR"].ToString() != "S") && (Request.Url.PathAndQuery.Contains("cvar")))
                        Response.Redirect(Request.Url.AbsoluteUri.Replace("cvar/abm", "abm"));
                }
                catch
                {
                }
            }
        }
        //if (sgwNucleo.Pagina.SoloLectura())
        //    sgwNucleo.Pagina.OcultarMenuSesion();
        lblAteneaTitulo.Text = Session["DocenteNombre"].ToString();
        if (Session["CVAR"].ToString() == "S") { lblAteneaTitulo.Text = lblAteneaTitulo.Text + " (Currículum CVar)"; }
    }

    protected void lnkPuntos_Click(object sender, EventArgs e)
    {
        int Indice = int.Parse(((Control)sender).ID.Substring(8));
        if (Indice > 1)
        {
            if ((!sgwNucleo.Pagina.SoloLectura()) && (!sgwNucleo.Usuarios.UsuarioGrupo("Colaboradores de docentes universitarios")))
            {
                sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
                DataSet FDatos = FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.DOCENTES D WHERE D.ID_USUARIOS = " + Session["UsuarioID"].ToString());
                if (FDatos.Tables[0].Rows.Count < 1)
                {
                    sgwNucleo.Pagina.MostrarEstado("Debe guardar los datos personales antes de continuar.", 1);
                    return;
                }
            }
        }
        string FRuta = "..";
        string FParams = "";
        if (sgwNucleo.Pagina.SoloLectura()) FParams = "?SoloLectura=1";
        if (Session["CVAR"].ToString() == "S")
            Response.Redirect(FRuta + "/cvar/abm-p" + Indice + ".aspx" + FParams);
        else
            Response.Redirect(FRuta + "/coneau/abm-p" + Indice + ".aspx" + FParams);
    }

}
