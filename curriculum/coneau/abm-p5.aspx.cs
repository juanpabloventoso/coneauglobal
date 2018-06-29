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
using sgwMulticapa.Gestor;
using sgwMulticapa.Objetos;
using sgwMulticapa.Objetos.CONEAU.Docentes;

    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            sgwNucleo.Usuarios.VerificarUsuarioAutenticado();
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            DataSet datos;
            if (!Page.IsPostBack)
            {
                // listadesplegable tipos título posgrado
                datos = FGestor.LeerSQL("SELECT ID_INSTITUCIONES, INSTITUCION FROM SIS_UNIVERSIDADES.Q_INSTITUCIONES WHERE ID_ESTADOS_INSTITUCIONES = 1");
                Funciones.CompletarListaDesplegable(cmbGestionAcademicaInstitucion, datos, true, false);
                datos = FGestor.LeerSQL("SELECT ID_TIPOS_DURACIONES_DED, TIPO_DURACION_DED FROM SIS_DOCENTES.Q_TIPOS_DURACIONES_DED");
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbGestionAcademicaSemanasAnual, datos, false, false);
            }
            actualizarDatos();
           
        }

        // Botones ABM Gestion Academica
        protected void btnAgregarGestionAcademica_Click(object sender, EventArgs e)
        {
            Session["OperacionDetalle"] = "A";
            cmbGestionAcademicaInstitucion.SelectedIndex = 0;
            edtGestionAcademicaCargoFuncion.Text = "";
            cmbGestionAcademicaSemanasAnual.SelectedIndex = 0;
            edtGestionAcademicaHsRelojSemanales.Text = "0";
            edtGestionAcademicaFechaInicio.Text = "";
            edtGestionAcademicaFechaFinalizacion.Text = "";
            cmbGestionAcademicaInstitucion_SelectedIndexChanged(null, null);
            popGestionAcademica.ShowOnPageLoad = true;
        }

        protected void btnModificarGestionAcademica_Click(object sender, EventArgs e)
        {
            if (grdGestionAcademicaABM.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoGestion FCargoGestion = new CargoGestion();
            FGestor.ObtenerObjeto(FCargoGestion, grdGestionAcademicaABM);
            Session["OperacionDetalle"] = "M";
            edtGestionAcademicaCargoFuncion.Text = FCargoGestion.CARGO;
            cmbGestionAcademicaSemanasAnual.SelectedValue = FCargoGestion.ID_TIPOS_DURACIONES_DED.ToString();
            edtGestionAcademicaHsRelojSemanales.Text = FCargoGestion.DEDICACION_SEMANAL.ToString();
            edtGestionAcademicaFechaInicio.Text = FCargoGestion.LeerFecha("FECHA_INICIO");
            edtGestionAcademicaFechaFinalizacion.Text = FCargoGestion.LeerFecha("FECHA_FINALIZACION"); ;
            if (FCargoGestion.INSTITUCION_UNIV)
            {
                cmbGestionAcademicaInstitucion.SelectedValue = FCargoGestion.ID_INSTITUCIONES.ToString();
                edtGestionAcademicaOtraInstitucion.Text = "";
            }
            else
            {
                cmbGestionAcademicaInstitucion.SelectedValue = "-1";
                edtGestionAcademicaOtraInstitucion.Text = FCargoGestion.OTRA_INSTITUCION;
            }
            cmbGestionAcademicaInstitucion_SelectedIndexChanged(sender, e);
            popGestionAcademica.ShowOnPageLoad = true;
        }

        protected void btnEliminarGestionAcademica_Click(object sender, EventArgs e)
        {
            if (grdGestionAcademicaABM.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoGestion FCargoGestion = new CargoGestion();
            FGestor.ObtenerObjeto(FCargoGestion, grdGestionAcademicaABM);
            FGestor.EliminarObjeto(FCargoGestion);
            actualizarDatos();
        }

        // Botones Popup Gestion Academica
        protected void btnAceptarGestionAcademica_Click(object sender, EventArgs e)
        {
             // Requeridos
            string FEstado = "";
            if ((pnlGestionAcademicaOtraInstitucion.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtGestionAcademicaOtraInstitucion.Text)))
                FEstado = "la institución";
            else
                if (!sgwNucleo.Funciones.VerificarRequerido(edtGestionAcademicaCargoFuncion.Text))
                    FEstado = "el cargo";
                else
                    if (!sgwNucleo.Funciones.VerificarRequeridoInt(edtGestionAcademicaHsRelojSemanales.Text))
                        FEstado = "la dedicación semanal en horas reloj";
                    else
                        if (!sgwNucleo.Funciones.VerificarRequerido(edtGestionAcademicaFechaInicio.Text))
                            FEstado = "la fecha de inicio";
            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoGestion FCargoGestion = new CargoGestion();
            if (Session["OperacionDetalle"].ToString() == "M")
                FGestor.ObtenerObjeto(FCargoGestion, int.Parse(grdGestionAcademicaABM.GetRowValues(grdGestionAcademicaABM.FocusedRowIndex, "ID_CARGOS_GESTION").ToString()));
            else
                FCargoGestion.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
            FCargoGestion.ID_INSTITUCIONES = int.Parse(cmbGestionAcademicaInstitucion.SelectedValue.ToString());
            FCargoGestion.GuardarFecha("FECHA_INICIO", edtGestionAcademicaFechaInicio.Text);
            FCargoGestion.GuardarFecha("FECHA_FINALIZACION", edtGestionAcademicaFechaFinalizacion.Text);
            FCargoGestion.CARGO = edtGestionAcademicaCargoFuncion.Text;
            FCargoGestion.ID_TIPOS_DURACIONES_DED = int.Parse(cmbGestionAcademicaSemanasAnual.SelectedValue);
            FCargoGestion.DEDICACION_SEMANAL = int.Parse(edtGestionAcademicaHsRelojSemanales.Text);
            if (cmbGestionAcademicaInstitucion.SelectedValue == "-1")
            {
                FCargoGestion.INSTITUCION_UNIV = false;
                FCargoGestion.ID_INSTITUCIONES = 0;
                FCargoGestion.OTRA_INSTITUCION = edtGestionAcademicaOtraInstitucion.Text;
            }
            else
            {
                FCargoGestion.INSTITUCION_UNIV = true;
                FCargoGestion.ID_INSTITUCIONES = int.Parse(cmbGestionAcademicaInstitucion.SelectedValue);
                FCargoGestion.OTRA_INSTITUCION = "";
            }
            FGestor.GuardarObjeto(FCargoGestion);
            actualizarDatos();
            sgwNucleo.Pagina.CerrarPopup(popGestionAcademica);
        }
       
        protected void btnCancelarGestionAcademica_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popGestionAcademica);
        }

        // Botones General
        protected bool guardar()
        {
            return true;
        }

        protected void btnGuardarC_Click(object sender, EventArgs e)
        {
            if (guardar())
                Response.Redirect("abm-p6.aspx");
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
            string FCondicion = " ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
            if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
                FCondicion += " AND ((FECHA_ALTA - 1) <= '" + Session["FECHA_PRESENTADA"].ToString() + "' OR FECHA_ALTA IS NULL)";
            DataSet datos = FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_CARGOS_GESTION WHERE " + FCondicion);
            grdGestionAcademicaABM.DataSource = datos;
            grdGestionAcademicaABM.DataBind();
        }

        protected void cmbGestionAcademicaInstitucion_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlGestionAcademicaOtraInstitucion.Visible = cmbGestionAcademicaInstitucion.SelectedValue == "-1";
        }

}
