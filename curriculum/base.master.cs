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

public partial class mpFormBase : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            sgwNucleo.Usuarios.VerificarUsuarioAutenticado();
            if ((!sgwNucleo.Usuarios.UsuarioGrupo("Docentes universitarios")) && (!sgwNucleo.Usuarios.UsuarioGrupo("Colaboradores de docentes universitarios")))
            {
                sgwNucleo.Usuarios.DenegarAcceso("No puede ingresar a esta sección debido a que no tiene un perfil de docente universitario. Puede crear su cuenta de usuario como docente para continuar." +
                    "<br /><br />" +
                    "Ante cualquier duda, comuníquese con nuestra mesa de ayuda " +
                    "de 9 a 17 horas al 4819-9050 int. 1020 o por correo a global@coneau.gob.ar para recibir asistencia.");
                return;
            }
        }
}