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
                 // listadesplegable instituciones
                 datos = FGestor.LeerSQL("SELECT ID_INSTITUCIONES, INSTITUCION FROM SIS_UNIVERSIDADES.Q_INSTITUCIONES WHERE ID_ESTADOS_INSTITUCIONES = 1");
                 Funciones.CompletarListaDesplegable(cmbCargoNoAcademicoInstitucion, datos, true, false);
                 Funciones.CompletarListaDesplegable(cmbCargoNoAcademicoInstitucionP, datos, true, false);
                 Funciones.CompletarListaDesplegable(cmbCargosHospitalariosInstitucion, datos, true, false);

                 datos = FGestor.LeerSQL("SELECT ID_DISCIPLINAS, DISCIPLINA FROM SIS_CONEAU.Q_DISCIPLINAS");
                 sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargosNoAcademicosDisciplina, datos, false, false);
                 sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargosNoAcademicosDisciplinaP, datos, false, false);
                 datos = FGestor.LeerSQL("SELECT ID_TIPOS_DURACIONES_DED, TIPO_DURACION_DED FROM SIS_DOCENTES.Q_TIPOS_DURACIONES_DED");
                 sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargosNoAcademicosSemanasAnual, datos, false, false);
                 sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargosNoAcademicosSemanasAnualP, datos, false, false);

                 Docente FDocente = new Docente();
                 FGestor.ObtenerObjeto(FDocente, int.Parse(Session["ID_DOCENTES"].ToString()));      
                 chkDesempenioNoAcademico.Checked =  FDocente.DESEMPENIO_NO_ACADEMICO;
            }
            actualizarDatosCargosHospitalarios();
            actualizarDatosCargoNoAcademico();
            actualizarDatosCargoNoAcademicoP();
        }


        
        
        #region CargoNoAcademico 
        // Botones ABM Cargos Desempeniados
        protected void btnAgregarCargoNoAcademico_Click(object sender, EventArgs e)
        {

            Session["OperacionDetalle"] = "A";
            cmbCargoNoAcademicoInstitucion.SelectedIndex = 0;
            cmbCargosNoAcademicosDisciplina.SelectedIndex = 0;
            edtCargosNoAcademicosCargoFuncion.Text = "";
            edtCargosNoAcademicosHsRelojSemanales.Text = "0";
            edtCargosNoAcademicosFunciones.Text = "";
            edtCargosNoAcademicosFechaFinalizacion.Text = "";
            edtCargosNoAcademicosFechaInicio.Text = "";
            cmbCargoNoAcademicoInstitucion_SelectedIndexChanged(null, null);
            cmbCargosNoAcademicosDisciplina_SelectedIndexChanged(null, null);
            cmbCargosNoAcademicosSubdisciplina_SelectedIndexChanged(null, null);
            cmbCargosNoAcademicosSemanasAnual.SelectedIndex = 0;
            popCargosNoAcademicos.ShowOnPageLoad = true;
        }
        protected void btnModificarCargoNoAcademico_Click(object sender, EventArgs e)
        {
            if (grdCargosNoAcademicosABM.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoNoDocente FCargoNoDocente = new CargoNoDocente();
            FGestor.ObtenerObjeto(FCargoNoDocente, grdCargosNoAcademicosABM);
            Session["OperacionDetalle"] = "M";
            edtCargosNoAcademicosCargoFuncion.Text = FCargoNoDocente.CARGO;
            edtCargosNoAcademicosHsRelojSemanales.Text = FCargoNoDocente.DEDICACION_SEMANAL.ToString();
            edtCargosNoAcademicosFechaInicio.Text = FCargoNoDocente.LeerFecha("FECHA_INICIO");
            edtCargosNoAcademicosFechaFinalizacion.Text = "";
            edtCargosNoAcademicosFunciones.Text = FCargoNoDocente.FUNCIONES;
            if (FCargoNoDocente.INSTITUCION_UNIV)
            {
                cmbCargoNoAcademicoInstitucion.SelectedValue = FCargoNoDocente.ID_INSTITUCIONES.ToString();
                edtOtraCargoNoAcademicoInstitucion.Text = "";
            }
            else
            {
                cmbCargoNoAcademicoInstitucion.SelectedValue = "-1";
                edtOtraCargoNoAcademicoInstitucion.Text = FCargoNoDocente.OTRA_INSTITUCION;
            }
            cmbCargoNoAcademicoInstitucion_SelectedIndexChanged(sender, e);
            cmbCargosNoAcademicosSemanasAnual.Text = FCargoNoDocente.ID_TIPOS_DURACIONES_DED.ToString();
            if (FCargoNoDocente.ID_SUBDISCIPLINAS != 0)
            {

                DataSet FData = FGestor.LeerSQL("SELECT ID_DISCIPLINAS FROM SIS_CONEAU.SUBDISCIPLINAS " +
                "WHERE ID_SUBDISCIPLINAS = " + FCargoNoDocente.ID_SUBDISCIPLINAS.ToString());
                if (FData.Tables[0].Rows.Count < 1)
                    cmbCargosNoAcademicosDisciplina.SelectedIndex = 0;
                else
                    cmbCargosNoAcademicosDisciplina.SelectedValue = FData.Tables[0].Rows[0].ItemArray[0].ToString();
                    cmbCargosNoAcademicosDisciplina_SelectedIndexChanged(null, null);

                    cmbCargosNoAcademicosSubdisciplina.SelectedValue = FCargoNoDocente.ID_SUBDISCIPLINAS.ToString();
                    cmbCargosNoAcademicosSubdisciplina_SelectedIndexChanged(null, null);
            }
            else
            {

                

                cmbCargosNoAcademicosDisciplina.SelectedIndex = 0;
                cmbCargosNoAcademicosDisciplina_SelectedIndexChanged(null, null);
                cmbCargosNoAcademicosSubdisciplina_SelectedIndexChanged(null, null);


            }
            if (pnlCargosNoAcademicosOtraDisciplina.Visible)
                edtCargosNoAcademicosOtraDisciplina.Text = FCargoNoDocente.OTRA_DISCIPLINA;
            if (pnlCargosNoAcademicosOtraSubdisciplina.Visible)
                edtCargosNoAcademicosOtraSubdisciplina.Text = FCargoNoDocente.OTRA_SUBDISCIPLINA;
            popCargosNoAcademicos.ShowOnPageLoad = true;


        }
        protected void btnEliminarCargoNoAcademico_Click(object sender, EventArgs e)
        {

            if (grdCargosNoAcademicosABM.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoNoDocente FCargoNoDocente = new CargoNoDocente();
            FGestor.ObtenerObjeto(FCargoNoDocente, grdCargosNoAcademicosABM);
            FGestor.EliminarObjeto(FCargoNoDocente);
            actualizarDatosCargoNoAcademico();
        }

        // Botones Popup Cargos Desempeniados
        protected void btnAceptarCargoNoAcademico_Click(object sender, EventArgs e)
        {
            // Requeridos
            string FEstado = "";
            if ((pnlCargoNoAcademicoInstitucion.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtOtraCargoNoAcademicoInstitucion.Text)))
                FEstado = "la institución";
            else

                if (!sgwNucleo.Funciones.VerificarRequerido(edtCargosNoAcademicosCargoFuncion.Text))
                    FEstado = "el cargo";
                else
                    if (!sgwNucleo.Funciones.VerificarRequeridoInt(edtCargosNoAcademicosHsRelojSemanales.Text))
                        FEstado = "la dedicación semanal en horas reloj";
                    else
                        if (!sgwNucleo.Funciones.VerificarRequerido(edtCargosNoAcademicosFechaInicio.Text))
                            FEstado = "la fecha de inicio";
                        else
                            if (!sgwNucleo.Funciones.VerificarRequerido(edtCargosNoAcademicosFunciones.Text))
                                FEstado = "las funciones";
                            else
                                if ((int.Parse(edtCargosNoAcademicosHsRelojSemanales.Text) < 1) || (int.Parse(edtCargosNoAcademicosHsRelojSemanales.Text) > 60))
                                {
                                    sgwNucleo.Pagina.MostrarEstado("La dedicación semanal ingresada no es válida.", 1);
                                    return;
                                }

            if ((pnlCargosNoAcademicosOtraDisciplina.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCargosNoAcademicosOtraDisciplina.Text)))
                FEstado = "la disciplina";
            else
                if ((pnlCargosNoAcademicosOtraSubdisciplina.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCargosNoAcademicosOtraSubdisciplina.Text)))
                    FEstado = "la subdisciplina";
            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoNoDocente FCargoNoDocente = new CargoNoDocente();
            if (Session["OperacionDetalle"].ToString() == "M")
                FGestor.ObtenerObjeto(FCargoNoDocente, int.Parse(grdCargosNoAcademicosABM.GetRowValues(grdCargosNoAcademicosABM.FocusedRowIndex, "ID_CARGOS_NO_DOCENTES").ToString()));
            else
                FCargoNoDocente.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
            FCargoNoDocente.ID_INSTITUCIONES = int.Parse(cmbCargoNoAcademicoInstitucion.SelectedValue.ToString());
            FCargoNoDocente.GuardarFecha("FECHA_INICIO", edtCargosNoAcademicosFechaInicio.Text);
            FCargoNoDocente.GuardarFecha("FECHA_FINALIZACION", edtCargosNoAcademicosFechaFinalizacion.Text);
            FCargoNoDocente.CARGO = edtCargosNoAcademicosCargoFuncion.Text;
            FCargoNoDocente.DEDICACION_SEMANAL = int.Parse(edtCargosNoAcademicosHsRelojSemanales.Text);
            FCargoNoDocente.FUNCIONES = edtCargosNoAcademicosFunciones.Text;
            FCargoNoDocente.ID_TIPOS_DURACIONES_DED = int.Parse(cmbCargosNoAcademicosSemanasAnual.SelectedValue);
            FCargoNoDocente.ID_SUBDISCIPLINAS = int.Parse(cmbCargosNoAcademicosSubdisciplina.SelectedValue);
            if (pnlCargosNoAcademicosOtraDisciplina.Visible)
                FCargoNoDocente.OTRA_DISCIPLINA = edtCargosNoAcademicosOtraDisciplina.Text;
            if (pnlCargosNoAcademicosOtraSubdisciplina.Visible)
                FCargoNoDocente.OTRA_SUBDISCIPLINA = edtCargosNoAcademicosOtraSubdisciplina.Text;
            if (cmbCargoNoAcademicoInstitucion.SelectedValue == "-1")
            {
                FCargoNoDocente.INSTITUCION_UNIV = false;
                FCargoNoDocente.ID_INSTITUCIONES = 0;
                FCargoNoDocente.OTRA_INSTITUCION = edtOtraCargoNoAcademicoInstitucion.Text;
            }
            else
            {
                FCargoNoDocente.INSTITUCION_UNIV = true;
                FCargoNoDocente.ID_INSTITUCIONES = int.Parse(cmbCargoNoAcademicoInstitucion.SelectedValue);
                FCargoNoDocente.OTRA_INSTITUCION = "";
            }
            FGestor.GuardarObjeto(FCargoNoDocente);
            actualizarDatosCargoNoAcademico();
            actualizarDatosCargoNoAcademicoP();
            sgwNucleo.Pagina.CerrarPopup(popCargosNoAcademicos);
        }
        protected void btnCancelarCargoNoAcademico_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popCargosNoAcademicos);
        }
        protected void actualizarDatosCargoNoAcademico()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            string FCondicion = " ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
            if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
                FCondicion += " AND ((FECHA_ALTA - 1) <= '" + Session["FECHA_PRESENTADA"].ToString() + "' OR FECHA_ALTA IS NULL)";
            DataSet datos = FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_CARGOS_NO_DOCENTES WHERE (FECHA_FINALIZACION IS NULL OR " +
            "FECHA_FINALIZACION > SYSDATE) AND " + FCondicion);
            grdCargosNoAcademicosABM.DataSource = datos;
            grdCargosNoAcademicosABM.DataBind();
        }
        protected void cmbCargoNoAcademicoInstitucion_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlCargoNoAcademicoInstitucion.Visible =cmbCargoNoAcademicoInstitucion.SelectedValue == "-1";
        }
        protected void cmbCargosNoAcademicosDisciplina_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlCargosNoAcademicosOtraDisciplina.Visible = cmbCargosNoAcademicosDisciplina.SelectedValue == "1000";
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            DataSet datos = FGestor.LeerSQL("SELECT ID_SUBDISCIPLINAS, SUBDISCIPLINA FROM SIS_CONEAU.Q_SUBDISCIPLINAS WHERE ID_DISCIPLINAS = " +
                cmbCargosNoAcademicosDisciplina.SelectedValue);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargosNoAcademicosSubdisciplina, datos, false, false);
            cmbCargosNoAcademicosSubdisciplina_SelectedIndexChanged(sender, e);
        }
        protected void cmbCargosNoAcademicosSubdisciplina_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlCargosNoAcademicosOtraSubdisciplina.Visible = cmbCargosNoAcademicosSubdisciplina.SelectedItem.Text == "(Otra opción...)";
        }
        #endregion


        #region CargosHospitalarios
        // Botones ABM Actividades Hospitalarias
        protected void btnAgregarCargosHospitalarios_Click(object sender, EventArgs e)
        {
            Session["OperacionDetalle"] = "A";
            cmbCargosHospitalariosInstitucion.SelectedValue = "1";
            edtActividadesHospitalariasServicio.Text = "";
            edtActividadesHospitalariasCargoFuncion.Text = "";
            edtCargosHospitalariosFechaInicio.Text = "";
            edtCargosHospitalariosFechaFinalizacion.Text = "";
            cmbCargosHospitalariosInstitucion_SelectedIndexChanged(null, null);     
            popCargosHospitalarios.ShowOnPageLoad = true;

        }
        protected void btnModificarCargosHospitalarios_Click(object sender, EventArgs e)
        {
            if (grdCargosHospitalarios.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoHospitalario FCargosHospitalarios = new CargoHospitalario();
            FGestor.ObtenerObjeto(FCargosHospitalarios, grdCargosHospitalarios);
            Session["OperacionDetalle"] = "M";

            edtActividadesHospitalariasServicio.Text = FCargosHospitalarios.AMBITO_HOSPITALARIO;
            edtActividadesHospitalariasCargoFuncion.Text = FCargosHospitalarios.CARGO;
            edtCargosHospitalariosFechaInicio.Text = FCargosHospitalarios.LeerFecha("FECHA_INICIO");
            edtCargosHospitalariosFechaFinalizacion.Text = FCargosHospitalarios.LeerFecha("FECHA_FINALIZACION");
            
            if (FCargosHospitalarios.INSTITUCION_UNIV)
            {
                cmbCargosHospitalariosInstitucion.SelectedValue = FCargosHospitalarios.ID_INSTITUCIONES.ToString();
                edtCargosHospitalariosInstitucionOtra.Text = "";
            }
            else
            {
                cmbCargosHospitalariosInstitucion.SelectedValue = "-1";
                edtCargosHospitalariosInstitucionOtra.Text = FCargosHospitalarios.OTRA_INSTITUCION;
            }
            cmbCargosHospitalariosInstitucion_SelectedIndexChanged(sender, e);     
            popCargosHospitalarios.ShowOnPageLoad = true;
        }
        protected void btnEliminarCargosHospitalarios_Click(object sender, EventArgs e)
        {
            if (grdCargosHospitalarios.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoHospitalario FCargosHospitalarios = new CargoHospitalario();
            FGestor.ObtenerObjeto(FCargosHospitalarios, grdCargosHospitalarios);
            FGestor.EliminarObjeto(FCargosHospitalarios);
            actualizarDatosCargosHospitalarios();
        }
        // Botones Popup Actividades Hospitalarias
        protected void btnAceptarCargosHospitalarios_Click(object sender, EventArgs e)
        {

            // Requeridos
            string FEstado = "";


            if ((pnlCargosHospitalarios.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCargosHospitalariosInstitucionOtra.Text)))
                FEstado = "la institución";
            else

                if (!sgwNucleo.Funciones.VerificarRequerido(edtActividadesHospitalariasServicio.Text))
                    FEstado = "el servicio";
                else
                    if (!sgwNucleo.Funciones.VerificarRequerido(edtActividadesHospitalariasCargoFuncion.Text))
                        FEstado = "el cargo/función";
                    else
                        if (!sgwNucleo.Funciones.VerificarRequerido(edtCargosHospitalariosFechaInicio.Text))
                            FEstado = "la fecha de inicio";
            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoHospitalario FCargosHospitalarios = new CargoHospitalario();
            if (Session["OperacionDetalle"].ToString() == "M")
                FGestor.ObtenerObjeto(FCargosHospitalarios, int.Parse(grdCargosHospitalarios.GetRowValues(grdCargosHospitalarios.FocusedRowIndex, "ID_CARGOS_HOSPITALARIOS").ToString()));
            else
                FCargosHospitalarios.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
            FCargosHospitalarios.GuardarFecha("FECHA_INICIO", edtCargosHospitalariosFechaInicio.Text);
            FCargosHospitalarios.GuardarFecha("FECHA_FINALIZACION", edtCargosHospitalariosFechaFinalizacion.Text);
            FCargosHospitalarios.AMBITO_HOSPITALARIO = edtActividadesHospitalariasServicio.Text;
            FCargosHospitalarios.CARGO = edtActividadesHospitalariasCargoFuncion.Text;
            if (cmbCargosHospitalariosInstitucion.SelectedValue == "-1")
            {
                FCargosHospitalarios.INSTITUCION_UNIV = false;
                FCargosHospitalarios.ID_INSTITUCIONES = 0;
                FCargosHospitalarios.OTRA_INSTITUCION = edtCargosHospitalariosInstitucionOtra.Text;
            }
            else
            {
                FCargosHospitalarios.INSTITUCION_UNIV = true;
                FCargosHospitalarios.ID_INSTITUCIONES = int.Parse(cmbCargosHospitalariosInstitucion.SelectedValue);
                FCargosHospitalarios.OTRA_INSTITUCION = "";
            }
            FGestor.GuardarObjeto(FCargosHospitalarios);
            actualizarDatosCargosHospitalarios();
            sgwNucleo.Pagina.CerrarPopup(popCargosHospitalarios);
        }

        protected void btnCancelarCargosHospitalarios_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popCargosHospitalarios);
        }
        protected void actualizarDatosCargosHospitalarios()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            string FCondicion = " ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
            if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
                FCondicion += " AND ((FECHA_ALTA - 1) <= '" + Session["FECHA_PRESENTADA"].ToString() + "' OR FECHA_ALTA IS NULL)";
            DataSet datos = FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_CARGOS_HOSPITALARIOS WHERE " + FCondicion);
            grdCargosHospitalarios.DataSource = datos;
            grdCargosHospitalarios.DataBind();

        }
        protected void cmbCargosHospitalariosInstitucion_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlCargosHospitalarios.Visible = cmbCargosHospitalariosInstitucion.SelectedValue == "-1";
        }
        #endregion



        #region CargoNoAcademicoP
        // Botones ABM Cargos Desempeniados
        protected void btnAgregarCargoNoAcademicoP_Click(object sender, EventArgs e)
        {

            Session["OperacionDetalle"] = "A";
            cmbCargoNoAcademicoInstitucionP.SelectedIndex = 0;
            edtCargosNoAcademicosCargoFuncionP.Text = "";
            edtCargosNoAcademicosHsRelojSemanalesP.Text = "0";
            edtCargosNoAcademicosFechaInicioP.Text = "";
            edtCargosNoAcademicosFechaFinalizacionP.Text = "";
            edtCargosNoAcademicosFuncionesP.Text = "";
            cmbCargosNoAcademicosDisciplina.SelectedIndex = 0;
            cmbCargosNoAcademicosSemanasAnual.SelectedIndex = 0;
            cmbCargoNoAcademicoInstitucionP_SelectedIndexChanged(null, null);
            cmbCargosNoAcademicosDisciplinaP_SelectedIndexChanged(null, null);
            cmbCargosNoAcademicosSubdisciplinaP_SelectedIndexChanged(null, null);
            popCargosNoAcademicosP.ShowOnPageLoad = true;
        }
        protected void btnModificarCargoNoAcademicoP_Click(object sender, EventArgs e)
        {
            if (grdCargosNoAcademicosABMP.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoNoDocente FCargoNoDocenteP = new CargoNoDocente();
            FGestor.ObtenerObjeto(FCargoNoDocenteP, grdCargosNoAcademicosABMP);
            Session["OperacionDetalle"] = "M";
            edtCargosNoAcademicosCargoFuncionP.Text = FCargoNoDocenteP.CARGO;
            edtCargosNoAcademicosHsRelojSemanalesP.Text = FCargoNoDocenteP.DEDICACION_SEMANAL.ToString();
            edtCargosNoAcademicosFechaInicioP.Text = FCargoNoDocenteP.LeerFecha("FECHA_INICIO");
            edtCargosNoAcademicosFechaFinalizacionP.Text = FCargoNoDocenteP.LeerFecha("FECHA_FINALIZACION");
            edtCargosNoAcademicosFuncionesP.Text = FCargoNoDocenteP.FUNCIONES;
            if (FCargoNoDocenteP.INSTITUCION_UNIV)
            {
                cmbCargoNoAcademicoInstitucionP.SelectedValue = FCargoNoDocenteP.ID_INSTITUCIONES.ToString();
                edtOtraCargoNoAcademicoInstitucionP.Text = "";
            }
            else
            {
                cmbCargoNoAcademicoInstitucionP.SelectedValue = "-1";
                edtOtraCargoNoAcademicoInstitucionP.Text = FCargoNoDocenteP.OTRA_INSTITUCION;
            }
            cmbCargoNoAcademicoInstitucionP_SelectedIndexChanged(sender, e);
            cmbCargosNoAcademicosSemanasAnualP.SelectedValue = FCargoNoDocenteP.ID_TIPOS_DURACIONES_DED.ToString();
            if (FCargoNoDocenteP.ID_SUBDISCIPLINAS != 0)
            {
                DataSet FData = FGestor.LeerSQL("SELECT ID_DISCIPLINAS FROM SIS_CONEAU.SUBDISCIPLINAS " +
                "WHERE ID_SUBDISCIPLINAS = " + FCargoNoDocenteP.ID_SUBDISCIPLINAS.ToString());
                if (FData.Tables[0].Rows.Count < 1)
                    cmbCargosNoAcademicosDisciplinaP.SelectedIndex = 0;
                else
                    cmbCargosNoAcademicosDisciplinaP.SelectedValue = FData.Tables[0].Rows[0].ItemArray[0].ToString();
                cmbCargosNoAcademicosDisciplinaP_SelectedIndexChanged(null, null);

                cmbCargosNoAcademicosSubdisciplinaP.SelectedValue = FCargoNoDocenteP.ID_SUBDISCIPLINAS.ToString();
                cmbCargosNoAcademicosSubdisciplinaP_SelectedIndexChanged(null, null);
            }
            else
            {
                cmbCargosNoAcademicosDisciplinaP.SelectedIndex = 0;
                cmbCargosNoAcademicosDisciplinaP_SelectedIndexChanged(null, null);
                cmbCargosNoAcademicosSubdisciplinaP_SelectedIndexChanged(null, null);
            }
            if (pnlCargosNoAcademicosOtraDisciplinaP.Visible)
                edtCargosNoAcademicosOtraDisciplinaP.Text = FCargoNoDocenteP.OTRA_DISCIPLINA;
            if (pnlCargosNoAcademicosOtraSubdisciplinaP.Visible)
                edtCargosNoAcademicosOtraSubdisciplinaP.Text = FCargoNoDocenteP.OTRA_SUBDISCIPLINA;
            popCargosNoAcademicosP.ShowOnPageLoad = true;
        }

        protected void btnEliminarCargoNoAcademicoP_Click(object sender, EventArgs e)
        {

            if (grdCargosNoAcademicosABMP.FocusedRowIndex < 0) return;
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoNoDocente FCargoNoDocenteP = new CargoNoDocente();
            FGestor.ObtenerObjeto(FCargoNoDocenteP, grdCargosNoAcademicosABMP);
            FGestor.EliminarObjeto(FCargoNoDocenteP);
            actualizarDatosCargoNoAcademicoP();
        }
        // Botones Popup Cargos Desempeniados
        protected void btnAceptarCargoNoAcademicoP_Click(object sender, EventArgs e)
        {
            // Requeridos
            string FEstado = "";
            if ((pnlCargoNoAcademicoInstitucionP.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtOtraCargoNoAcademicoInstitucionP.Text)))
                FEstado = "la institución";
            else
                if (!sgwNucleo.Funciones.VerificarRequerido(edtCargosNoAcademicosCargoFuncionP.Text))
                    FEstado = "el cargo";
                else
                    if (!sgwNucleo.Funciones.VerificarRequeridoInt(edtCargosNoAcademicosHsRelojSemanalesP.Text))
                        FEstado = "la dedicación semanal en horas reloj";
                    else
                        if (!sgwNucleo.Funciones.VerificarRequerido(edtCargosNoAcademicosFechaInicioP.Text))
                            FEstado = "la fecha de inicio";
                        else
                            if (!sgwNucleo.Funciones.VerificarRequerido(edtCargosNoAcademicosFuncionesP.Text))
                                FEstado = "las funciones";
                            else
                                if ((int.Parse(edtCargosNoAcademicosHsRelojSemanalesP.Text) < 1) || (int.Parse(edtCargosNoAcademicosHsRelojSemanalesP.Text) > 60))
                            {
                                sgwNucleo.Pagina.MostrarEstado("La dedicación semanal ingresada no es válida.", 1);
                                return;
                            }
            if ((pnlCargosNoAcademicosOtraDisciplinaP.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCargosNoAcademicosOtraDisciplinaP.Text)))
                FEstado = "la disciplina";
            else
                if ((pnlCargosNoAcademicosOtraSubdisciplinaP.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCargosNoAcademicosOtraSubdisciplinaP.Text)))
                    FEstado = "la subdisciplina";
            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            CargoNoDocente FCargoNoDocenteP = new CargoNoDocente();
            if (Session["OperacionDetalle"].ToString() == "M")
                FGestor.ObtenerObjeto(FCargoNoDocenteP, int.Parse(grdCargosNoAcademicosABMP.GetRowValues(grdCargosNoAcademicosABMP.FocusedRowIndex, "ID_CARGOS_NO_DOCENTES").ToString()));
            else
                FCargoNoDocenteP.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
            FCargoNoDocenteP.ID_INSTITUCIONES = int.Parse(cmbCargoNoAcademicoInstitucionP.SelectedValue.ToString());
            FCargoNoDocenteP.GuardarFecha("FECHA_INICIO", edtCargosNoAcademicosFechaInicioP.Text);
            FCargoNoDocenteP.GuardarFecha("FECHA_FINALIZACION", edtCargosNoAcademicosFechaFinalizacionP.Text);
            FCargoNoDocenteP.CARGO = edtCargosNoAcademicosCargoFuncionP.Text;
            FCargoNoDocenteP.DEDICACION_SEMANAL = int.Parse(edtCargosNoAcademicosHsRelojSemanalesP.Text);
            FCargoNoDocenteP.FUNCIONES = edtCargosNoAcademicosFuncionesP.Text;
            FCargoNoDocenteP.ID_TIPOS_DURACIONES_DED = int.Parse(cmbCargosNoAcademicosSemanasAnualP.SelectedValue);
            FCargoNoDocenteP.ID_SUBDISCIPLINAS = int.Parse(cmbCargosNoAcademicosSubdisciplinaP.SelectedValue);
            if (pnlCargosNoAcademicosOtraDisciplinaP.Visible)
                FCargoNoDocenteP.OTRA_DISCIPLINA = edtCargosNoAcademicosOtraDisciplinaP.Text;
            if (pnlCargosNoAcademicosOtraSubdisciplinaP.Visible)
                FCargoNoDocenteP.OTRA_SUBDISCIPLINA = edtCargosNoAcademicosOtraSubdisciplinaP.Text;
            if (cmbCargoNoAcademicoInstitucionP.SelectedValue == "-1")
            {
                FCargoNoDocenteP.INSTITUCION_UNIV = false;
                FCargoNoDocenteP.ID_INSTITUCIONES = 0;
                FCargoNoDocenteP.OTRA_INSTITUCION = edtOtraCargoNoAcademicoInstitucionP.Text;
            }
            else
            {
                FCargoNoDocenteP.INSTITUCION_UNIV = true;
                FCargoNoDocenteP.ID_INSTITUCIONES = int.Parse(cmbCargoNoAcademicoInstitucionP.SelectedValue);
                FCargoNoDocenteP.OTRA_INSTITUCION = "";
            }
            FGestor.GuardarObjeto(FCargoNoDocenteP);
            actualizarDatosCargoNoAcademico();
            actualizarDatosCargoNoAcademicoP();
            sgwNucleo.Pagina.CerrarPopup(popCargosNoAcademicosP);
        }

        protected void btnCancelarCargoNoAcademicoP_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popCargosNoAcademicosP);
        }

        protected void actualizarDatosCargoNoAcademicoP()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            string FCondicion = " ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
            if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
                FCondicion += " AND ((FECHA_ALTA - 1) <= '" + Session["FECHA_PRESENTADA"].ToString() + "' OR FECHA_ALTA IS NULL)";
            DataSet datos = FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_CARGOS_NO_DOCENTES WHERE FECHA_FINALIZACION IS NOT NULL " +
                "AND FECHA_FINALIZACION <= SYSDATE AND " + FCondicion);
            grdCargosNoAcademicosABMP.DataSource = datos;
            grdCargosNoAcademicosABMP.DataBind();
        }
        protected void cmbCargoNoAcademicoInstitucionP_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlCargoNoAcademicoInstitucionP.Visible = cmbCargoNoAcademicoInstitucionP.SelectedValue == "-1";
        }
        protected void cmbCargosNoAcademicosDisciplinaP_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlCargosNoAcademicosOtraDisciplinaP.Visible = cmbCargosNoAcademicosDisciplinaP.SelectedValue == "1000";  //selectedValue == "1000"
            // Listado de Disciplinas
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            DataSet datos = FGestor.LeerSQL("SELECT ID_SUBDISCIPLINAS, SUBDISCIPLINA FROM SIS_CONEAU.Q_SUBDISCIPLINAS WHERE ID_DISCIPLINAS = " +
                cmbCargosNoAcademicosDisciplinaP.SelectedValue);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCargosNoAcademicosSubdisciplinaP, datos, false, false);
            cmbCargosNoAcademicosSubdisciplinaP_SelectedIndexChanged(sender, e);
        }
        protected void cmbCargosNoAcademicosSubdisciplinaP_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlCargosNoAcademicosOtraSubdisciplinaP.Visible = cmbCargosNoAcademicosSubdisciplinaP.SelectedItem.Text == "(Otra opción...)";
        }
        #endregion
     





        // Botones General
        protected bool guardar()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Docente FDocente = new Docente();
            FGestor.ObtenerObjeto(FDocente, int.Parse(Session["ID_DOCENTES"].ToString()));
            FDocente.DESEMPENIO_NO_ACADEMICO = chkDesempenioNoAcademico.Checked;
            return FGestor.GuardarObjeto(FDocente);
           
        }

        protected void btnGuardarC_Click(object sender, EventArgs e)
        {
            if (guardar())
                Response.Redirect("abm-p7.aspx");
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
