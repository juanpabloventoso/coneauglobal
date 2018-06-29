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

            if (!Page.IsPostBack)
            {
           
                DataSet datos = FGestor.LeerSQL("SELECT ID_TIPOS_EVALUACIONES, TIPO_EVALUACION FROM SIS_DOCENTES.Q_TIPOS_EVALUACIONES");
                Funciones.CompletarListaDesplegable(cmbExperienciasEvaluacionTiposEvaluacion, datos, false, false);

                // listadesplegable instituciones
                datos = FGestor.LeerSQL("SELECT ID_INSTITUCIONES, INSTITUCION FROM SIS_UNIVERSIDADES.Q_INSTITUCIONES WHERE ID_ESTADOS_INSTITUCIONES = 1");
                Funciones.CompletarListaDesplegable(cmbInstitucion, datos, true);

               
            }

            actualizarDatosEvaluaciones();

           
        }

        
        
        
        #region Evaluaciones

        protected void btnAgregarEvaluaciones_Click(object sender, EventArgs e)
        {
            Session["OperacionDetalle"] = "A";
            cmbInstitucion.SelectedValue = "-2";
            edtExperienciasEvaluacionLugar.Text = "";
            edtExperienciasEvaluacionFecha.Text ="";
            cmbInstitucion_SelectedIndexChanged(null, null);
            cmbExperienciasEvaluacionTiposEvaluacion_SelectedIndexChanged(null, null);
            popEvaluaciones.ShowOnPageLoad = true;
        }

        protected void btnModificarEvaluaciones_Click(object sender, EventArgs e)
        {
            if (grdEvaluaciones.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Evaluacion FEvaluacion = new Evaluacion();
            FGestor.ObtenerObjeto(FEvaluacion, grdEvaluaciones);
            Session["OperacionDetalle"] = "M";


            edtExperienciasEvaluacionLugar.Text = FEvaluacion.LUGAR;
            edtExperienciasEvaluacionFecha.Text = FEvaluacion.LeerFecha("FECHA");

            edtExperienciasEvaluacionOtroTipoEvaluacion.Text = FEvaluacion.OTRO_TIPO_EVALUACION;
            cmbExperienciasEvaluacionTiposEvaluacion.SelectedValue = FEvaluacion.ID_TIPOS_EVALUACIONES.ToString();
            cmbExperienciasEvaluacionTiposEvaluacion_SelectedIndexChanged(null, null);
            if (FEvaluacion.INSTITUCION_UNIV)
            {
                cmbInstitucion.SelectedValue = FEvaluacion.ID_INSTITUCIONES.ToString();
                edtOtraInstitucion.Text = "";
            }
            else
            {
                cmbInstitucion.SelectedValue = "-1";
                edtOtraInstitucion.Text = FEvaluacion.OTRA_INSTITUCION;
            }
            cmbInstitucion_SelectedIndexChanged(null, null);
            popEvaluaciones.ShowOnPageLoad = true;
        }

        protected void btnEliminarEvaluaciones_Click(object sender, EventArgs e)
        {
            if (grdEvaluaciones.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Evaluacion FEvaluaciones = new Evaluacion();
            FGestor.ObtenerObjeto(FEvaluaciones, grdEvaluaciones);
            FGestor.EliminarObjeto(FEvaluaciones);
            actualizarDatosEvaluaciones();
        }

        protected void btnAceptarEvaluaciones_Click(object sender, EventArgs e)
        {

            // Requeridos
            string FEstado = "";

            if ((pnlOtraInstitucion.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtOtraInstitucion.Text)))
                FEstado = "la institución";
            else

            if (!sgwNucleo.Funciones.VerificarRequerido(edtExperienciasEvaluacionLugar.Text))
                FEstado = "el lugar";
            else
                if (!sgwNucleo.Funciones.VerificarRequerido(edtExperienciasEvaluacionFecha.Text))
                            FEstado = "la fecha";
                        else
                    if ((pnlExperienciasEvaluacionOtroTipoEvaluacion.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtExperienciasEvaluacionOtroTipoEvaluacion.Text)))
                                FEstado = "el tipo de evaluación";


            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Evaluacion FEvaluacion = new Evaluacion();
            if (Session["OperacionDetalle"].ToString() == "M")
            {

                FGestor.ObtenerObjeto(FEvaluacion, int.Parse(grdEvaluaciones.GetRowValues(grdEvaluaciones.FocusedRowIndex, "ID_EVALUACIONES").ToString()));
            }
            FEvaluacion.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
            FEvaluacion.GuardarFecha("FECHA", edtExperienciasEvaluacionFecha.Text);
            FEvaluacion.LUGAR = edtExperienciasEvaluacionLugar.Text;
            if (pnlExperienciasEvaluacionOtroTipoEvaluacion.Visible)
            {
                FEvaluacion.OTRO_TIPO_EVALUACION = edtExperienciasEvaluacionOtroTipoEvaluacion.Text;
                FEvaluacion.ID_TIPOS_EVALUACIONES = int.Parse(cmbExperienciasEvaluacionTiposEvaluacion.SelectedValue.ToString());

            }
            else
            { FEvaluacion.ID_TIPOS_EVALUACIONES = int.Parse(cmbExperienciasEvaluacionTiposEvaluacion.SelectedValue); }


            FEvaluacion.ID_INSTITUCIONES = int.Parse(cmbInstitucion.SelectedValue.ToString());
            if (cmbInstitucion.SelectedValue == "-1")
            {
                FEvaluacion.INSTITUCION_UNIV = false;
                FEvaluacion.ID_INSTITUCIONES = 0;
                FEvaluacion.OTRA_INSTITUCION = edtOtraInstitucion.Text;
            }
            else
            {
                FEvaluacion.INSTITUCION_UNIV = true;
                FEvaluacion.ID_INSTITUCIONES = int.Parse(cmbInstitucion.SelectedValue);
                FEvaluacion.OTRA_INSTITUCION = "";
            }




            FGestor.GuardarObjeto(FEvaluacion);
            actualizarDatosEvaluaciones();
            sgwNucleo.Pagina.CerrarPopup(popEvaluaciones);
        }

        protected void btnCancelarEvaluaciones_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popEvaluaciones);
        }

        protected void actualizarDatosEvaluaciones()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            string FCondicion = " ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
            if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
                FCondicion += " AND ((FECHA_ALTA - 1) <= '" + Session["FECHA_PRESENTADA"].ToString() + "' OR FECHA_ALTA IS NULL)";
            DataSet FDatos = FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_EVALUACIONES WHERE " + FCondicion);
            grdEvaluaciones.DataSource = FDatos;
            grdEvaluaciones.DataBind();
            actualizarExperiencia();

        }

        protected void actualizarExperiencia()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            DataSet FData;
            FData = FGestor.LeerSQL("SELECT COUNT (ID_TIPOS_EVALUACIONES) FROM SIS_DOCENTES.TIPOS_EVALUACIONES");
            int total = int.Parse(FData.Tables[0].Rows[0].ItemArray[0].ToString()) - 1;
            for (int I = 1; I <= total; I++)
            {

                string FCondicion = " ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
                if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
                    FCondicion += " AND ((FECHA_ALTA - 1) <= '" + Session["FECHA_PRESENTADA"].ToString() + "' OR FECHA_ALTA IS NULL)";
                FData = FGestor.LeerSQL("SELECT ID_TIPOS_EVALUACIONES FROM SIS_DOCENTES.Q_EVALUACIONES " +
                        "WHERE  ID_TIPOS_EVALUACIONES = " + I + " AND " + FCondicion);

                switch (I)
                {
                    case 1: chkJuradoConcurso.Checked = FData.Tables[0].Rows.Count > 0; break;
                    case 2: chkJuradoTesis.Checked = FData.Tables[0].Rows.Count > 0; break;
                    case 3: chkEvaluacionBecarios.Checked = FData.Tables[0].Rows.Count > 0; break;
                    case 4: chkEvaluacionInvestigadores.Checked = FData.Tables[0].Rows.Count > 0; break;
                    case 5: chkEvaluacionProgramas.Checked = FData.Tables[0].Rows.Count > 0; break;
                    case 6: chkEvaluacionInstituciones.Checked = FData.Tables[0].Rows.Count > 0; break;
                    case 7: chkEvaluacionComite.Checked = FData.Tables[0].Rows.Count > 0; break;
                    case 8: chkEvaluacionAcreditacion.Checked = FData.Tables[0].Rows.Count > 0; break;
                }
            }
        }

        protected void cmbExperienciasEvaluacionTiposEvaluacion_SelectedIndexChanged(object sender, EventArgs e)
        {

            pnlExperienciasEvaluacionOtroTipoEvaluacion.Visible = cmbExperienciasEvaluacionTiposEvaluacion.SelectedValue == "1000";



        }

        protected void cmbInstitucion_SelectedIndexChanged(object sender, EventArgs e)
        {

            pnlOtraInstitucion.Visible = cmbInstitucion.SelectedValue == "-1";



        }

        #endregion



        // Botones General
        protected bool guardar()
        {
            return true;
        }

        protected void btnGuardarC_Click(object sender, EventArgs e)
        {
            if (guardar())
                Response.Redirect("abm-p10.aspx");
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

}
