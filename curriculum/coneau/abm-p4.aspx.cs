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
            DataSet FDatos;
            if (!Page.IsPostBack)
            {
                DataSet datos = FGestor.LeerSQL("SELECT ID_INSTITUCIONES, INSTITUCION FROM SIS_UNIVERSIDADES.INSTITUCIONES WHERE ID_ESTADOS_INSTITUCIONES = 1 ORDER BY INSTITUCION");
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargosDocentesActualInstitucion, datos, true, false);
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargosDocentesPasadoInstitucion, datos, true, false);
                datos = FGestor.LeerSQL("SELECT ID_TIPOS_CARGOS, TIPO_CARGO FROM SIS_DOCENTES.TIPOS_CARGOS ORDER BY ORDEN");
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargosDocentesActualCargo, datos, false, false);
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargosDocentesPasadoCargo, datos, false, false);
                datos = FGestor.LeerSQL("SELECT ID_TIPOS_DESIGNACIONES, TIPO_DESIGNACION FROM SIS_DOCENTES.TIPOS_DESIGNACIONES WHERE ID_TIPOS_DESIGNACIONES IN (2, 6, 7, 8, 9, 10)");
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargosDocentesActualDesignacion, datos, false, false);
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargosDocentesPasadoDesignacion, datos, false, false);
                datos = FGestor.LeerSQL("SELECT ID_DISCIPLINAS, DISCIPLINA FROM SIS_CONEAU.Q_DISCIPLINAS");
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargosDocentesActualDisciplina, datos, false, false);
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargosDocentesPasadoDisciplina, datos, false, false);
                datos = FGestor.LeerSQL("SELECT ID_TIPOS_DURACIONES_DED, TIPO_DURACION_DED FROM SIS_DOCENTES.Q_TIPOS_DURACIONES_DED");
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargosDocentesActualSemanasAnual, datos, false, false);
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargosDocentesPasadoSemanasAnual, datos, false, false);
                datos = FGestor.LeerSQL("SELECT ID_TIPOS_CARRERAS, TIPO_CARRERA FROM SIS_UNIVERSIDADES.Q_TIPOS_CARRERAS WHERE ID_TIPOS_CARRERAS BETWEEN 4 AND 6");
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargoActualCursoPosgradoTipo, datos, false, false);
                actualizarDatos();
            }
            actualizarDatosCargosActuales();
            actualizarDatosCargosPasados();
            if (Session["ID_CARGOS_DOCENTES"] != null)
            {
                actualizarDatosCargosCarrerasGrado();
                actualizarDatosCargosCarrerasPosgrado();
            }
        }


        #region DatosGenerales

        // Botones General
        protected bool guardar()
        {
            string FEstado = "";
            if ((!sgwNucleo.Funciones.VerificarRequeridoInt(edtTesinasTPActuales.Text)) ||
                (!sgwNucleo.Funciones.VerificarRequeridoInt(edtTesinasTPConcluidas.Text)) ||
                (!sgwNucleo.Funciones.VerificarRequeridoInt(edtTesisDoctoralesActuales.Text)) ||
                (!sgwNucleo.Funciones.VerificarRequeridoInt(edtTesisDoctoralesConcluidas.Text)) ||
                (!sgwNucleo.Funciones.VerificarRequeridoInt(edtTesisMaestriaActuales.Text)) ||
                (!sgwNucleo.Funciones.VerificarRequeridoInt(edtTesisMaestriaConcluidas.Text)))
            FEstado = "todos los valores requeridos o dejar los campos en cero (0)";
            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return false;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Docente FDocente = new Docente();
            FGestor.ObtenerObjeto(FDocente, int.Parse(Session["ID_DOCENTES"].ToString()));
            FDocente.TESINAS_TP_ACTUALES = int.Parse(edtTesinasTPActuales.Text);
            FDocente.TESINAS_TP_CONCLUIDAS = int.Parse(edtTesinasTPConcluidas.Text);
            FDocente.TESIS_DOCTS_ACTUALES = int.Parse(edtTesisDoctoralesActuales.Text);
            FDocente.TESIS_DOCTS_CONCLUIDAS = int.Parse(edtTesisDoctoralesConcluidas.Text);
            FDocente.TESIS_MASTER_ACTUALES = int.Parse(edtTesisMaestriaActuales.Text);
            FDocente.TESIS_MASTER_CONCLUIDAS = int.Parse(edtTesisMaestriaConcluidas.Text);
            FDocente.EXPERIENCIA_DISTANCIA = edtExperienciaEducacionDistancia.Text;
            return FGestor.GuardarObjeto(FDocente);
        }

        protected void btnGuardarC_Click(object sender, EventArgs e)
        {
            if (guardar())
                Response.Redirect("abm-p5.aspx");
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
            Docente FDocente = new Docente();
            FGestor.ObtenerObjeto(FDocente, int.Parse(Session["ID_DOCENTES"].ToString()));
            edtTesinasTPActuales.Text = FDocente.TESINAS_TP_ACTUALES.ToString();
            edtTesinasTPConcluidas.Text = FDocente.TESINAS_TP_CONCLUIDAS.ToString();
            edtTesisDoctoralesActuales.Text = FDocente.TESIS_DOCTS_ACTUALES.ToString();
            edtTesisDoctoralesConcluidas.Text = FDocente.TESIS_DOCTS_CONCLUIDAS.ToString();
            edtTesisMaestriaActuales.Text = FDocente.TESIS_MASTER_ACTUALES.ToString();
            edtTesisMaestriaConcluidas.Text = FDocente.TESIS_MASTER_CONCLUIDAS.ToString();
            edtExperienciaEducacionDistancia.Text = FDocente.EXPERIENCIA_DISTANCIA;
        }

        #endregion



        #region CargosActuales

        // Botones ABM Cargos Docentes Actual

        protected void actualizarDatosCargosActuales()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            string FCondicion = " ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
            if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
                FCondicion += " AND ((FECHA_ALTA - 1) <= '" + Session["FECHA_PRESENTADA"].ToString() + "' OR FECHA_ALTA IS NULL)";
            grdCargosDocentesActual.DataSource = FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_CARGOS_DOCENTES WHERE (FECHA_FINALIZACION IS NULL OR " +
            "FECHA_FINALIZACION > SYSDATE) AND " + FCondicion);
            grdCargosDocentesActual.DataBind();
        }

        protected void btnAgregarCargoDocenteActual_Click(object sender, EventArgs e)
        {
            Session["OperacionDetalle"] = "1";
            cmbCargosDocentesActualInstitucion.SelectedIndex = 0;
            cmbCargosDocentesActualInstitucion_SelectedIndexChanged(sender, e);
            cmbCargosDocentesActualUA.SelectedIndex = 0;
            cmbCargosDocentesActualUA_SelectedIndexChanged(sender, e);
            cmbCargosDocentesActualCargo.SelectedIndex = 0;
            cmbCargosDocentesActualCargo_SelectedIndexChanged(sender, e);
            cmbCargosDocentesActualDesignacion.SelectedIndex = 0;
            cmbCargosDocentesActualDisciplina.SelectedIndex = 0;
            cmbCargosDocentesActualDisciplina_SelectedIndexChanged(sender, e);
            cmbCargosDocentesActualSubdisciplina.SelectedIndex = 0;
            cmbCargosDocentesActualSubdisciplina_SelectedIndexChanged(sender, e);
            edtCargosDocentesActualDedicacionSemanal.Text = "0";
            edtCargosDocentesActualFechaFinalizacion.Text = "";
            edtCargosDocentesActualFechaInicio.Text = "";
            edtCargosDocentesActualOtroCargo.Text = "";
            edtCargosDocentesActualOtraDisciplina.Text = "";
            edtCargosDocentesActualOtraSubdisciplina.Text = "";
            cmbCargosDocentesActualSemanasAnual.SelectedIndex = 0;
            edtCargoActualOtraUA.Text = "";
            pnlCargosDocentesActualCursos.Visible = false;
            Session.Remove("ID_CARGOS_DOCENTES");
            actualizarDatosCargosCarrerasGrado();
            actualizarDatosCargosCarrerasPosgrado();
            btnGuardarCargoDocenteActual.Text = "Siquiente";
            popCargosDocentesActual.ShowOnPageLoad = true;
        }

        protected void btnModificarDocenteActual_Click(object sender, EventArgs e)
        {
            if (grdCargosDocentesActual.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoDocente FCargoDocente = new CargoDocente();
            FGestor.ObtenerObjeto(FCargoDocente, grdCargosDocentesActual);
            Session["OperacionDetalle"] = "2";
            if (FCargoDocente.INSTITUCION_UNIV)
            {
                cmbCargosDocentesActualInstitucion.SelectedValue = FCargoDocente.ID_INSTITUCIONES.ToString();
                edtCargoActualOtraInstitucion.Text = "";
            }
            else
            {
                cmbCargosDocentesActualInstitucion.SelectedValue = "-1";
                edtCargoActualOtraInstitucion.Text = FCargoDocente.OTRA_INSTITUCION;
            }
            cmbCargosDocentesActualInstitucion_SelectedIndexChanged(sender, e);
            if (FCargoDocente.UA_UNIV)
            {
                cmbCargosDocentesActualUA.SelectedValue = FCargoDocente.ID_UNIDADES_ACADEMICAS.ToString();
                edtCargoActualOtraUA.Text = "";
            }
            else
            {
                cmbCargosDocentesActualUA.SelectedValue = "-1";
                edtCargoActualOtraUA.Text = FCargoDocente.OTRA_UNIDAD_ACADEMICA;
            }
            cmbCargosDocentesActualUA_SelectedIndexChanged(sender, e);
            cmbCargosDocentesActualCargo.SelectedValue = FCargoDocente.ID_TIPOS_CARGOS.ToString();
            cmbCargosDocentesActualCargo_SelectedIndexChanged(sender, e);
            edtCargosDocentesActualOtroCargo.Text = FCargoDocente.OTRO_TIPO_CARGO;
            if (cmbCargosDocentesActualDesignacion.Items.FindByValue(FCargoDocente.ID_TIPOS_DESIGNACIONES.ToString()) != null)
                cmbCargosDocentesActualDesignacion.SelectedValue = FCargoDocente.ID_TIPOS_DESIGNACIONES.ToString();
            DataSet FData = FGestor.LeerSQL("SELECT ID_DISCIPLINAS FROM SIS_CONEAU.SUBDISCIPLINAS " +
                "WHERE ID_SUBDISCIPLINAS = " + FCargoDocente.ID_SUBDISCIPLINAS.ToString());
            if (FData.Tables[0].Rows.Count < 1)
                cmbCargosDocentesActualDisciplina.SelectedIndex = 0;
            else
                cmbCargosDocentesActualDisciplina.SelectedValue = FData.Tables[0].Rows[0].ItemArray[0].ToString();
            cmbCargosDocentesActualDisciplina_SelectedIndexChanged(null, null);
            cmbCargosDocentesActualSubdisciplina.SelectedValue = FCargoDocente.ID_SUBDISCIPLINAS.ToString();
            cmbCargosDocentesActualSubdisciplina_SelectedIndexChanged(sender, e);
            if (pnlCargosDocentesActualOtraDisciplina.Visible)
                edtCargosDocentesActualOtraDisciplina.Text = FCargoDocente.OTRA_DISCIPLINA;
            else
                edtCargosDocentesActualOtraDisciplina.Text = "";
            if (pnlCargosDocentesActualOtraSubdisciplina.Visible)
                edtCargosDocentesActualOtraSubdisciplina.Text = FCargoDocente.OTRA_SUBDISCIPLINA;
            else
                edtCargosDocentesActualOtraSubdisciplina.Text = "";
            edtCargosDocentesActualFechaFinalizacion.Text = FCargoDocente.LeerFecha("FECHA_FINALIZACION");
            edtCargosDocentesActualFechaInicio.Text = FCargoDocente.LeerFecha("FECHA_INICIO");
            edtCargosDocentesActualDedicacionSemanal.Text = FCargoDocente.DEDICACION_SEMANAL.ToString();
            cmbCargosDocentesActualSemanasAnual.Text = FCargoDocente.ID_TIPOS_DURACIONES_DED.ToString();
            Session["ID_CARGOS_DOCENTES"] = FCargoDocente.ID;
            pnlCargosDocentesActualCursos.Visible = true;
            actualizarDatosCargosCarrerasGrado();
            actualizarDatosCargosCarrerasPosgrado();
            btnGuardarCargoDocenteActual.Text = "Aceptar";
            popCargosDocentesActual.ShowOnPageLoad = true;
        }

        protected void btnEliminarDocenteActual_Click(object sender, EventArgs e)
        {
            if (grdCargosDocentesActual.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoDocente FCargoDocente = new CargoDocente();
            FGestor.ObtenerObjeto(FCargoDocente, grdCargosDocentesActual);
            FGestor.EliminarObjeto(FCargoDocente);
            actualizarDatosCargosActuales();
        }

        protected void cmbCargosDocentesActualInstitucion_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlCargoActualOtraInstitucion.Visible = cmbCargosDocentesActualInstitucion.SelectedValue == "-1";
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            DataSet FDatos = FGestor.LeerSQL("SELECT ID_UNIDADES_ACADEMICAS, UNIDAD_ACADEMICA FROM SIS_UNIVERSIDADES.UNIDADES_ACADEMICAS " +
                "WHERE ACTIVO = 'S' AND ID_INSTITUCIONES = " + cmbCargosDocentesActualInstitucion.SelectedValue);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargosDocentesActualUA, FDatos, true, false);
            cmbCargosDocentesActualUA_SelectedIndexChanged(sender, e);
        }

        protected void cmbCargosDocentesActualUA_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlCargoActualOtraUA.Visible = cmbCargosDocentesActualUA.SelectedValue == "-1";
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            DataSet FDatos = FGestor.LeerSQL("SELECT ID_CARRERAS, CARRERA FROM SIS_UNIVERSIDADES.Q_CARRERAS " +
                "WHERE ACTIVO = 'S' AND ID_TIPOS_CARRERAS = 3 AND ID_UNIDADES_ACADEMICAS = " + cmbCargosDocentesActualUA.SelectedValue);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargoActualCursoGradoCarrera, FDatos, true, false);
            FDatos = FGestor.LeerSQL("SELECT ID_CARRERAS, CARRERA FROM SIS_UNIVERSIDADES.Q_CARRERAS " +
                "WHERE ACTIVO = 'S' AND ID_TIPOS_CARRERAS BETWEEN 4 AND 6 AND ID_UNIDADES_ACADEMICAS = " + cmbCargosDocentesActualUA.SelectedValue);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargoActualCursoPosgradoCarrera, FDatos, true, false);
        }

        protected void cmbCargosDocentesActualDisciplina_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlCargosDocentesActualOtraDisciplina.Visible = cmbCargosDocentesActualDisciplina.SelectedValue == "1000";
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            DataSet FDatos = FGestor.LeerSQL("SELECT ID_SUBDISCIPLINAS, SUBDISCIPLINA FROM SIS_CONEAU.Q_SUBDISCIPLINAS WHERE ID_DISCIPLINAS = " +
                cmbCargosDocentesActualDisciplina.SelectedValue);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargosDocentesActualSubdisciplina, FDatos, false, false);
            cmbCargosDocentesActualSubdisciplina_SelectedIndexChanged(sender, e);

        }

        protected void cmbCargosDocentesActualCargo_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlCargoActualOtroCargo.Visible = cmbCargosDocentesActualCargo.SelectedValue == "1000";
        }

        protected void cmbCargosDocentesActualSubdisciplina_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbCargosDocentesActualSubdisciplina.SelectedItem == null) return;
            pnlCargosDocentesActualOtraSubdisciplina.Visible = cmbCargosDocentesActualSubdisciplina.SelectedItem.Text == "(Otra opción...)";
        }

        // Botones Popup Cargos Docentes Actual
        protected void btnGuardarCargoDocenteActual_Click(object sender, EventArgs e)
        {
            // Requeridos
            string FEstado = "";
            if ((pnlCargoActualOtraInstitucion.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCargoActualOtraInstitucion.Text)))
                FEstado = "la institución";
            else
                if ((pnlCargoActualOtraUA.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCargoActualOtraUA.Text)))
                    FEstado = "la unidad académica";
                else
                    if ((pnlCargoActualOtroCargo.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCargosDocentesActualOtroCargo.Text)))
                        FEstado = "el tipo de cargo";
                    else
                        if (!sgwNucleo.Funciones.VerificarRequerido(edtCargosDocentesActualFechaInicio.Text))
                            FEstado = "la fecha de inicio";
                        else
                            if (!sgwNucleo.Funciones.VerificarRequeridoInt(edtCargosDocentesActualDedicacionSemanal.Text))
                                FEstado = "la dedicación semanal en horas reloj";
                            else
                                if ((pnlCargosDocentesActualOtraDisciplina.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCargosDocentesActualOtraDisciplina.Text)))
                                    FEstado = "la disciplina";
                                else
                                    if ((pnlCargosDocentesActualOtraSubdisciplina.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCargosDocentesActualOtraSubdisciplina.Text)))
                                        FEstado = "la subdisciplina";
                                    else
                                        if ((int.Parse(edtCargosDocentesActualDedicacionSemanal.Text) < 1) || (int.Parse(edtCargosDocentesActualDedicacionSemanal.Text) > 60))
                                        {
                                            sgwNucleo.Pagina.MostrarEstado("La dedicación semanal ingresada no es válida.", 1);
                                            return;
                                        }
            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoDocente FCargoDocente = new CargoDocente();
            if (Session["OperacionDetalle"].ToString() == "1")
                FCargoDocente.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
            else
            {
               
                FGestor.ObtenerObjeto(FCargoDocente, int.Parse(Session["ID_CARGOS_DOCENTES"].ToString()));
            }
            if (cmbCargosDocentesActualInstitucion.SelectedValue != "-1")
            {
                FCargoDocente.INSTITUCION_UNIV = true;
                FCargoDocente.ID_INSTITUCIONES = int.Parse(cmbCargosDocentesActualInstitucion.SelectedValue);
                FCargoDocente.OTRA_INSTITUCION = "";
            }
            else
            {
                FCargoDocente.INSTITUCION_UNIV = false;
                FCargoDocente.ID_INSTITUCIONES = 0;
                FCargoDocente.OTRA_INSTITUCION = edtCargoActualOtraInstitucion.Text;
            }
            if (cmbCargosDocentesActualUA.SelectedValue != "-1")
            {
                FCargoDocente.UA_UNIV = true;
                FCargoDocente.ID_UNIDADES_ACADEMICAS = int.Parse(cmbCargosDocentesActualUA.SelectedValue);
                FCargoDocente.OTRA_UNIDAD_ACADEMICA = "";
            }
            else
            {
                FCargoDocente.UA_UNIV = false;
                FCargoDocente.ID_UNIDADES_ACADEMICAS = 0;
                FCargoDocente.OTRA_UNIDAD_ACADEMICA = edtCargoActualOtraUA.Text;
            }
            FCargoDocente.ID_TIPOS_CARGOS = int.Parse(cmbCargosDocentesActualCargo.SelectedValue);
            if (cmbCargosDocentesActualCargo.SelectedValue == "1000")
                FCargoDocente.OTRO_TIPO_CARGO = edtCargosDocentesActualOtroCargo.Text;
            else
                FCargoDocente.OTRO_TIPO_CARGO = "";
            FCargoDocente.ID_TIPOS_DESIGNACIONES = int.Parse(cmbCargosDocentesActualDesignacion.SelectedValue);
            FCargoDocente.ID_SUBDISCIPLINAS = int.Parse(cmbCargosDocentesActualSubdisciplina.SelectedValue);
            if (pnlCargosDocentesActualOtraDisciplina.Visible)
                FCargoDocente.OTRA_DISCIPLINA = edtCargosDocentesActualOtraDisciplina.Text;
            else
                FCargoDocente.OTRA_DISCIPLINA = "";
            if (pnlCargosDocentesActualOtraSubdisciplina.Visible)
                FCargoDocente.OTRA_SUBDISCIPLINA = edtCargosDocentesActualOtraSubdisciplina.Text;
            else
                FCargoDocente.OTRA_SUBDISCIPLINA = "";
            FCargoDocente.DEDICACION_SEMANAL = int.Parse(edtCargosDocentesActualDedicacionSemanal.Text);
            FCargoDocente.ID_TIPOS_DURACIONES_DED = int.Parse(cmbCargosDocentesActualSemanasAnual.Text);
            FCargoDocente.GuardarFecha("FECHA_INICIO", edtCargosDocentesActualFechaInicio.Text);
            FCargoDocente.GuardarFecha("FECHA_FINALIZACION", edtCargosDocentesActualFechaFinalizacion.Text);
            FGestor.GuardarObjeto(FCargoDocente, true);
            Session["ID_UNIDADES_ACADEMICAS"] = cmbCargosDocentesActualUA.SelectedValue;

            if (Session["OperacionDetalle"].ToString() == "1")
            {
                pnlCargosDocentesActualCursos.Visible = true;
                Session["OperacionDetalle"] = "2";
                btnGuardarCargoDocenteActual.Text = "Aceptar";
            }
            else
            {
                actualizarDatosCargosActuales();
                actualizarDatosCargosPasados();
                sgwNucleo.Pagina.CerrarPopup(popCargosDocentesActual);
                btnGuardarCargoDocenteActual.Text = "Siquiente";
            }
        }
        protected void btnCancelarCargoDocenteActual_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popCargosDocentesActual);
        }

        #endregion



        #region CargosPasados

        // Botones ABM Cargos Docentes Pasado

        protected void actualizarDatosCargosPasados()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            string FCondicion = " ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
            if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
                FCondicion += " AND ((FECHA_ALTA - 1) <= '" + Session["FECHA_PRESENTADA"].ToString() + "' OR FECHA_ALTA IS NULL)";
            grdCargosDocentesPasado.DataSource = FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_CARGOS_DOCENTES WHERE (FECHA_FINALIZACION IS NOT NULL AND " +
            "FECHA_FINALIZACION <= SYSDATE) AND " + FCondicion);
            grdCargosDocentesPasado.DataBind();
        }

        protected void btnAgregarCargoDocentePasado_Click(object sender, EventArgs e)
        {
            Session["OperacionDetalle"] = "1";
            cmbCargosDocentesPasadoInstitucion.SelectedIndex = 0;
            cmbCargosDocentesPasadoInstitucion_SelectedIndexChanged(sender, e);
            cmbCargosDocentesPasadoUA.SelectedIndex = 0;
            cmbCargosDocentesPasadoUA_SelectedIndexChanged(sender, e);
            cmbCargosDocentesPasadoCargo.SelectedIndex = 0;
            cmbCargosDocentesPasadoCargo_SelectedIndexChanged(sender, e);
            cmbCargosDocentesPasadoDesignacion.SelectedIndex = 0;
            cmbCargosDocentesPasadoDisciplina.SelectedIndex = 0;
            cmbCargosDocentesPasadoDisciplina_SelectedIndexChanged(sender, e);
            cmbCargosDocentesPasadoSubdisciplina.SelectedIndex = 0;
            cmbCargosDocentesPasadoSubdisciplina_SelectedIndexChanged(sender, e);
            edtCargosDocentesPasadoDedicacionSemanal.Text = "0";
            edtCargosDocentesPasadoFechaFinalizacion.Text = "";
            edtCargosDocentesPasadoFechaInicio.Text = "";
            edtCargosDocentesPasadoOtroCargo.Text = "";
            edtCargosDocentesPasadoOtraDisciplina.Text = "";
            edtCargosDocentesPasadoOtraSubdisciplina.Text = "";
            cmbCargosDocentesPasadoSemanasAnual.SelectedIndex = 0;
            edtCargoPasadoOtraUA.Text = "";
            popCargosDocentesPasado.ShowOnPageLoad = true;
        }

        protected void btnModificarCargoDocentePasado_Click(object sender, EventArgs e)
        {
            if (grdCargosDocentesPasado.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoDocente FCargoDocente = new CargoDocente();
            FGestor.ObtenerObjeto(FCargoDocente, grdCargosDocentesPasado);
            Session["OperacionDetalle"] = "2";
            if (FCargoDocente.INSTITUCION_UNIV)
            {
                cmbCargosDocentesPasadoInstitucion.SelectedValue = FCargoDocente.ID_INSTITUCIONES.ToString();
                edtCargoPasadoOtraInstitucion.Text = "";
            }
            else
            {
                cmbCargosDocentesPasadoInstitucion.SelectedValue = "-1";
                edtCargoPasadoOtraInstitucion.Text = FCargoDocente.OTRA_INSTITUCION;
            }
            cmbCargosDocentesPasadoInstitucion_SelectedIndexChanged(sender, e);
            if (FCargoDocente.UA_UNIV)
            {
                cmbCargosDocentesPasadoUA.SelectedValue = FCargoDocente.ID_UNIDADES_ACADEMICAS.ToString();
                edtCargoPasadoOtraUA.Text = "";
            }
            else
            {
                cmbCargosDocentesPasadoUA.SelectedValue = "-1";
                edtCargoPasadoOtraUA.Text = FCargoDocente.OTRA_UNIDAD_ACADEMICA;
            }
            cmbCargosDocentesPasadoUA_SelectedIndexChanged(sender, e);
            cmbCargosDocentesPasadoCargo.SelectedValue = FCargoDocente.ID_TIPOS_CARGOS.ToString();
            cmbCargosDocentesPasadoCargo_SelectedIndexChanged(sender, e);
            edtCargosDocentesPasadoOtroCargo.Text = FCargoDocente.OTRO_TIPO_CARGO;
            if (cmbCargosDocentesPasadoDesignacion.Items.FindByValue(FCargoDocente.ID_TIPOS_DESIGNACIONES.ToString()) != null)
                cmbCargosDocentesPasadoDesignacion.SelectedValue = FCargoDocente.ID_TIPOS_DESIGNACIONES.ToString();
            DataSet FData = FGestor.LeerSQL("SELECT ID_DISCIPLINAS FROM SIS_CONEAU.SUBDISCIPLINAS " +
                "WHERE ID_SUBDISCIPLINAS = " + FCargoDocente.ID_SUBDISCIPLINAS.ToString());
            if (FData.Tables[0].Rows.Count < 1)
                cmbCargosDocentesPasadoDisciplina.SelectedIndex = 0;
            else
                cmbCargosDocentesPasadoDisciplina.SelectedValue = FData.Tables[0].Rows[0].ItemArray[0].ToString();
            cmbCargosDocentesPasadoDisciplina_SelectedIndexChanged(null, null);
            cmbCargosDocentesPasadoSubdisciplina.SelectedValue = FCargoDocente.ID_SUBDISCIPLINAS.ToString();
            cmbCargosDocentesPasadoSubdisciplina_SelectedIndexChanged(sender, e);
            if (pnlCargosDocentesPasadoOtraDisciplina.Visible)
                edtCargosDocentesPasadoOtraDisciplina.Text = FCargoDocente.OTRA_DISCIPLINA;
            else
                edtCargosDocentesPasadoOtraDisciplina.Text = "";
            if (pnlCargosDocentesPasadoOtraSubdisciplina.Visible)
                edtCargosDocentesPasadoOtraSubdisciplina.Text = FCargoDocente.OTRA_SUBDISCIPLINA;
            else
                edtCargosDocentesPasadoOtraSubdisciplina.Text = "";
            edtCargosDocentesPasadoFechaFinalizacion.Text = FCargoDocente.LeerFecha("FECHA_FINALIZACION");
            edtCargosDocentesPasadoFechaInicio.Text = FCargoDocente.LeerFecha("FECHA_INICIO");
            edtCargosDocentesPasadoDedicacionSemanal.Text = FCargoDocente.DEDICACION_SEMANAL.ToString();
            cmbCargosDocentesPasadoSemanasAnual.Text = FCargoDocente.ID_TIPOS_DURACIONES_DED.ToString();
            popCargosDocentesPasado.ShowOnPageLoad = true;
        }

        protected void btnEliminarCargoDocentePasado_Click(object sender, EventArgs e)
        {
            if (grdCargosDocentesPasado.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoDocente FCargoDocente = new CargoDocente();
            FGestor.ObtenerObjeto(FCargoDocente, grdCargosDocentesPasado);
            FGestor.EliminarObjeto(FCargoDocente);
            actualizarDatosCargosPasados();
        }

        protected void cmbCargosDocentesPasadoInstitucion_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlCargoPasadoOtraInstitucion.Visible = cmbCargosDocentesPasadoInstitucion.SelectedValue == "-1";
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            DataSet FDatos = FGestor.LeerSQL("SELECT ID_UNIDADES_ACADEMICAS, UNIDAD_ACADEMICA FROM SIS_UNIVERSIDADES.UNIDADES_ACADEMICAS " +
                "WHERE ACTIVO = 'S' AND ID_INSTITUCIONES = " + cmbCargosDocentesPasadoInstitucion.SelectedValue);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargosDocentesPasadoUA, FDatos, true, false);
            cmbCargosDocentesPasadoUA_SelectedIndexChanged(sender, e);
        }

        protected void cmbCargosDocentesPasadoUA_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlCargoPasadoOtraUA.Visible = cmbCargosDocentesPasadoUA.SelectedValue == "-1";
        }

        protected void cmbCargosDocentesPasadoDisciplina_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlCargosDocentesPasadoOtraDisciplina.Visible = cmbCargosDocentesPasadoDisciplina.SelectedValue == "1000";
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            DataSet FDatos = FGestor.LeerSQL("SELECT ID_SUBDISCIPLINAS, SUBDISCIPLINA FROM SIS_CONEAU.Q_SUBDISCIPLINAS WHERE ID_DISCIPLINAS = " +
                cmbCargosDocentesPasadoDisciplina.SelectedValue);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargosDocentesPasadoSubdisciplina, FDatos, false, false);
            cmbCargosDocentesPasadoSubdisciplina_SelectedIndexChanged(sender, e);
        }

        protected void cmbCargosDocentesPasadoCargo_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlCargoPasadoOtroCargo.Visible = cmbCargosDocentesPasadoCargo.SelectedValue == "1000";
        }

        protected void cmbCargosDocentesPasadoSubdisciplina_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbCargosDocentesPasadoSubdisciplina.SelectedItem == null) return;
            pnlCargosDocentesPasadoOtraSubdisciplina.Visible = cmbCargosDocentesPasadoSubdisciplina.SelectedItem.Text == "(Otra opción...)";
        }

        // Botones Popup Cargos Docentes Pasado
        protected void btnGuardarCargoDocentePasado_Click(object sender, EventArgs e)
        {
            // Requeridos
            string FEstado = "";
            if ((pnlCargoPasadoOtraInstitucion.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCargoPasadoOtraInstitucion.Text)))
                FEstado = "la institución";
            else
                if ((pnlCargoPasadoOtraUA.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCargoPasadoOtraUA.Text)))
                    FEstado = "la unidad académica";
                else
                    if ((pnlCargoPasadoOtroCargo.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCargosDocentesPasadoOtroCargo.Text)))
                        FEstado = "el tipo de cargo";
                    else
                        if (!sgwNucleo.Funciones.VerificarRequerido(edtCargosDocentesPasadoFechaInicio.Text))
                            FEstado = "la fecha de inicio";
                        else
                            if ((pnlCargosDocentesPasadoOtraDisciplina.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCargosDocentesPasadoOtraDisciplina.Text)))
                                FEstado = "la disciplina";
                            else
                                if ((pnlCargosDocentesPasadoOtraSubdisciplina.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCargosDocentesPasadoOtraSubdisciplina.Text)))
                                    FEstado = "la subdisciplina";

            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoDocente FCargoDocente = new CargoDocente();
            if (Session["OperacionDetalle"].ToString() == "1")
                FCargoDocente.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
            else
                FGestor.ObtenerObjeto(FCargoDocente, grdCargosDocentesPasado);
            if (cmbCargosDocentesPasadoInstitucion.SelectedValue != "-1")
            {
                FCargoDocente.INSTITUCION_UNIV = true;
                FCargoDocente.ID_INSTITUCIONES = int.Parse(cmbCargosDocentesPasadoInstitucion.SelectedValue);
                FCargoDocente.OTRA_INSTITUCION = "";
            }
            else
            {
                FCargoDocente.INSTITUCION_UNIV = false;
                FCargoDocente.ID_INSTITUCIONES = 0;
                FCargoDocente.OTRA_INSTITUCION = edtCargoPasadoOtraInstitucion.Text;
            }
            if (cmbCargosDocentesPasadoUA.SelectedValue != "-1")
            {
                FCargoDocente.UA_UNIV = true;
                FCargoDocente.ID_UNIDADES_ACADEMICAS = int.Parse(cmbCargosDocentesPasadoUA.SelectedValue);
                FCargoDocente.OTRA_UNIDAD_ACADEMICA = "";
            }
            else
            {
                FCargoDocente.UA_UNIV = false;
                FCargoDocente.ID_UNIDADES_ACADEMICAS = 0;
                FCargoDocente.OTRA_UNIDAD_ACADEMICA = edtCargoPasadoOtraUA.Text;
            }
            FCargoDocente.ID_TIPOS_CARGOS = int.Parse(cmbCargosDocentesPasadoCargo.SelectedValue);
            if (cmbCargosDocentesPasadoCargo.SelectedValue == "1000")
                FCargoDocente.OTRO_TIPO_CARGO = edtCargosDocentesPasadoOtroCargo.Text;
            else
                FCargoDocente.OTRO_TIPO_CARGO = "";
            FCargoDocente.ID_TIPOS_DESIGNACIONES = int.Parse(cmbCargosDocentesPasadoDesignacion.SelectedValue);
            FCargoDocente.ID_SUBDISCIPLINAS = int.Parse(cmbCargosDocentesPasadoSubdisciplina.SelectedValue);
            if (pnlCargosDocentesPasadoOtraDisciplina.Visible)
                FCargoDocente.OTRA_DISCIPLINA = edtCargosDocentesPasadoOtraDisciplina.Text;
            else
                FCargoDocente.OTRA_DISCIPLINA = "";
            if (pnlCargosDocentesPasadoOtraSubdisciplina.Visible)
                FCargoDocente.OTRA_SUBDISCIPLINA = edtCargosDocentesPasadoOtraSubdisciplina.Text;
            else
                FCargoDocente.OTRA_SUBDISCIPLINA = "";
            FCargoDocente.DEDICACION_SEMANAL = int.Parse(edtCargosDocentesPasadoDedicacionSemanal.Text);
            FCargoDocente.ID_TIPOS_DURACIONES_DED = int.Parse(cmbCargosDocentesPasadoSemanasAnual.Text);
            FCargoDocente.GuardarFecha("FECHA_INICIO", edtCargosDocentesPasadoFechaInicio.Text);
            FCargoDocente.GuardarFecha("FECHA_FINALIZACION", edtCargosDocentesPasadoFechaFinalizacion.Text);
            FGestor.GuardarObjeto(FCargoDocente, true);
            actualizarDatosCargosActuales();
            actualizarDatosCargosPasados();
            sgwNucleo.Pagina.CerrarPopup(popCargosDocentesPasado);
        }
        protected void btnCancelarCargoDocentePasado_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popCargosDocentesPasado);
        }

        #endregion

       

        #region CargosActualesCursosGrado

        protected void actualizarDatosCargosCarrerasGrado()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            if (Session["ID_CARGOS_DOCENTES"] == null)
                grdCursosGrado.DataSource = null;
            else
                grdCursosGrado.DataSource = FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_CARGOS_ACT_CURRIC WHERE ID_TIPOS_CARRERAS = 3 AND " +
                "ID_CARGOS_DOCENTES = " + Session["ID_CARGOS_DOCENTES"]);
            grdCursosGrado.DataBind();
        }

        // Botones Popup Cargos Docentes Actual

        protected void btnAgregarCursosGrado_Click(object sender, EventArgs e)
        {
            Session["OperacionDetalle2"] = "1";
            cmbCargoActualCursoGradoCarrera.SelectedIndex = 0;
            cmbCargoActualCursoGradoCarrera_SelectedIndexChanged(sender, e);
            edtCargoActualCursoGradoActividadCurricular.Text = "";
            edtCargoActualCursoGradoAnioInicio.Text = "";
            edtCargoActualCursoGradoOtraCarrera.Text = "";
            edtCargoActualCursoGradoPlanEstudios.Text = "";
            popCargoActualCursoGrado.ShowOnPageLoad = true;
        }

        protected void btnModificarCursosGrado_Click(object sender, EventArgs e)
        {
            if (grdCursosGrado.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoActCurric FCargoActCurric = new CargoActCurric();
            FGestor.ObtenerObjeto(FCargoActCurric, grdCursosGrado);
            Session["OperacionDetalle2"] = "2";
            if (FCargoActCurric.CARRERA_UNIV)
            {
                cmbCargoActualCursoGradoCarrera.SelectedValue = FCargoActCurric.ID_CARRERAS.ToString();
                edtCargoActualCursoGradoOtraCarrera.Text = "";
            }
            else
            {
                cmbCargoActualCursoGradoCarrera.SelectedValue = "-1";
                edtCargoActualCursoGradoOtraCarrera.Text = FCargoActCurric.OTRA_CARRERA;
            }
            cmbCargoActualCursoGradoCarrera_SelectedIndexChanged(sender, e);
            edtCargoActualCursoGradoActividadCurricular.Text = FCargoActCurric.ACTIVIDAD_CURRICULAR;
            edtCargoActualCursoGradoAnioInicio.Text = FCargoActCurric.ANIO_INICIO.ToString();
            edtCargoActualCursoGradoPlanEstudios.Text = FCargoActCurric.PLAN_ESTUDIOS.ToString();
            popCargoActualCursoGrado.ShowOnPageLoad = true;
        }

        protected void btnEliminarCursosGrado_Click(object sender, EventArgs e)
        {
            if (grdCursosGrado.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoActCurric FCargoActCurric = new CargoActCurric();
            FGestor.ObtenerObjeto(FCargoActCurric, grdCursosGrado);
            FGestor.EliminarObjeto(FCargoActCurric);
            actualizarDatosCargosCarrerasGrado();
        }

        protected void cmbCargoActualCursoGradoCarrera_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlCargoActualCursoGradoOtraCarrera.Visible = cmbCargoActualCursoGradoCarrera.SelectedValue == "-1";
        }

        protected void btnGuardarCargoActualCursoGrado_Click(object sender, EventArgs e)
        {
            // Requeridos
            string FEstado = "";
            if ((pnlCargoActualCursoGradoOtraCarrera.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCargoActualCursoGradoOtraCarrera.Text)))
                FEstado = "la carrera";
            else
                if (!sgwNucleo.Funciones.VerificarRequerido(edtCargoActualCursoGradoActividadCurricular.Text))
                    FEstado = "la(s) actividad(es) curricular(es)";
                else
                    if ((pnlCargoActualOtroCargo.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCargosDocentesActualOtroCargo.Text)))
                        FEstado = "el tipo de cargo";
                    else
                        if (!sgwNucleo.Funciones.VerificarRequeridoInt(edtCargoActualCursoGradoAnioInicio.Text))
                            FEstado = "el año de inicio";
                        else
                            if (!sgwNucleo.Funciones.VerificarRequeridoInt(edtCargoActualCursoGradoPlanEstudios.Text))
                                FEstado = "el plan de estudios";
            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoActCurric FCargoActCurric = new CargoActCurric();
            if (Session["OperacionDetalle2"].ToString() == "1")
            {
                FCargoActCurric.ID_CARGOS_DOCENTES = int.Parse(Session["ID_CARGOS_DOCENTES"].ToString());
                FCargoActCurric.ID_TIPOS_CARRERAS = 3;
            }
            else
                FGestor.ObtenerObjeto(FCargoActCurric, grdCursosGrado);
            if (cmbCargoActualCursoGradoCarrera.SelectedValue != "-1")
            {
                FCargoActCurric.CARRERA_UNIV = true;
                FCargoActCurric.ID_CARRERAS = int.Parse(cmbCargoActualCursoGradoCarrera.SelectedValue);
                FCargoActCurric.OTRA_CARRERA = "";
            }
            else
            {
                FCargoActCurric.CARRERA_UNIV = false;
                FCargoActCurric.ID_CARRERAS = 0;
                FCargoActCurric.OTRA_CARRERA = edtCargoActualCursoGradoOtraCarrera.Text;
            }
            FCargoActCurric.ACTIVIDAD_CURRICULAR = edtCargoActualCursoGradoActividadCurricular.Text;
            FCargoActCurric.ANIO_INICIO = int.Parse(edtCargoActualCursoGradoAnioInicio.Text);
            FCargoActCurric.PLAN_ESTUDIOS = int.Parse(edtCargoActualCursoGradoPlanEstudios.Text);
            FGestor.GuardarObjeto(FCargoActCurric);
            actualizarDatosCargosCarrerasGrado();
            sgwNucleo.Pagina.CerrarPopup(popCargoActualCursoGrado);
        }

        protected void btnCancelarCargoActualCursoGrado_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popCargoActualCursoGrado);
        }

        #endregion
        


        #region CargosActualesCursosPosgado

        protected void actualizarDatosCargosCarrerasPosgrado()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            if (Session["ID_CARGOS_DOCENTES"] == null)
                grdCursosPosgrado.DataSource = null;
            else
                grdCursosPosgrado.DataSource = FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_CARGOS_ACT_CURRIC WHERE ID_TIPOS_CARRERAS BETWEEN 4 AND 6 AND " +
                "ID_CARGOS_DOCENTES = " + Session["ID_CARGOS_DOCENTES"]);
            grdCursosPosgrado.DataBind();
        }

        protected void btnAgregarCursosPosgrado_Click(object sender, EventArgs e)
        {
            Session["OperacionDetalle3"] = "1";
            cmbCargoActualCursoPosgradoCarrera.SelectedIndex = 0;
            cmbCargoActualCursoPosgradoCarrera_SelectedIndexChanged(sender, e);
            cmbCargoActualCursoPosgradoTipo.SelectedIndex = 0;
            edtCargoActualCursoPosgradoActividadCurricular.Text = "";
            edtCargoActualCursoPosgradoAnioInicio.Text = "";
            edtCargoActualCursoPosgradoOtraCarrera.Text = "";
            edtCargoActualCursoPosgradoPlanEstudios.Text = "";
            popCargoActualCursoPosgrado.ShowOnPageLoad = true;
        }

        protected void btnModificarCursosPosgrado_Click(object sender, EventArgs e)
        {
            if (grdCursosPosgrado.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoActCurric FCargoActCurric = new CargoActCurric();
            FGestor.ObtenerObjeto(FCargoActCurric, grdCursosPosgrado);
            Session["OperacionDetalle3"] = "2";
            if (FCargoActCurric.CARRERA_UNIV)
            {
                cmbCargoActualCursoPosgradoCarrera.SelectedValue = FCargoActCurric.ID_CARRERAS.ToString();
                edtCargoActualCursoPosgradoOtraCarrera.Text = "";
            }
            else
            {
                cmbCargoActualCursoPosgradoCarrera.SelectedValue = "-1";
                edtCargoActualCursoPosgradoOtraCarrera.Text = FCargoActCurric.OTRA_CARRERA;
            }
            cmbCargoActualCursoPosgradoCarrera_SelectedIndexChanged(sender, e);
            edtCargoActualCursoPosgradoActividadCurricular.Text = FCargoActCurric.ACTIVIDAD_CURRICULAR;
            cmbCargoActualCursoPosgradoTipo.SelectedValue = FCargoActCurric.ID_TIPOS_CARRERAS.ToString();
            edtCargoActualCursoPosgradoAnioInicio.Text = FCargoActCurric.ANIO_INICIO.ToString();
            edtCargoActualCursoPosgradoPlanEstudios.Text = FCargoActCurric.PLAN_ESTUDIOS.ToString();
            popCargoActualCursoPosgrado.ShowOnPageLoad = true;
        }

        protected void btnEliminarCursosPosgrado_Click(object sender, EventArgs e)
        {
            if (grdCursosPosgrado.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoActCurric FCargoActCurric = new CargoActCurric();
            FGestor.ObtenerObjeto(FCargoActCurric, grdCursosPosgrado);
            FGestor.EliminarObjeto(FCargoActCurric);
            actualizarDatosCargosCarrerasPosgrado();
        }

        protected void cmbCargoActualCursoPosgradoCarrera_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlCargoActualCursoPosgradoOtraCarrera.Visible = cmbCargoActualCursoPosgradoCarrera.SelectedValue == "-1";
        }

        protected void btnGuardarCargoActualCursoPosgrado_Click(object sender, EventArgs e)
        {
            // Requeridos
            string FEstado = "";
            if ((pnlCargoActualCursoPosgradoOtraCarrera.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCargoActualCursoPosgradoOtraCarrera.Text)))
                FEstado = "la carrera";
            else
                if (!sgwNucleo.Funciones.VerificarRequerido(edtCargoActualCursoPosgradoActividadCurricular.Text))
                    FEstado = "la(s) actividad(es) curricular(es)";
                else
                    if ((pnlCargoActualOtroCargo.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCargosDocentesActualOtroCargo.Text)))
                        FEstado = "el tipo de cargo";
                    else
                        if (!sgwNucleo.Funciones.VerificarRequeridoInt(edtCargoActualCursoPosgradoAnioInicio.Text))
                            FEstado = "el año de inicio";
            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoActCurric FCargoActCurric = new CargoActCurric();
            if (Session["OperacionDetalle3"].ToString() == "1")
                FCargoActCurric.ID_CARGOS_DOCENTES = int.Parse(Session["ID_CARGOS_DOCENTES"].ToString());
            else
                FGestor.ObtenerObjeto(FCargoActCurric, grdCursosPosgrado);
            FCargoActCurric.ID_TIPOS_CARRERAS = int.Parse(cmbCargoActualCursoPosgradoTipo.SelectedValue);
            if (cmbCargoActualCursoPosgradoCarrera.SelectedValue != "-1")
            {
                FCargoActCurric.CARRERA_UNIV = true;
                FCargoActCurric.ID_CARRERAS = int.Parse(cmbCargoActualCursoPosgradoCarrera.SelectedValue);
                FCargoActCurric.OTRA_CARRERA = "";
            }
            else
            {
                FCargoActCurric.CARRERA_UNIV = false;
                FCargoActCurric.ID_CARRERAS = 0;
                FCargoActCurric.OTRA_CARRERA = edtCargoActualCursoPosgradoOtraCarrera.Text;
            }
            FCargoActCurric.ACTIVIDAD_CURRICULAR = edtCargoActualCursoPosgradoActividadCurricular.Text;
            FCargoActCurric.ANIO_INICIO = int.Parse(edtCargoActualCursoPosgradoAnioInicio.Text);
            FCargoActCurric.PLAN_ESTUDIOS = int.Parse(edtCargoActualCursoPosgradoPlanEstudios.Text);
            FGestor.GuardarObjeto(FCargoActCurric);
            actualizarDatosCargosCarrerasPosgrado();
            sgwNucleo.Pagina.CerrarPopup(popCargoActualCursoPosgrado);
        }

        protected void btnCancelarCargoActualCursoPosgrado_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popCargoActualCursoPosgrado);
        }

        #endregion


       



    }
