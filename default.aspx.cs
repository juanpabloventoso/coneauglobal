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
        sgwNucleo.Usuarios.VerificarUsuarioAutenticado();
        if ((!sgwNucleo.Usuarios.UsuarioGrupo("Docentes universitarios")) && (!sgwNucleo.Usuarios.UsuarioGrupo("Colaboradores de docentes universitarios")))
        {
            sgwNucleo.Usuarios.DenegarAcceso("No tiene permiso para acceder esta sección ya que no es un docente o colaborador universitario. Verifique que haya ingresado en la sección correcta." +
                "<br /><br />" +
                "Le recomendamos <a href=\"/coneauglobal/mainframe/login/cerrar-sesion.aspx\">cerrar la sesión y volver a iniciarla</a>." +
                "<br /><br />" +
                "Ante cualquier duda, comuníquese con nuestra mesa de ayuda " +
                "de 9 a 17 horas al 4819-9050 int. 1020 o por correo a global@coneau.gob.ar para recibir asistencia.");
            return;
        }
        if (!Page.IsPostBack)
        {
            pnlDocentes.Visible = sgwNucleo.Usuarios.UsuarioGrupo("Docentes universitarios");
            pnlColaboradores.Visible = sgwNucleo.Usuarios.UsuarioGrupo("Colaboradores de docentes universitarios");
        }
    }
}
