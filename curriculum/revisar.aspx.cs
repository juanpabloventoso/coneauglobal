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

public partial class form_inicio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Request["id"] == null) || (Request["tipo"] == null) || (Request["usuario"] == null) || (Request["token"] == null))
        {
            Response.Redirect("default.aspx");
            return;
        }

        sgwMulticapa.Gestor.Gestor FGestor = new sgwMulticapa.Gestor.Gestor();
        DataSet FData = FGestor.LeerSQL("SELECT ID_USUARIOS, NOMBRE_FORMAL, CAMBIAR_PASSWORD, USUARIO, CORREO_ELECTRONICO FROM SIS_MAINFRAME.Q_USUARIOS_DOCENTES WHERE " +
            "ACTIVO = 'S' AND HABILITADO = 'S' AND USUARIO = '" + Request.Params["usuario"].ToString() + "'");

        // Verificar que el usuario exista
        if ((FData == null) || (FData.Tables[0].Rows.Count != 1))
        {
            sgwNucleo.Pagina.MostrarEstado("Error en el pedido de autenticación. Si el problema persiste, contáctese con el soporte técnico.", 1);
            return;
        }

        // Verificar que el hash del token sea válido
        string FHash = sgwNucleo.Usuarios.MD5Hash((int.Parse(FData.Tables[0].Rows[0].ItemArray[0].ToString()) * 20).ToString());
        if (FHash.ToLower() != Request.Params["token"].ToString().ToLower())
        {
            sgwNucleo.Pagina.MostrarEstado("Error en el token de autenticación. Si el problema persiste, contáctese con el soporte técnico.", 1);
            return;
        }

        Session["UsuarioID"] = FData.Tables[0].Rows[0].ItemArray[0].ToString();
        Session["UsuarioDescripcion"] = FData.Tables[0].Rows[0].ItemArray[1].ToString();
        Session["UsuarioCorreo"] = FData.Tables[0].Rows[0].ItemArray[4].ToString();
        Session["Usuario"] = FData.Tables[0].Rows[0].ItemArray[3].ToString();
        sgwNucleo.Usuarios.IniciarSesion();
        Response.Redirect("revisar-vinculacion.aspx?id=" + Request["id"].ToString() + "&tipo=" + Request["tipo"].ToString());
    }
}
