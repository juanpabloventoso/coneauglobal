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
using sgwMulticapa.Objetos.CONEAU.MainFrame;

    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            sgwNucleo.Usuarios.VerificarUsuarioAutenticado();
            if (!Page.IsPostBack)
                actualizarDatos();
        }

        #region DatosGenerales

        static string UppercaseWords(string value)
        {
            char[] array = value.ToCharArray();
            // Handle the first letter in the string.
            if (array.Length >= 1)
            {
                if (char.IsLower(array[0]))
                {
                    array[0] = char.ToUpper(array[0]);
                }
            }
            // Scan through the letters, checking for spaces.
            // ... Uppercase the lowercase letters following spaces.
            for (int i = 1; i < array.Length; i++)
            {
                if (array[i - 1] == ' ')
                {
                    if (char.IsLower(array[i]))
                    {
                        array[i] = char.ToUpper(array[i]);
                    }
                }
            }
            return new string(array);
        }

        protected void actualizarDatos()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            pnlAnda.Visible = true;
            pnlNoAnda.Visible = false;

            if (Session["CVAR"].ToString() == "S")
            {

                System.Xml.XmlDocument CVAR = null;
                try
                {
                    // Información general
                    CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "datosPersonales/identificacion");
                }
                catch 
                {
                    pnlAnda.Visible = false;
                    pnlNoAnda.Visible = true;
                    return;
                }
                edtDocenteApellido.Text = UppercaseWords(sgwFunciones.CONEAU.Docentes.cvarLeer(CVAR, "apellido").ToLower());
                edtDocenteNombre1.Text = UppercaseWords(sgwFunciones.CONEAU.Docentes.cvarLeer(CVAR, "nombre").ToLower());
                txtDocenteSexo.Text = UppercaseWords(sgwFunciones.CONEAU.Docentes.cvarLeer(CVAR, "sexo").ToLower());
                edtDocenteDocumento.Text = sgwFunciones.CONEAU.Docentes.cvarLeer(CVAR, "numeroDocumento");
                edtDocenteCuit.Text = Session["CUIT"].ToString();
                edtDocenteFechaNacimiento.Text = sgwFunciones.CONEAU.Docentes.cvarLeerFecha(CVAR, "fechaNacimiento");

                // Domicilio
                CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "datosPersonales/direccionResidencial");
                edtDocenteCalle.Text = sgwFunciones.CONEAU.Docentes.cvarLeer(CVAR, "calle");
                edtDocenteNumero.Text = sgwFunciones.CONEAU.Docentes.cvarLeer(CVAR, "numero");
                edtDocentePiso.Text = sgwFunciones.CONEAU.Docentes.cvarLeer(CVAR, "piso");
                edtDocenteDepartamento.Text = sgwFunciones.CONEAU.Docentes.cvarLeer(CVAR, "dpto");
                edtDocentePais.Text = sgwFunciones.CONEAU.Docentes.cvarLeer(CVAR, "pais/pais");
                edtDocenteProvincia.Text = sgwFunciones.CONEAU.Docentes.cvarLeer(CVAR, "provincia/provincia");
                edtDocentePartido.Text = sgwFunciones.CONEAU.Docentes.cvarLeer(CVAR, "partido/partido");
                edtDocenteLocalidad.Text = sgwFunciones.CONEAU.Docentes.cvarLeer(CVAR, "localidad/localidad");
                edtDocenteCodigoPostal.Text = sgwFunciones.CONEAU.Docentes.cvarLeer(CVAR, "codigoPostal");

                // Contacto
                edtDocenteTelefono.Text = sgwFunciones.CONEAU.Docentes.cvarLeer(CVAR, "telefono");
                edtDocenteCorreoElectronico.Text = sgwFunciones.CONEAU.Docentes.cvarLeer(CVAR, "email");

                return;




            }
        }
        
        #endregion
    }
