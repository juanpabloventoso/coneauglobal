using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Net;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using sgwMulticapa.Gestor;
using sgwMulticapa.Objetos.CONEAU.Instructivos;
using sgwMulticapa.Objetos.CONEAU.Docentes;
using System.Globalization;
using System.IO;
using System.Xml;

public partial class form_inicio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        sgwNucleo.Usuarios.VerificarUsuarioAutenticado();
        if (!Page.IsPostBack)
        {
            DataSet FData = FGestor.LeerSQL("SELECT SEXO FROM SIS_MAINFRAME.USUARIOS WHERE ID_USUARIOS = " + Session["UsuarioID"]);
            if (FData.Tables[0].Rows[0].ItemArray[0].ToString() == "F") lblBienvenido.Text = "Bienvenida, " + Session["UsuarioDescripcion"].ToString();
            else
                if (FData.Tables[0].Rows[0].ItemArray[0].ToString() == "M") lblBienvenido.Text = "Bienvenido, " + Session["UsuarioDescripcion"].ToString();
                else
                    lblBienvenido.Text = "Bienvenida/o, " + Session["UsuarioDescripcion"].ToString();
        }
        actualizarVinculaciones();
    }

    protected void btnAbrirFicha_Click(object sender, EventArgs e)
    {
        Session["CVAR"] = "N";
        Session["CVAR_URL"] = "";
        Session["CUIT"] = grdCurriculums.GetRowValues(grdCurriculums.FocusedRowIndex, "CUIT").ToString();
        Session["ID_DOCENTES"] = grdCurriculums.GetRowValues(grdCurriculums.FocusedRowIndex, "ID_DOCENTES").ToString();
        Session["DocenteNombre"] = (grdCurriculums.GetRowValues(grdCurriculums.FocusedRowIndex, "APELLIDO").ToString() + " " + 
            grdCurriculums.GetRowValues(grdCurriculums.FocusedRowIndex, "PRIMER_NOMBRE").ToString() + " " +
            grdCurriculums.GetRowValues(grdCurriculums.FocusedRowIndex, "SEGUNDO_NOMBRE").ToString()).Replace("  ", " ").Trim();
        Response.Redirect("coneau/abm-p1.aspx");
    }

    protected void actualizarVinculaciones()
    {
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        string FCondicion = "CVAR = 'N' AND ID_USUARIOS_COLABORADOR = " + Session["UsuarioID"].ToString();
        grdCurriculums.DataSource = FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_DOCENTES WHERE " + FCondicion);
        grdCurriculums.DataBind();
    }

}
