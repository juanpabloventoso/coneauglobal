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
            {
                // Listado de categorías de investigación
                DataSet FDatos = FGestor.LeerSQL("SELECT ID_TIPOS_CONICET_INV, TIPO_CONICET_INV FROM SIS_DOCENTES.Q_TIPOS_CONICET_INV");
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(ddlCONICET, FDatos, false, false);
                FDatos = FGestor.LeerSQL("SELECT ID_TIPOS_INCENTIVOS_INV, TIPO_INCENTIVOS_INV FROM SIS_DOCENTES.Q_TIPOS_INCENTIVOS_INV");
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(ddlIncentivos, FDatos, false, false);
                DataSet datos = FGestor.LeerSQL("SELECT ID_INSTITUCIONES, INSTITUCION FROM SIS_UNIVERSIDADES.INSTITUCIONES WHERE ID_ESTADOS_INSTITUCIONES = 1 ORDER BY INSTITUCION");
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbSistemasPromocionOtrosInstitucion, datos, true, false);
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbProyectosInvestigacionInstitucion, datos, true, false);
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbProyectosInvestigacionInstEval, datos, true, false);
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbProyectosInvestigacionInstFinan, datos, true, false);
                actualizarDatos();
            }
            actualizarDatosSistemaPromocionOtro();
            actualizarDatosProyectoInvestigacion();
            actualizarDatosPubRevistasCA();
            actualizarDatosPubRevistasSA();
            actualizarDatosPubLibros();
            actualizarDatosPubCapitulosLibros();
            actualizarDatosPubExposiciones();
            actualizarDatosProdProtegidos();
            actualizarDatosProdNoProtegidos();
        }

        #region DatosGenerales

        protected void actualizarDatos()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Docente FDocente = new Docente();
            FGestor.ObtenerObjeto(FDocente, int.Parse(Session["ID_DOCENTES"].ToString()));
            chkCONICET.Checked = FDocente.INVESTIGADOR_CONICET;
            chkIncentivos.Checked = FDocente.INVESTIGADOR_INCENTIVOS;
            chkOtros.Checked = FDocente.INVESTIGADOR_OTRO;
            try
            {
                ddlCONICET.SelectedValue = FDocente.ID_TIPOS_CONICET_INV.ToString();
            }
            catch
            {
            }
            try
            {
                ddlIncentivos.SelectedValue = FDocente.ID_TIPOS_INCENTIVOS_INV.ToString();
            }
            catch
            {
            }
        }


        // Botones General
        protected bool guardar()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Docente FDocente = new Docente();
            FGestor.ObtenerObjeto(FDocente, int.Parse(Session["ID_DOCENTES"].ToString()));
            FDocente.INVESTIGADOR_CONICET = chkCONICET.Checked;
            FDocente.INVESTIGADOR_INCENTIVOS = chkIncentivos.Checked;
            FDocente.INVESTIGADOR_OTRO = chkOtros.Checked;
            if (chkCONICET.Checked)
                FDocente.ID_TIPOS_CONICET_INV = int.Parse(ddlCONICET.SelectedValue);
            else
                FDocente.ID_TIPOS_CONICET_INV = 0;
            if (chkIncentivos.Checked)
                FDocente.ID_TIPOS_INCENTIVOS_INV = int.Parse(ddlIncentivos.SelectedValue);
            else
                FDocente.ID_TIPOS_INCENTIVOS_INV = 0;
            return FGestor.GuardarObjeto(FDocente);
        }



        protected void btnGuardarC_Click(object sender, EventArgs e)
        {
            if (guardar())
                Response.Redirect("abm-p8.aspx");
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

        #endregion

        

        #region InvestigacionOtro

        protected void cmbSistemasPromocionOtrosInstitucion_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlSistemasPromocionOtrosOtraInstitucion.Visible = cmbSistemasPromocionOtrosInstitucion.SelectedValue == "-1";
        }

        protected void actualizarDatosSistemaPromocionOtro()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            string FCondicion = " ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
            if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
                FCondicion += " AND ((FECHA_ALTA - 1) <= '" + Session["FECHA_PRESENTADA"].ToString() + "' OR FECHA_ALTA IS NULL)";
            grdSistemasPromocionOtrosABM.DataSource = FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_OTRAS_CATEGORIAS_INV WHERE " + FCondicion);
            grdSistemasPromocionOtrosABM.DataBind();
        }

        // Botones ABM Sistemas Promocion Otros
        protected void btnAgregarSistemaPromocionOtro_Click(object sender, EventArgs e)
        {
            Session["OperacionDetalle"] = "1";
            edtSistemasPromocionOtrosCategoria.Text = "";
            cmbSistemasPromocionOtrosInstitucion.SelectedIndex = 0;
            cmbSistemasPromocionOtrosInstitucion_SelectedIndexChanged(sender, e);
            edtSistemasPromocionOtrosOtraInstitucion.Text = "";
            popSistemasPromocionOtros.ShowOnPageLoad = true;
        }

        protected void btnModificarSistemaPromocionOtro_Click(object sender, EventArgs e)
        {
            if (grdSistemasPromocionOtrosABM.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            OtraCategoriaInv FOtraCategoriaInv = new OtraCategoriaInv();
            FGestor.ObtenerObjeto(FOtraCategoriaInv, grdSistemasPromocionOtrosABM);
            Session["OperacionDetalle"] = "2";
            if (FOtraCategoriaInv.INSTITUCION_UNIV)
                cmbSistemasPromocionOtrosInstitucion.SelectedValue = FOtraCategoriaInv.ID_INSTITUCIONES.ToString();
            else
                cmbSistemasPromocionOtrosInstitucion.SelectedValue = "-1";
            cmbSistemasPromocionOtrosInstitucion_SelectedIndexChanged(sender, e);
            edtSistemasPromocionOtrosOtraInstitucion.Text = FOtraCategoriaInv.OTRA_INSTITUCION;
            edtSistemasPromocionOtrosCategoria.Text = FOtraCategoriaInv.CATEGORIA;
            popSistemasPromocionOtros.ShowOnPageLoad = true;
        }

        protected void btnEliminarSistemaPromocionOtro_Click(object sender, EventArgs e)
        {
            if (grdSistemasPromocionOtrosABM.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            OtraCategoriaInv FOtraCategoriaInv = new OtraCategoriaInv();
            FGestor.ObtenerObjeto(FOtraCategoriaInv, grdSistemasPromocionOtrosABM);
            FGestor.EliminarObjeto(FOtraCategoriaInv);
            actualizarDatosSistemaPromocionOtro();
        }

        // Botones Popup Sistemas Promocion Otros
        protected void btnGuardarSistemaPromocionOtro_Click(object sender, EventArgs e)
        {
            // Requeridos
            string FEstado = "";
            if ((pnlSistemasPromocionOtrosOtraInstitucion.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtSistemasPromocionOtrosOtraInstitucion.Text)))
                FEstado = "la institución ú organismo";
            else
                if (!sgwNucleo.Funciones.VerificarRequerido(edtSistemasPromocionOtrosCategoria.Text))
                    FEstado = "la categoría";
            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            OtraCategoriaInv FOtraCategoriaInv = new OtraCategoriaInv();
            if (Session["OperacionDetalle"].ToString() == "1")
                FOtraCategoriaInv.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
            else
                FGestor.ObtenerObjeto(FOtraCategoriaInv, grdSistemasPromocionOtrosABM);
            if (!pnlSistemasPromocionOtrosOtraInstitucion.Visible)
            {
                FOtraCategoriaInv.ID_INSTITUCIONES = int.Parse(cmbSistemasPromocionOtrosInstitucion.SelectedValue);
                FOtraCategoriaInv.INSTITUCION_UNIV = true;
                FOtraCategoriaInv.OTRA_INSTITUCION = "";
            }
            else
            {
                FOtraCategoriaInv.ID_INSTITUCIONES = 0;
                FOtraCategoriaInv.INSTITUCION_UNIV = false;
                FOtraCategoriaInv.OTRA_INSTITUCION = edtSistemasPromocionOtrosOtraInstitucion.Text;
            }
            FOtraCategoriaInv.CATEGORIA = edtSistemasPromocionOtrosCategoria.Text;
            FGestor.GuardarObjeto(FOtraCategoriaInv);
            actualizarDatosSistemaPromocionOtro();
            sgwNucleo.Pagina.CerrarPopup(popSistemasPromocionOtros);
        }

        protected void btnCancelarSistemaPromocionOtro_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popSistemasPromocionOtros);
        }

        #endregion

        
        
        #region ProyectosInvestigacion

        protected void actualizarDatosProyectoInvestigacion()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            string FCondicion = " ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
            if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
                FCondicion += " AND ((FECHA_ALTA - 1) <= '" + Session["FECHA_PRESENTADA"].ToString() + "' OR FECHA_ALTA IS NULL)";
            grdProyectosInvestigacion.DataSource = FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_ACTIVIDADES_INVESTIGACION WHERE " + FCondicion);
            grdProyectosInvestigacion.DataBind();
        }

        // Botones ABM Proyectos Investigacion
        protected void btnAgregarProyectoInvestigacion_Click(object sender, EventArgs e)
        {
            Session["OperacionDetalle"] = "1";
            cmbProyectosInvestigacionInstitucion.SelectedIndex = 0;
            cmbProyectosInvestigacionInstitucion_SelectedIndexChanged(sender, e);
            cmbProyectosInvestigacionInstEval.SelectedIndex = 0;
            cmbProyectosInvestigacionInstEval_SelectedIndexChanged(sender, e);
            cmbProyectosInvestigacionInstFinan.SelectedIndex = 0;
            cmbProyectosInvestigacionInstFinan_SelectedIndexChanged(sender, e);
            edtProyectosInvestigacionOtraInstitucion.Text = "";
            edtProyectosInvestigacionOtraInstEval.Text = "";
            edtProyectosInvestigacionOtraInstFinan.Text = "";
            edtProyectosInvestigacionFechaInicio.Text = "";
            edtProyectosInvestigacionFechaFinalizacion.Text = "";
            rdbProyectosInvestigacionCaracterParticipacion.SelectedIndex = 0;
            edtProyectosInvestigacionPrincipalesResultados.Text = "";
            edtProyectosInvestigacionTituloProyecto.Text = "";
            popProyectosInvestigacion.ShowOnPageLoad = true;
        }

        protected void btnModificarProyectoInvestigacion_Click(object sender, EventArgs e)
        {
            if (grdProyectosInvestigacion.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            ActividadInvestigacion FActividadInvestigacion = new ActividadInvestigacion();
            FGestor.ObtenerObjeto(FActividadInvestigacion, grdProyectosInvestigacion);
            Session["OperacionDetalle"] = "2";
            if (FActividadInvestigacion.INSTITUCION_UNIV)
                cmbProyectosInvestigacionInstitucion.SelectedValue = FActividadInvestigacion.ID_INSTITUCIONES.ToString();
            else
                cmbProyectosInvestigacionInstitucion.SelectedValue = "-1";
            cmbProyectosInvestigacionInstitucion_SelectedIndexChanged(sender, e);
            if (FActividadInvestigacion.INST_EVAL_UNIV)
                cmbProyectosInvestigacionInstEval.SelectedValue = FActividadInvestigacion.ID_INSTITUCIONES_EVAL.ToString();
            else
                cmbProyectosInvestigacionInstEval.SelectedValue = "-1";
            cmbProyectosInvestigacionInstEval_SelectedIndexChanged(sender, e);
            if (FActividadInvestigacion.INST_FINAN_UNIV)
                cmbProyectosInvestigacionInstFinan.SelectedValue = FActividadInvestigacion.ID_INSTITUCIONES_FINAN.ToString();
            else
                cmbProyectosInvestigacionInstFinan.SelectedValue = "-1";
            cmbProyectosInvestigacionInstFinan_SelectedIndexChanged(sender, e);
            edtProyectosInvestigacionOtraInstitucion.Text = FActividadInvestigacion.OTRA_INSTITUCION;
            edtProyectosInvestigacionOtraInstEval.Text = FActividadInvestigacion.OTRA_INST_EVAL;
            edtProyectosInvestigacionOtraInstFinan.Text = FActividadInvestigacion.OTRA_INST_FINAN;
            edtProyectosInvestigacionFechaInicio.Text = FActividadInvestigacion.LeerFecha("FECHA_INICIO");
            edtProyectosInvestigacionFechaFinalizacion.Text = FActividadInvestigacion.LeerFecha("FECHA_FINALIZACION");
            edtProyectosInvestigacionTituloProyecto.Text = FActividadInvestigacion.ACTIVIDAD_INVESTIGACION;
            if (FActividadInvestigacion.DIRECTOR_CODIRECTOR)
                rdbProyectosInvestigacionCaracterParticipacion.SelectedIndex = 0;
            else
                rdbProyectosInvestigacionCaracterParticipacion.SelectedIndex = 1;
            edtProyectosInvestigacionPrincipalesResultados.Text = FActividadInvestigacion.RESULTADOS;
            popProyectosInvestigacion.ShowOnPageLoad = true;
        }

        protected void btnEliminarProyectoInvestigacion_Click(object sender, EventArgs e)
        {
            if (grdProyectosInvestigacion.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            ActividadInvestigacion FActividadInvestigacion = new ActividadInvestigacion();
            FGestor.ObtenerObjeto(FActividadInvestigacion, grdProyectosInvestigacion);
            FGestor.EliminarObjeto(FActividadInvestigacion);
            actualizarDatosProyectoInvestigacion();
        }

        // Botones Popup Proyectos Investigacion
        protected void btnGuardarProyectoInvestigacion_Click(object sender, EventArgs e)
        {
            // Requeridos
            string FEstado = "";
            if (!sgwNucleo.Funciones.VerificarRequerido(edtProyectosInvestigacionTituloProyecto.Text))
                FEstado = "la denominación del proyecto";
            else
                if ((pnlProyectosInvestigacionOtraInstitucion.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtProyectosInvestigacionOtraInstitucion.Text)))
                    FEstado = "la institución";
                else
                    if ((pnlProyectosInvestigacionOtraInstEval.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtProyectosInvestigacionOtraInstEval.Text)))
                        FEstado = "la institución evaluadora";
                    else
                        if ((pnlProyectosInvestigacionOtraInstFinan.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtProyectosInvestigacionOtraInstFinan.Text)))
                            FEstado = "la institución financiadora";
                        else
                            if (!sgwNucleo.Funciones.VerificarRequerido(edtProyectosInvestigacionFechaInicio.Text))
                                FEstado = "la fecha de inicio";
                            else
                                if (!sgwNucleo.Funciones.VerificarRequerido(edtProyectosInvestigacionPrincipalesResultados.Text))
                                    FEstado = "los principales resultados";
            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            ActividadInvestigacion FActividadInvestigacion = new ActividadInvestigacion();
            if (Session["OperacionDetalle"].ToString() == "1")
                FActividadInvestigacion.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
            else
                FGestor.ObtenerObjeto(FActividadInvestigacion, grdProyectosInvestigacion);
            if (!pnlProyectosInvestigacionOtraInstitucion.Visible)
            {
                FActividadInvestigacion.ID_INSTITUCIONES = int.Parse(cmbProyectosInvestigacionInstitucion.SelectedValue);
                FActividadInvestigacion.INSTITUCION_UNIV = true; FActividadInvestigacion.OTRA_INSTITUCION = "";
            }
            else
            {
                FActividadInvestigacion.ID_INSTITUCIONES = 0; FActividadInvestigacion.INSTITUCION_UNIV = false;
                FActividadInvestigacion.OTRA_INSTITUCION = edtProyectosInvestigacionOtraInstitucion.Text;
            }
            if (!pnlProyectosInvestigacionOtraInstEval.Visible)
            {
                FActividadInvestigacion.ID_INSTITUCIONES_EVAL = int.Parse(cmbProyectosInvestigacionInstEval.SelectedValue);
                FActividadInvestigacion.INST_EVAL_UNIV = true; FActividadInvestigacion.OTRA_INST_EVAL = "";
            }
            else
            {
                FActividadInvestigacion.ID_INSTITUCIONES_EVAL = 0; FActividadInvestigacion.INST_EVAL_UNIV = false;
                FActividadInvestigacion.OTRA_INST_EVAL = edtProyectosInvestigacionOtraInstEval.Text;
            }
            if (!pnlProyectosInvestigacionOtraInstFinan.Visible)
            {
                FActividadInvestigacion.ID_INSTITUCIONES_FINAN = int.Parse(cmbProyectosInvestigacionInstFinan.SelectedValue);
                FActividadInvestigacion.INST_FINAN_UNIV = true; FActividadInvestigacion.OTRA_INST_FINAN = "";
            }
            else
            {
                FActividadInvestigacion.ID_INSTITUCIONES_FINAN = 0; FActividadInvestigacion.INST_FINAN_UNIV = false;
                FActividadInvestigacion.OTRA_INST_FINAN = edtProyectosInvestigacionOtraInstFinan.Text;
            }
            FActividadInvestigacion.GuardarFecha("FECHA_INICIO", edtProyectosInvestigacionFechaInicio.Text);
            FActividadInvestigacion.GuardarFecha("FECHA_FINALIZACION", edtProyectosInvestigacionFechaFinalizacion.Text);
            FActividadInvestigacion.DIRECTOR_CODIRECTOR = rdbProyectosInvestigacionCaracterParticipacion.SelectedIndex == 0;
            FActividadInvestigacion.RESULTADOS = edtProyectosInvestigacionPrincipalesResultados.Text;
            FActividadInvestigacion.ACTIVIDAD_INVESTIGACION = edtProyectosInvestigacionTituloProyecto.Text;
            FGestor.GuardarObjeto(FActividadInvestigacion);
            actualizarDatosProyectoInvestigacion();
            sgwNucleo.Pagina.CerrarPopup(popProyectosInvestigacion);
        }

        protected void btnCancelarProyectoInvestigacion_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popProyectosInvestigacion);
        }

        protected void cmbProyectosInvestigacionInstitucion_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlProyectosInvestigacionOtraInstitucion.Visible = cmbProyectosInvestigacionInstitucion.SelectedValue == "-1";
        }

        protected void cmbProyectosInvestigacionInstEval_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlProyectosInvestigacionOtraInstEval.Visible = cmbProyectosInvestigacionInstEval.SelectedValue == "-1";
        }

        protected void cmbProyectosInvestigacionInstFinan_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlProyectosInvestigacionOtraInstFinan.Visible = cmbProyectosInvestigacionInstFinan.SelectedValue == "-1";
        }

        #endregion



        #region PublicacionesRevistasCA

        protected void actualizarDatosPubRevistasCA()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            string FCondicion = " ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
            if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
                FCondicion += " AND ((FECHA_ALTA - 1) <= '" + Session["FECHA_PRESENTADA"].ToString() + "' OR FECHA_ALTA IS NULL)";
            grdPublicacionesRevistasConArbitraje.DataSource =
                FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_PUBLICACIONES WHERE ID_TIPOS_PUBLICACIONES = 1 AND " + FCondicion);
            grdPublicacionesRevistasConArbitraje.DataBind();
        }

        // Botones ABM Publicaciones Revistas con arbitraje
        protected void btnAgregarPublicacionRevistaConArbitraje_Click(object sender, EventArgs e)
        {
            Session["OperacionDetalle"] = "1";
            edtPublicacionesRevistasConArbitrajeAnio.Text = DateTime.Today.Year.ToString();
            edtPublicacionesRevistasConArbitrajeAutores.Text = "";
            edtPublicacionesRevistasConArbitrajePaginas.Text = "";
            edtPublicacionesRevistasConArbitrajeURL.Text = "http://";
            edtPublicacionesRevistasConArbitrajePalabrasClave.Text = "";
            edtPublicacionesRevistasConArbitrajeRevista.Text = "";
            edtPublicacionesRevistasConArbitrajeTitulo.Text = "";
            edtPublicacionesRevistasConArbitrajeVolumen.Text = "";
            popPublicacionesRevistasConArbitraje.ShowOnPageLoad = true;
        }

        protected void btnModificarPublicacionRevistaConArbitraje_Click(object sender, EventArgs e)
        {
            if (grdPublicacionesRevistasConArbitraje.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Publicacion FPublicacion = new Publicacion();
            FGestor.ObtenerObjeto(FPublicacion, grdPublicacionesRevistasConArbitraje);
            Session["OperacionDetalle"] = "2";
            edtPublicacionesRevistasConArbitrajeAnio.Text = FPublicacion.ANIO.ToString();
            edtPublicacionesRevistasConArbitrajeAutores.Text = FPublicacion.AUTORES;
            edtPublicacionesRevistasConArbitrajePaginas.Text = FPublicacion.PAGINAS;
            edtPublicacionesRevistasConArbitrajeURL.Text = FPublicacion.URL;
            edtPublicacionesRevistasConArbitrajePalabrasClave.Text = FPublicacion.PALABRAS_CLAVE;
            edtPublicacionesRevistasConArbitrajeRevista.Text = FPublicacion.CONTENEDOR;
            edtPublicacionesRevistasConArbitrajeTitulo.Text = FPublicacion.PUBLICACION;
            edtPublicacionesRevistasConArbitrajeVolumen.Text = FPublicacion.VOLUMEN;
            popPublicacionesRevistasConArbitraje.ShowOnPageLoad = true;
        }
        protected void btnEliminarPublicacionRevistaConArbitraje_Click(object sender, EventArgs e)
        {
            if (grdPublicacionesRevistasConArbitraje.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Publicacion FPublicacion = new Publicacion();
            FGestor.ObtenerObjeto(FPublicacion, grdPublicacionesRevistasConArbitraje);
            FGestor.EliminarObjeto(FPublicacion);
            actualizarDatosPubRevistasCA();
        }

        // Botones Popup Publicaciones Revistas con arbitraje
        protected void btnGuardarPublicacionRevistaConArbitraje_Click(object sender, EventArgs e)
        {
            // Requeridos
            string FEstado = "";
            if (!sgwNucleo.Funciones.VerificarRequeridoInt(edtPublicacionesRevistasConArbitrajeAnio.Text))
                FEstado = "el año de la publicación";
            else
                if (!sgwNucleo.Funciones.VerificarRequerido(edtPublicacionesRevistasConArbitrajeAutores.Text))
                    FEstado = "los autores de la publicación";
                else
                    if (!sgwNucleo.Funciones.VerificarRequerido(edtPublicacionesRevistasConArbitrajeRevista.Text))
                        FEstado = "la revista de la publicación";
                    else
                        if (!sgwNucleo.Funciones.VerificarRequerido(edtPublicacionesRevistasConArbitrajeTitulo.Text))
                            FEstado = "el título de la publicación";
            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Publicacion FPublicacion = new Publicacion();
            if (Session["OperacionDetalle"].ToString() == "1")
            {
                FPublicacion.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
                FPublicacion.ID_TIPOS_PUBLICACIONES = 1;
            }
            else
                FGestor.ObtenerObjeto(FPublicacion, grdPublicacionesRevistasConArbitraje);
            FPublicacion.ANIO = int.Parse(edtPublicacionesRevistasConArbitrajeAnio.Text);
            FPublicacion.AUTORES = edtPublicacionesRevistasConArbitrajeAutores.Text;
            FPublicacion.PAGINAS = edtPublicacionesRevistasConArbitrajePaginas.Text;
            if (edtPublicacionesRevistasConArbitrajeURL.Text.Trim().ToLower() != "http://")
                FPublicacion.URL = edtPublicacionesRevistasConArbitrajeURL.Text;
            else
                FPublicacion.URL = "";
            FPublicacion.PALABRAS_CLAVE = edtPublicacionesRevistasConArbitrajePalabrasClave.Text;
            FPublicacion.CONTENEDOR = edtPublicacionesRevistasConArbitrajeRevista.Text;
            FPublicacion.PUBLICACION = edtPublicacionesRevistasConArbitrajeTitulo.Text;
            FPublicacion.VOLUMEN = edtPublicacionesRevistasConArbitrajeVolumen.Text;
            FGestor.GuardarObjeto(FPublicacion);
            actualizarDatosPubRevistasCA();
            sgwNucleo.Pagina.CerrarPopup(popPublicacionesRevistasConArbitraje);
        }
        protected void btnCancelarPublicacionRevistaConArbitraje_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popPublicacionesRevistasConArbitraje);
        }

        #endregion


        #region PublicacionesRevistasSA

        protected void actualizarDatosPubRevistasSA()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            string FCondicion = " ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
            if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
                FCondicion += " AND ((FECHA_ALTA - 1) <= '" + Session["FECHA_PRESENTADA"].ToString() + "' OR FECHA_ALTA IS NULL)";
            grdPublicacionesRevistasSinArbitraje.DataSource =
                FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_PUBLICACIONES WHERE ID_TIPOS_PUBLICACIONES = 2 AND " + FCondicion);
            grdPublicacionesRevistasSinArbitraje.DataBind();
        }

        // Botones ABM Publicaciones Revistas sin arbitraje
        protected void btnAgregarPublicacionRevistaSinArbitraje_Click(object sender, EventArgs e)
        {
            Session["OperacionDetalle"] = "1";
            edtPublicacionesRevistasSinArbitrajeAnio.Text = DateTime.Today.Year.ToString();
            edtPublicacionesRevistasSinArbitrajeAutores.Text = "";
            edtPublicacionesRevistasSinArbitrajePaginas.Text = "";
            edtPublicacionesRevistasSinArbitrajeURL.Text = "http://";
            edtPublicacionesRevistasSinArbitrajePalabrasClave.Text = "";
            edtPublicacionesRevistasSinArbitrajeRevista.Text = "";
            edtPublicacionesRevistasSinArbitrajeTitulo.Text = "";
            edtPublicacionesRevistasSinArbitrajeVolumen.Text = "";
            popPublicacionesRevistasSinArbitraje.ShowOnPageLoad = true;
        }
        protected void btnModificarPublicacionRevistaSinArbitraje_Click(object sender, EventArgs e)
        {
            if (grdPublicacionesRevistasSinArbitraje.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Publicacion FPublicacion = new Publicacion();
            FGestor.ObtenerObjeto(FPublicacion, grdPublicacionesRevistasSinArbitraje);
            Session["OperacionDetalle"] = "2";
            edtPublicacionesRevistasSinArbitrajeAnio.Text = FPublicacion.ANIO.ToString();
            edtPublicacionesRevistasSinArbitrajeAutores.Text = FPublicacion.AUTORES;
            edtPublicacionesRevistasSinArbitrajePaginas.Text = FPublicacion.PAGINAS;
            edtPublicacionesRevistasSinArbitrajeURL.Text = FPublicacion.URL;
            edtPublicacionesRevistasSinArbitrajePalabrasClave.Text = FPublicacion.PALABRAS_CLAVE;
            edtPublicacionesRevistasSinArbitrajeRevista.Text = FPublicacion.CONTENEDOR;
            edtPublicacionesRevistasSinArbitrajeTitulo.Text = FPublicacion.PUBLICACION;
            edtPublicacionesRevistasSinArbitrajeVolumen.Text = FPublicacion.VOLUMEN;
            popPublicacionesRevistasSinArbitraje.ShowOnPageLoad = true;
        }
        protected void btnEliminarPublicacionRevistaSinArbitraje_Click(object sender, EventArgs e)
        {
            if (grdPublicacionesRevistasSinArbitraje.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Publicacion FPublicacion = new Publicacion();
            FGestor.ObtenerObjeto(FPublicacion, grdPublicacionesRevistasSinArbitraje);
            FGestor.EliminarObjeto(FPublicacion);
            actualizarDatosPubRevistasSA();
        }

        // Botones Popup Publicaciones revistas sin arbitraje
        protected void btnGuardarPublicacionRevistaSinArbitraje_Click(object sender, EventArgs e)
        {
            // Requeridos
            string FEstado = "";
            if (!sgwNucleo.Funciones.VerificarRequeridoInt(edtPublicacionesRevistasSinArbitrajeAnio.Text))
                FEstado = "el año de la publicación";
            else
                if (!sgwNucleo.Funciones.VerificarRequerido(edtPublicacionesRevistasSinArbitrajeAutores.Text))
                    FEstado = "los autores de la publicación";
                else
                    if (!sgwNucleo.Funciones.VerificarRequerido(edtPublicacionesRevistasSinArbitrajeRevista.Text))
                        FEstado = "la revista de la publicación";
                    else
                        if (!sgwNucleo.Funciones.VerificarRequerido(edtPublicacionesRevistasSinArbitrajeTitulo.Text))
                            FEstado = "el título de la publicación";
            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Publicacion FPublicacion = new Publicacion();
            if (Session["OperacionDetalle"].ToString() == "1")
            {
                FPublicacion.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
                FPublicacion.ID_TIPOS_PUBLICACIONES = 2;
            }
            else
                FGestor.ObtenerObjeto(FPublicacion, grdPublicacionesRevistasSinArbitraje);
            FPublicacion.ANIO = int.Parse(edtPublicacionesRevistasSinArbitrajeAnio.Text);
            FPublicacion.AUTORES = edtPublicacionesRevistasSinArbitrajeAutores.Text;
            FPublicacion.PAGINAS = edtPublicacionesRevistasSinArbitrajePaginas.Text;
            if (edtPublicacionesRevistasSinArbitrajeURL.Text.Trim().ToLower() != "http://")
                FPublicacion.URL = edtPublicacionesRevistasSinArbitrajeURL.Text;
            else
                FPublicacion.URL = "";
            FPublicacion.PALABRAS_CLAVE = edtPublicacionesRevistasSinArbitrajePalabrasClave.Text;
            FPublicacion.CONTENEDOR = edtPublicacionesRevistasSinArbitrajeRevista.Text;
            FPublicacion.PUBLICACION = edtPublicacionesRevistasSinArbitrajeTitulo.Text;
            FPublicacion.VOLUMEN = edtPublicacionesRevistasSinArbitrajeVolumen.Text;
            FGestor.GuardarObjeto(FPublicacion);
            actualizarDatosPubRevistasSA();
            sgwNucleo.Pagina.CerrarPopup(popPublicacionesRevistasSinArbitraje);
        }
        protected void btnCancelarPublicacionRevistaSinArbitraje_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popPublicacionesRevistasSinArbitraje);
        }

        #endregion


        #region PublicacionesLibros

        protected void actualizarDatosPubLibros()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            string FCondicion = " ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
            if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
                FCondicion += " AND ((FECHA_ALTA - 1) <= '" + Session["FECHA_PRESENTADA"].ToString() + "' OR FECHA_ALTA IS NULL)";
            grdPublicacionesLibros.DataSource =
                FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_PUBLICACIONES WHERE ID_TIPOS_PUBLICACIONES = 4 AND " + FCondicion);
            grdPublicacionesLibros.DataBind();
        }

        // Botones ABM Publicaciones libros
        protected void btnAgregarPublicacionLibro_Click(object sender, EventArgs e)
        {
            Session["OperacionDetalle"] = "1";
            edtPublicacionesLibrosAnio.Text = DateTime.Today.Year.ToString();
            edtPublicacionesLibrosAutores.Text = "";
            edtPublicacionesLibrosEditorial.Text = "";
            edtPublicacionesLibrosURL.Text = "http://";
            edtPublicacionesLibrosLugarImpresion.Text = "";
            edtPublicacionesLibrosPaginas.Text = "";
            edtPublicacionesLibrosPalabrasClave.Text = "";
            edtPublicacionesLibrosTituloLibro.Text = "";
            popPublicacionesLibros.ShowOnPageLoad = true;
        }
        protected void btnModificarPublicacionLibro_Click(object sender, EventArgs e)
        {
            if (grdPublicacionesLibros.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Publicacion FPublicacion = new Publicacion();
            FGestor.ObtenerObjeto(FPublicacion, grdPublicacionesLibros);
            Session["OperacionDetalle"] = "2";
            edtPublicacionesLibrosAnio.Text = FPublicacion.ANIO.ToString();
            edtPublicacionesLibrosAutores.Text = FPublicacion.AUTORES;
            edtPublicacionesLibrosEditorial.Text = FPublicacion.EDITORIAL;
            edtPublicacionesLibrosURL.Text = FPublicacion.URL;
            edtPublicacionesLibrosLugarImpresion.Text = FPublicacion.LUGAR_IMPRESION;
            edtPublicacionesLibrosPaginas.Text = FPublicacion.PAGINAS;
            edtPublicacionesLibrosPalabrasClave.Text = FPublicacion.PALABRAS_CLAVE;
            edtPublicacionesLibrosTituloLibro.Text = FPublicacion.PUBLICACION;
            popPublicacionesLibros.ShowOnPageLoad = true;
        }
        protected void btnEliminarPublicacionLibro_Click(object sender, EventArgs e)
        {
            if (grdPublicacionesLibros.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Publicacion FPublicacion = new Publicacion();
            FGestor.ObtenerObjeto(FPublicacion, grdPublicacionesLibros);
            FGestor.EliminarObjeto(FPublicacion);
            actualizarDatosPubLibros();
        }

        // Botonera Popup Publicaciones libros
        protected void btnGuardarPublicacionLibro_Click(object sender, EventArgs e)
        {
            // Requeridos
            string FEstado = "";
            if (!sgwNucleo.Funciones.VerificarRequeridoInt(edtPublicacionesLibrosAnio.Text))
                FEstado = "el año de la publicación";
            else
                if (!sgwNucleo.Funciones.VerificarRequerido(edtPublicacionesLibrosAutores.Text))
                    FEstado = "los autores de la publicación";
                else
                    if (!sgwNucleo.Funciones.VerificarRequerido(edtPublicacionesLibrosEditorial.Text))
                        FEstado = "la editorial de la publicación";
                    else
                        if (!sgwNucleo.Funciones.VerificarRequerido(edtPublicacionesLibrosTituloLibro.Text))
                            FEstado = "el título de la publicación";
            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Publicacion FPublicacion = new Publicacion();
            if (Session["OperacionDetalle"].ToString() == "1")
            {
                FPublicacion.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
                FPublicacion.ID_TIPOS_PUBLICACIONES = 4;
            }
            else
                FGestor.ObtenerObjeto(FPublicacion, grdPublicacionesLibros);
            FPublicacion.ANIO = int.Parse(edtPublicacionesLibrosAnio.Text);
            FPublicacion.AUTORES = edtPublicacionesLibrosAutores.Text;
            FPublicacion.EDITORIAL = edtPublicacionesLibrosEditorial.Text;
            if (edtPublicacionesLibrosURL.Text.Trim().ToLower() != "http://")
                FPublicacion.URL = edtPublicacionesLibrosURL.Text;
            else
                FPublicacion.URL = "";
            FPublicacion.LUGAR_IMPRESION = edtPublicacionesLibrosLugarImpresion.Text;
            FPublicacion.PAGINAS = edtPublicacionesLibrosPaginas.Text;
            FPublicacion.PALABRAS_CLAVE = edtPublicacionesLibrosPalabrasClave.Text;
            FPublicacion.PUBLICACION = edtPublicacionesLibrosTituloLibro.Text;
            FGestor.GuardarObjeto(FPublicacion);
            actualizarDatosPubLibros();
            sgwNucleo.Pagina.CerrarPopup(popPublicacionesLibros);
        }
        protected void btnCancelarPublicacionLibro_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popPublicacionesLibros);
        }


        #endregion


        #region PublicacionesCapitulosLibros

        protected void actualizarDatosPubCapitulosLibros()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            string FCondicion = " ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
            if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
                FCondicion += " AND ((FECHA_ALTA - 1) <= '" + Session["FECHA_PRESENTADA"].ToString() + "' OR FECHA_ALTA IS NULL)";
            grdPublicacionesCapitulosLibros.DataSource =
                FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_PUBLICACIONES WHERE ID_TIPOS_PUBLICACIONES = 3 AND " + FCondicion);
            grdPublicacionesCapitulosLibros.DataBind();
        }

        // Botonera ABM Publicaciones Capitulos libros
        protected void btnAgregarPublicacionCapituloLibro_Click(object sender, EventArgs e)
        {
            Session["OperacionDetalle"] = "1";
            edtPublicacionesCapitulosLibrosAnio.Text = DateTime.Today.Year.ToString();
            edtPublicacionesCapitulosLibrosAutores.Text = "";
            edtPublicacionesCapitulosLibrosEditoresLibros.Text = "";
            edtPublicacionesCapitulosLibrosURL.Text = "http://";
            edtPublicacionesCapitulosLibrosLugarImpresion.Text = "";
            edtPublicacionesCapitulosLibrosEditorial.Text = "";
            edtPublicacionesCapitulosLibrosPalabrasClave.Text = "";
            edtPublicacionesCapitulosLibrosTituloCapitulo.Text = "";
            edtPublicacionesCapitulosLibrosTituloLibro.Text = "";
            edtPublicacionesCapitulosLibrosPaginas.Text = "";
            popPublicacionesCapitulosLibros.ShowOnPageLoad = true;
        }
        protected void btnModificarPublicacionCapituloLibro_Click(object sender, EventArgs e)
        {
            if (grdPublicacionesCapitulosLibros.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Publicacion FPublicacion = new Publicacion();
            FGestor.ObtenerObjeto(FPublicacion, grdPublicacionesCapitulosLibros);
            Session["OperacionDetalle"] = "2";
            edtPublicacionesCapitulosLibrosAnio.Text = FPublicacion.ANIO.ToString();
            edtPublicacionesCapitulosLibrosAutores.Text = FPublicacion.AUTORES;
            edtPublicacionesCapitulosLibrosEditoresLibros.Text = FPublicacion.EDITORES;
            edtPublicacionesCapitulosLibrosURL.Text = FPublicacion.URL;
            edtPublicacionesCapitulosLibrosLugarImpresion.Text = FPublicacion.LUGAR_IMPRESION;
            edtPublicacionesCapitulosLibrosEditorial.Text = FPublicacion.EDITORIAL;
            edtPublicacionesCapitulosLibrosPalabrasClave.Text = FPublicacion.PALABRAS_CLAVE;
            edtPublicacionesCapitulosLibrosTituloCapitulo.Text = FPublicacion.PUBLICACION;
            edtPublicacionesCapitulosLibrosTituloLibro.Text = FPublicacion.CONTENEDOR;
            edtPublicacionesCapitulosLibrosPaginas.Text = FPublicacion.PAGINAS;
            popPublicacionesCapitulosLibros.ShowOnPageLoad = true;
        }
        protected void btnEliminarPublicacionCapituloLibro_Click(object sender, EventArgs e)
        {
            if (grdPublicacionesCapitulosLibros.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Publicacion FPublicacion = new Publicacion();
            FGestor.ObtenerObjeto(FPublicacion, grdPublicacionesCapitulosLibros);
            FGestor.EliminarObjeto(FPublicacion);
            actualizarDatosPubCapitulosLibros();
        }

        // Botonera Popup Publicaciones capitulos libros
        protected void btnGuardarPublicacionCapituloLibro_Click(object sender, EventArgs e)
        {
            // Requeridos
            string FEstado = "";
            if (!sgwNucleo.Funciones.VerificarRequeridoInt(edtPublicacionesCapitulosLibrosAnio.Text))
                FEstado = "el año de la publicación";
            else
                if (!sgwNucleo.Funciones.VerificarRequerido(edtPublicacionesCapitulosLibrosAutores.Text))
                    FEstado = "los autores de la publicación";
                else
                    if (!sgwNucleo.Funciones.VerificarRequerido(edtPublicacionesCapitulosLibrosEditoresLibros.Text))
                        FEstado = "los editores de la publicación";
                    else
                        if (!sgwNucleo.Funciones.VerificarRequerido(edtPublicacionesCapitulosLibrosEditorial.Text))
                            FEstado = "la editorial de la publicación";
                        else
                            if (!sgwNucleo.Funciones.VerificarRequerido(edtPublicacionesCapitulosLibrosTituloLibro.Text))
                                FEstado = "el título del libro";
                            else
                                if (!sgwNucleo.Funciones.VerificarRequerido(edtPublicacionesCapitulosLibrosTituloCapitulo.Text))
                                    FEstado = "el título del capítulo";
            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Publicacion FPublicacion = new Publicacion();
            if (Session["OperacionDetalle"].ToString() == "1")
            {
                FPublicacion.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
                FPublicacion.ID_TIPOS_PUBLICACIONES = 3;
            }
            else
                FGestor.ObtenerObjeto(FPublicacion, grdPublicacionesCapitulosLibros);
            FPublicacion.ANIO = int.Parse(edtPublicacionesCapitulosLibrosAnio.Text);
            FPublicacion.AUTORES = edtPublicacionesCapitulosLibrosAutores.Text;
            FPublicacion.EDITORES = edtPublicacionesCapitulosLibrosEditoresLibros.Text;
            if (edtPublicacionesCapitulosLibrosURL.Text.Trim().ToLower() != "http://")
                FPublicacion.URL = edtPublicacionesCapitulosLibrosURL.Text;
            else
                FPublicacion.URL = "";
            FPublicacion.LUGAR_IMPRESION = edtPublicacionesCapitulosLibrosLugarImpresion.Text;
            FPublicacion.EDITORIAL = edtPublicacionesCapitulosLibrosEditorial.Text;
            FPublicacion.PALABRAS_CLAVE = edtPublicacionesCapitulosLibrosPalabrasClave.Text;
            FPublicacion.PUBLICACION = edtPublicacionesCapitulosLibrosTituloCapitulo.Text;
            FPublicacion.PAGINAS = edtPublicacionesCapitulosLibrosPaginas.Text;
            FPublicacion.CONTENEDOR = edtPublicacionesCapitulosLibrosTituloLibro.Text;
            FGestor.GuardarObjeto(FPublicacion);
            actualizarDatosPubCapitulosLibros();
            sgwNucleo.Pagina.CerrarPopup(popPublicacionesCapitulosLibros);
        }
        protected void btnCancelarPublicacionCapituloLibro_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popPublicacionesCapitulosLibros);
        }

        #endregion


        #region PublicacionesExposiciones

        protected void actualizarDatosPubExposiciones()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            string FCondicion = " ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
            if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
                FCondicion += " AND ((FECHA_ALTA - 1) <= '" + Session["FECHA_PRESENTADA"].ToString() + "' OR FECHA_ALTA IS NULL)";
            grdPublicacionesTrabajos.DataSource =
                FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_PUBLICACIONES WHERE ID_TIPOS_PUBLICACIONES = 5 AND " + FCondicion);
            grdPublicacionesTrabajos.DataBind();
        }

        // Botones ABM Publicaciones trabajos
        protected void btnAgregarPublicacionTrabajo_Click(object sender, EventArgs e)
        {
            Session["OperacionDetalle"] = "1";
            edtPublicacionesTrabajosAnio.Text = DateTime.Today.Year.ToString();
            edtPublicacionesTrabajosAutores.Text = "";
            edtPublicacionesTrabajosEvento.Text = "";
            edtPublicacionesTrabajosURL.Text = "http://";
            edtPublicacionesTrabajosLugarRealizacion.Text = "";
            edtPublicacionesTrabajosPalabrasClave.Text = "";
            edtPublicacionesTrabajosTitulo.Text = "";
            popPublicacionesTrabajos.ShowOnPageLoad = true;
        }
        protected void btnModificarPublicacionTrabajo_Click(object sender, EventArgs e)
        {
            if (grdPublicacionesTrabajos.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Publicacion FPublicacion = new Publicacion();
            FGestor.ObtenerObjeto(FPublicacion, grdPublicacionesTrabajos);
            Session["OperacionDetalle"] = "2";
            edtPublicacionesTrabajosAnio.Text = FPublicacion.ANIO.ToString();
            edtPublicacionesTrabajosAutores.Text = FPublicacion.AUTORES;
            edtPublicacionesTrabajosEvento.Text = FPublicacion.CONTENEDOR;
            edtPublicacionesTrabajosURL.Text = FPublicacion.URL;
            edtPublicacionesTrabajosLugarRealizacion.Text = FPublicacion.LUGAR_REALIZACION;
            edtPublicacionesTrabajosPalabrasClave.Text = FPublicacion.PALABRAS_CLAVE;
            edtPublicacionesTrabajosTitulo.Text = FPublicacion.PUBLICACION;
            popPublicacionesTrabajos.ShowOnPageLoad = true;
        }
        protected void btnEliminarPublicacionTrabajo_Click(object sender, EventArgs e)
        {
            if (grdPublicacionesTrabajos.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Publicacion FPublicacion = new Publicacion();
            FGestor.ObtenerObjeto(FPublicacion, grdPublicacionesTrabajos);
            FGestor.EliminarObjeto(FPublicacion);
            actualizarDatosPubExposiciones();
        }

        // Botonera Popup Publicaciones trabajos
        protected void btnGuardarPublicacionTrabajo_Click(object sender, EventArgs e)
        {
            // Requeridos
            string FEstado = "";
            if (!sgwNucleo.Funciones.VerificarRequeridoInt(edtPublicacionesTrabajosAnio.Text))
                FEstado = "el año de la exposición";
            else
                if (!sgwNucleo.Funciones.VerificarRequerido(edtPublicacionesTrabajosAutores.Text))
                    FEstado = "los autores de la exposición";
                else
                    if (!sgwNucleo.Funciones.VerificarRequerido(edtPublicacionesTrabajosEvento.Text))
                        FEstado = "el evento de la exposición";
                    else
                        if (!sgwNucleo.Funciones.VerificarRequerido(edtPublicacionesTrabajosLugarRealizacion.Text))
                            FEstado = "el lugar de realización del evento";
                        else
                            if (!sgwNucleo.Funciones.VerificarRequerido(edtPublicacionesTrabajosTitulo.Text))
                                FEstado = "el título de la exposición";
            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Publicacion FPublicacion = new Publicacion();
            if (Session["OperacionDetalle"].ToString() == "1")
            {
                FPublicacion.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
                FPublicacion.ID_TIPOS_PUBLICACIONES = 5;
            }
            else
                FGestor.ObtenerObjeto(FPublicacion, grdPublicacionesTrabajos);
            FPublicacion.ANIO = int.Parse(edtPublicacionesTrabajosAnio.Text);
            FPublicacion.AUTORES = edtPublicacionesTrabajosAutores.Text;
            FPublicacion.CONTENEDOR = edtPublicacionesTrabajosEvento.Text;
            if (edtPublicacionesCapitulosLibrosURL.Text.Trim().ToLower() != "http://")
                FPublicacion.URL = edtPublicacionesTrabajosURL.Text;
            else
                FPublicacion.URL = "";
            FPublicacion.LUGAR_REALIZACION = edtPublicacionesTrabajosLugarRealizacion.Text;
            FPublicacion.PALABRAS_CLAVE = edtPublicacionesTrabajosPalabrasClave.Text;
            FPublicacion.PUBLICACION = edtPublicacionesTrabajosTitulo.Text;
            FGestor.GuardarObjeto(FPublicacion);
            actualizarDatosPubExposiciones();
            sgwNucleo.Pagina.CerrarPopup(popPublicacionesTrabajos);
        }
        protected void btnCancelarPublicacionTrabajo_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popPublicacionesTrabajos);
        }

        #endregion


        #region ProductosProtegidos

        protected void actualizarDatosProdProtegidos()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            string FCondicion = " ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
            if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
                FCondicion += " AND ((FECHA_ALTA - 1) <= '" + Session["FECHA_PRESENTADA"].ToString() + "' OR FECHA_ALTA IS NULL)";
            grdProductosProtegidos.DataSource =
                FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_PRODUCTOS WHERE PROTEGIDO = 'S' AND " + FCondicion);
            grdProductosProtegidos.DataBind();
        }

        // Botones ABM Productos protegidos
        protected void btnAgregarProductoProtegido_Click(object sender, EventArgs e)
        {
            Session["OperacionDetalle"] = "1";
            edtProductosProtegidosFechaOtorgamiento.Text = "";
            edtProductosProtegidosDesarrollo.Text = "";
            edtProductosProtegidosFechaSolicitud.Text = "";
            edtProductosProtegidosTitular.Text = "";
            popProductosProtegidos.ShowOnPageLoad = true;
        }
        protected void btnModificarProductoProtegido_Click(object sender, EventArgs e)
        {
            if (grdProductosProtegidos.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Producto FProducto = new Producto();
            FGestor.ObtenerObjeto(FProducto, grdProductosProtegidos);
            Session["OperacionDetalle"] = "2";
            edtProductosProtegidosFechaOtorgamiento.Text = FProducto.LeerFecha("FECHA_OTORGAMIENTO");
            edtProductosProtegidosDesarrollo.Text = FProducto.PRODUCTO;
            edtProductosProtegidosFechaSolicitud.Text = FProducto.LeerFecha("FECHA_SOLICITUD");
            edtProductosProtegidosTitular.Text = FProducto.TITULAR;
            popProductosProtegidos.ShowOnPageLoad = true;
        }
        protected void btnEliminarProductoProtegido_Click(object sender, EventArgs e)
        {
            if (grdProductosProtegidos.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Producto FProducto = new Producto();
            FGestor.ObtenerObjeto(FProducto, grdProductosProtegidos);
            FGestor.EliminarObjeto(FProducto);
            actualizarDatosProdProtegidos();
        }

        // Botonera Popup Productos protegidos
        protected void btnGuardarProductoProtegido_Click(object sender, EventArgs e)
        {
            // Requeridos
            string FEstado = "";
            if (!sgwNucleo.Funciones.VerificarRequerido(edtProductosProtegidosFechaSolicitud.Text))
                FEstado = "la fecha de solicitud";
            else
                if (!sgwNucleo.Funciones.VerificarRequerido(edtProductosProtegidosDesarrollo.Text))
                    FEstado = "sl nombre del desarrollo";
                else
                    if (!sgwNucleo.Funciones.VerificarRequerido(edtProductosProtegidosTitular.Text))
                        FEstado = "el titular del desarrollo";
            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Producto FProducto = new Producto();
            if (Session["OperacionDetalle"].ToString() == "1")
            {
                FProducto.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
                FProducto.PROTEGIDO = true;
            }
            else
                FGestor.ObtenerObjeto(FProducto, grdProductosProtegidos);
            FProducto.GuardarFecha("FECHA_OTORGAMIENTO", edtProductosProtegidosFechaOtorgamiento.Text);
            FProducto.PRODUCTO = edtProductosProtegidosDesarrollo.Text;
            FProducto.GuardarFecha("FECHA_SOLICITUD", edtProductosProtegidosFechaSolicitud.Text);
            FProducto.TITULAR = edtProductosProtegidosTitular.Text;
            FGestor.GuardarObjeto(FProducto);
            actualizarDatosProdProtegidos();
            sgwNucleo.Pagina.CerrarPopup(popProductosProtegidos);
        }
        protected void btnCancelarProductoProtegido_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popProductosProtegidos);
        }

        #endregion


        #region ProductosNoProtegidos

        protected void actualizarDatosProdNoProtegidos()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            string FCondicion = " ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
            if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
                FCondicion += " AND ((FECHA_ALTA - 1) <= '" + Session["FECHA_PRESENTADA"].ToString() + "' OR FECHA_ALTA IS NULL)";
            grdProductosNoProtegidos.DataSource =
                FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_PRODUCTOS WHERE PROTEGIDO = 'N' AND " + FCondicion);
            grdProductosNoProtegidos.DataBind();
        }

        // Botones ABM Productos no protegidos
        protected void btnAgregarProductoNoProtegido_Click(object sender, EventArgs e)
        {
            Session["OperacionDetalle"] = "1";
            edtProductosNoProtegidosDescripcion.Text = "";
            edtProductosNoProtegidosProducto.Text = "";
            popProductosNoProtegidos.ShowOnPageLoad = true;
        }
        protected void btnModificarProductoNoProtegido_Click(object sender, EventArgs e)
        {
            if (grdProductosNoProtegidos.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Producto FProducto = new Producto();
            FGestor.ObtenerObjeto(FProducto, grdProductosNoProtegidos);
            Session["OperacionDetalle"] = "2";
            edtProductosNoProtegidosProducto.Text = FProducto.PRODUCTO;
            edtProductosNoProtegidosDescripcion.Text = FProducto.DESCRIPCION;
            popProductosNoProtegidos.ShowOnPageLoad = true;
        }
        protected void btnEliminarProductoNoProtegido_Click(object sender, EventArgs e)
        {
            if (grdProductosNoProtegidos.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Producto FProducto = new Producto();
            FGestor.ObtenerObjeto(FProducto, grdProductosNoProtegidos);
            FGestor.EliminarObjeto(FProducto);
            actualizarDatosProdNoProtegidos();
        }

        // Botonera Popup Productos no protegidos
        protected void btnGuardarProductoNoProtegido_Click(object sender, EventArgs e)
        {
            // Requeridos
            string FEstado = "";
            if (!sgwNucleo.Funciones.VerificarRequerido(edtProductosNoProtegidosProducto.Text))
                FEstado = "la denominación del producto";
            else
                if (!sgwNucleo.Funciones.VerificarRequerido(edtProductosNoProtegidosDescripcion.Text))
                    FEstado = "la descripción del producto";
            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Producto FProducto = new Producto();
            if (Session["OperacionDetalle"].ToString() == "1")
            {
                FProducto.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
                FProducto.PROTEGIDO = false;
            }
            else
                FGestor.ObtenerObjeto(FProducto, grdProductosNoProtegidos);
            FProducto.PRODUCTO = edtProductosNoProtegidosProducto.Text;
            FProducto.DESCRIPCION = edtProductosNoProtegidosDescripcion.Text;
            FGestor.GuardarObjeto(FProducto);
            actualizarDatosProdNoProtegidos();
            sgwNucleo.Pagina.CerrarPopup(popProductosNoProtegidos);
        }
        protected void btnCancelarProductoNoProtegido_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popProductosNoProtegidos);
        }

        #endregion

}
