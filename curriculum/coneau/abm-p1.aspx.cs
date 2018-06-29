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
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            if (!Page.IsPostBack)
            {
                // Listado de Países
                DataSet datos = FGestor.LeerSQL("SELECT ID_PAISES, PAIS FROM SIS_CONEAU.PAISES ORDER BY PAIS");
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbDocentePais, datos, false, false);
                datos = FGestor.LeerSQL("SELECT ID_TIPOS_DOCUMENTO, TIPO_DOCUMENTO FROM SIS_CONEAU.TIPOS_DOCUMENTO");
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbTipoDocumento, datos, false, false);
                cmbDocenteSexo.Items.Add(new ListItem("Masculino", "M"));
                cmbDocenteSexo.Items.Add(new ListItem("Femenino", "F"));
                cmbDocenteSexo.Items.Add(new ListItem("Otro", "O"));
                actualizarDatos();
            }
        }

        protected void cmbDocentePais_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlCUIT1.Visible = cmbDocentePais.SelectedValue == "13";
            pnlDepartamento.Visible = pnlCUIT1.Visible;
            if (!pnlCUIT1.Visible)
                lblProvincia.Text = "* Estado:";
            else
                lblProvincia.Text = "* Provincia:";
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            DataSet datos = FGestor.LeerSQL("SELECT ID_ESTADOS, ESTADO FROM SIS_CONEAU.ESTADOS WHERE ID_PAISES = " + cmbDocentePais.SelectedValue);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbDocenteProvincia, datos, false);
            cmbDocenteProvincia_SelectedIndexChanged(sender, e);
        }

        protected void cmbDocenteProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!pnlCUIT1.Visible) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            DataSet datos = FGestor.LeerSQL("SELECT ID_DEPARTAMENTOS, DEPARTAMENTO FROM SIS_CONEAU.DEPARTAMENTOS WHERE ID_ESTADOS = " + cmbDocenteProvincia.SelectedValue);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbDepartamento, datos, false);
        }

        #region DatosGenerales

        // Botones General
        protected bool guardar()
        {
            string FEstado = "";
            if (!sgwNucleo.Funciones.VerificarRequerido(edtDocenteApellido.Text))
                FEstado = "el apellido";
            else
                if (!sgwNucleo.Funciones.VerificarRequerido(edtDocenteNombre1.Text))
                    FEstado = "el primer nombre";
                else
                    if (!sgwNucleo.Funciones.VerificarRequerido(edtDocenteFechaNacimiento.Text))
                        FEstado = "la fecha de nacimiento";
                    else
                        if (!sgwNucleo.Funciones.VerificarRequerido(edtDocenteDocumento.Text))
                            FEstado = "el número de documento";
                        else
                            if ((pnlCUIT1.Visible) && ((!sgwNucleo.Funciones.VerificarRequerido(edtDocenteCuit.Text))))
                                FEstado = "el número de CUIT/CUIL";
                            else
                                if (!sgwNucleo.Funciones.VerificarRequerido(edtDocenteCalle.Text))
                                    FEstado = "la calle";
                                else
                                    if (!sgwNucleo.Funciones.VerificarRequerido(edtDocenteNumero.Text))
                                        FEstado = "el número";
                                    else
                                        if (!sgwNucleo.Funciones.VerificarRequerido(edtDocenteCodigoPostal.Text))
                                            FEstado = "el código postal";
                                        else
                                            if (!sgwNucleo.Funciones.VerificarRequerido(edtDocenteLocalidad.Text))
                                                FEstado = "la localidad";
                                            else
                                                if (!sgwNucleo.Funciones.VerificarRequerido(edtDocenteTelefono.Text))
                                                    FEstado = "el teléfono";
                                                    else
                                                    if (cmbDocentePais.SelectedValue == "13")
                                                    {
                                                        if ((cmbDepartamento.SelectedIndex < 0) || (int.Parse(cmbDepartamento.SelectedValue) < 0))
                                                            FEstado = "el departamento/partido";
                                                    }

            if ((pnlCUIT1.Visible) && (!sgwNucleo.Funciones.VerificarCUIT(edtDocenteCuit.Text)))
            {
                sgwNucleo.Pagina.MostrarEstado("El CUIT ingresado no es válido.", 1);
                return false;
            }
            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return false;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            string FCondicion;
            if (Session["ID_DOCENTES"] != null)
                FCondicion = "ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
            else
                FCondicion = "ID_USUARIOS = " + Session["UsuarioID"].ToString();
            Docente FDocente = (Docente)FGestor.ObtenerObjeto(typeof(Docente), FCondicion);
            if (FDocente == null)
            {
                FDocente = new Docente();
                FDocente.ID_USUARIOS = int.Parse(Session["UsuarioID"].ToString());
            }
            FDocente.APELLIDO = edtDocenteApellido.Text.Trim();
            FDocente.PRIMER_NOMBRE = edtDocenteNombre1.Text.Trim();
            FDocente.SEGUNDO_NOMBRE = edtDocenteNombre2.Text.Trim();
            FDocente.SEXO = cmbDocenteSexo.SelectedValue;
            FDocente.GuardarFecha("FECHA_NACIMIENTO", edtDocenteFechaNacimiento.Text);
            FDocente.ID_TIPOS_DOCUMENTO = int.Parse(cmbTipoDocumento.SelectedValue);
            FDocente.NUMERO_DOCUMENTO = edtDocenteDocumento.Text;
            FDocente.CUIT = edtDocenteCuit.Text;
            FDocente.CALLE = edtDocenteCalle.Text;
            FDocente.NUMERO = edtDocenteNumero.Text;
            FDocente.PISO = edtDocentePiso.Text;
            FDocente.DEPARTAMENTO = edtDocenteDepartamento.Text;
            FDocente.LOCALIDAD = edtDocenteLocalidad.Text;
            FDocente.CODIGO_POSTAL = edtDocenteCodigoPostal.Text;
            FDocente.ID_PAISES = int.Parse(cmbDocentePais.SelectedValue);
            Session["ID_PAISES"] = cmbDocentePais.SelectedValue;
            FGestor.EscribirSQL("UPDATE SIS_MAINFRAME.USUARIOS SET SEXO = '" + FDocente.SEXO + 
                "' WHERE ID_USUARIOS = " + Session["UsuarioID"].ToString());
            if (cmbDocentePais.SelectedValue == "13")
            {
                FDocente.ID_ESTADOS = int.Parse(cmbDocenteProvincia.SelectedValue);
                FDocente.ID_DEPARTAMENTOS = int.Parse(cmbDepartamento.SelectedValue);
            }
            FDocente.TELEFONO = edtDocenteTelefono.Text;
            return FGestor.GuardarObjeto(FDocente);
        }

        protected void btnGuardarC_Click(object sender, EventArgs e)
        {
            if (guardar())
                Response.Redirect("abm-p2.aspx");
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
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            string FCondicion;
            if ((sgwNucleo.Pagina.SoloLectura()) || (Session["ID_DOCENTES"] != null))
                FCondicion = "ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
            else
                FCondicion = "ID_USUARIOS = " + Session["UsuarioID"].ToString();
            Docente FDocente = (Docente)FGestor.ObtenerObjeto(typeof(Docente), FCondicion);

            //if (Session["CVAR"].ToString() == "S")
            //{
            //    System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "datosPersonales/identificacion");
            //    edtDocenteApellido.Text = CVAR.DocumentElement.SelectSingleNode("apellido").InnerText;
            //    edtDocenteNombre1.Text = CVAR.DocumentElement.SelectSingleNode("nombre").InnerText;
            //    edtDocenteNombre1.Width = 250;
            //    edtDocenteNombre2.Visible = false;
            //    if (CVAR.DocumentElement.SelectSingleNode("sexo").InnerText == "MASCULINO")
            //        cmbDocenteSexo.SelectedIndex = 0;
            //    else cmbDocenteSexo.SelectedIndex = 1;
            //    if (CVAR.DocumentElement.SelectSingleNode("tipoDocumento").InnerText == "DNI")
            //        cmbTipoDocumento.SelectedIndex = 0;
            //    else cmbTipoDocumento.SelectedIndex = 1;
            //    edtDocenteDocumento.Text = CVAR.DocumentElement.SelectSingleNode("numeroDocumento").InnerText;
            //    edtDocenteCuit.Text = Session["CUIT"].ToString();
            //    edtDocenteFechaNacimiento.Text = sgwFunciones.CONEAU.Docentes.cvarLeerFecha(CVAR.DocumentElement.SelectSingleNode("fechaNacimiento").InnerText);
            //    Usuario FUsuario = (Usuario)FGestor.ObtenerObjeto(typeof(Usuario), "ID_USUARIOS = " + FDocente.ID_USUARIOS.ToString());
            //    edtDocenteCorreoElectronico.Text = FUsuario.CORREO_ELECTRONICO;
            //    return;
            //}

            if (FDocente == null)
            {
                Usuario FUsuario = (Usuario)FGestor.ObtenerObjeto(typeof(Usuario), FCondicion);
                edtDocenteApellido.Text = FUsuario.APELLIDO;
                edtDocenteNombre1.Text = FUsuario.PRIMER_NOMBRE;
                edtDocenteNombre2.Text = FUsuario.SEGUNDO_NOMBRE;
                cmbDocenteSexo.SelectedValue = FUsuario.SEXO;
                edtDocenteFechaNacimiento.Text = "";
                cmbTipoDocumento.SelectedIndex = 0;
                edtDocenteDocumento.Text = "";
                edtDocenteCuit.Text = "";
                edtDocenteCorreoElectronico.Text = FUsuario.CORREO_ELECTRONICO;
                cmbDocentePais.SelectedValue = "13";
                cmbDocentePais_SelectedIndexChanged(null, null);
                edtDocenteCorreoElectronico.Text = FUsuario.CORREO_ELECTRONICO;
                Session["ID_PAISES"] = "13";
                Session.Remove("ID_DOCENTES");
            }
            else
            {
                Usuario FUsuario = (Usuario)FGestor.ObtenerObjeto(typeof(Usuario), "ID_USUARIOS = " + FDocente.ID_USUARIOS.ToString());
                edtDocenteApellido.Text = FDocente.APELLIDO;
                edtDocenteNombre1.Text = FDocente.PRIMER_NOMBRE;
                edtDocenteNombre2.Text = FDocente.SEGUNDO_NOMBRE;
                cmbDocenteSexo.SelectedValue = FDocente.SEXO;
                edtDocenteFechaNacimiento.Text = FDocente.LeerFecha("FECHA_NACIMIENTO");
                cmbTipoDocumento.SelectedValue = FDocente.ID_TIPOS_DOCUMENTO.ToString();
                edtDocenteDocumento.Text = FDocente.NUMERO_DOCUMENTO;
                edtDocenteCuit.Text = FDocente.CUIT;
                edtDocenteCalle.Text = FDocente.CALLE;
                edtDocenteNumero.Text = FDocente.NUMERO;
                edtDocentePiso.Text = FDocente.PISO;
                edtDocenteDepartamento.Text = FDocente.DEPARTAMENTO;
                edtDocenteLocalidad.Text = FDocente.LOCALIDAD;
                edtDocenteCodigoPostal.Text = FDocente.CODIGO_POSTAL;
                cmbDocentePais.SelectedValue = FDocente.ID_PAISES.ToString();
                Session["ID_PAISES"] = FDocente.ID_PAISES.ToString();
                Session["ID_DOCENTES"] = FDocente.ID.ToString();
                cmbDocentePais_SelectedIndexChanged(null, null);
                if (cmbDocentePais.SelectedValue == "13")
                {
                    cmbDocenteProvincia.SelectedValue = FDocente.ID_ESTADOS.ToString();
                    cmbDocenteProvincia_SelectedIndexChanged(null, null);
                    cmbDepartamento.SelectedValue = FDocente.ID_DEPARTAMENTOS.ToString();
                }
                edtDocenteTelefono.Text = FDocente.TELEFONO;
                edtDocenteCorreoElectronico.Text = FUsuario.CORREO_ELECTRONICO;
            }
        }
        
        #endregion
    }
