using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using sgwMulticapa.Objetos.CONEAU.Docentes;

    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            sgwNucleo.Usuarios.VerificarUsuarioAutenticado();
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            if (!Page.IsPostBack)
                actualizarDatos();
        }

        // Botones General
        protected bool guardar()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Docente FDocente = new Docente();
            FGestor.ObtenerObjeto(FDocente, int.Parse(Session["ID_DOCENTES"].ToString()));
            FDocente.OTRA_INFORMACION = edtDocentesOtraInformacion.Text;
            return FGestor.GuardarObjeto(FDocente); 
        }

        protected void btnGuardarC_Click(object sender, EventArgs e)
        {
            if (guardar())
                Response.Redirect("inicio.aspx");
        }

        protected void btnGuardarDatosGenerales_Click(object sender, EventArgs e)
        {
            if (guardar())
                sgwNucleo.Pagina.MostrarEstado("Se han guardado los cambios.", 2);
        }

        protected void btnCancelarDatosGenerales_Click(object sender, EventArgs e)
        {
            Response.Redirect("inicio.aspx");
        }

        protected void actualizarDatos()
        {
            if (sgwNucleo.Usuarios.EsDocente())
            {
                edtDocentesOtraInformacion.ReadOnly = false;
                btnGuardarDatosGenerales.Visible = true;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Docente FDocente = new Docente();
            FGestor.ObtenerObjeto(FDocente, int.Parse(Session["ID_DOCENTES"].ToString()));
            edtDocentesOtraInformacion.Text = FDocente.OTRA_INFORMACION;
        }

    }
