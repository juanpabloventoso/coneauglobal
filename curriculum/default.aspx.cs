using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Net;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using sgwMulticapa.Gestor;
using sgwMulticapa.Objetos.CONEAU.Instructivos;
using sgwMulticapa.Objetos.CONEAU.Docentes;
using System.Globalization;
using System.IO;
using System.Xml;

public partial class form_inicio : System.Web.UI.Page
{

    public bool esGrado = true;

    protected void Page_Load(object sender, EventArgs e)
    {
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        sgwNucleo.Usuarios.VerificarUsuarioAutenticado();
        if ((!sgwNucleo.Usuarios.UsuarioGrupo("Docentes universitarios")) && (sgwNucleo.Usuarios.UsuarioGrupo("Colaboradores de docentes universitarios")))
        {
            Response.Redirect("colaborador.aspx");
            return;
        }
        if (!Page.IsPostBack)
        {
            DataSet FData = FGestor.LeerSQL("SELECT SEXO FROM SIS_MAINFRAME.USUARIOS WHERE ID_USUARIOS = " + Session["UsuarioID"]);
            if (FData.Tables[0].Rows[0].ItemArray[0].ToString() == "F") lblBienvenido.Text = "Bienvenida, " + Session["UsuarioDescripcion"].ToString();
            else
                if (FData.Tables[0].Rows[0].ItemArray[0].ToString() == "M") lblBienvenido.Text = "Bienvenido, " + Session["UsuarioDescripcion"].ToString();
                else
                    lblBienvenido.Text = "Bienvenida/o, " + Session["UsuarioDescripcion"].ToString();
            DataSet FDatos = FGestor.LeerSQL("SELECT ID_TIPOS_DURACIONES_DED, TIPO_DURACION_DED FROM SIS_DOCENTES.TIPOS_DURACIONES_DED");
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(ddlModalidad1, FDatos, false, false);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(ddlModalidad2, FDatos, false, false);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(ddlModalidad3, FDatos, false, false);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(ddlModalidad4, FDatos, false, false);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(ddlModalidad5, FDatos, false, false);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(ddlModalidad6, FDatos, false, false);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(ddlModalidad7, FDatos, false, false);
            FData = FGestor.LeerSQL("SELECT CVAR, CVAR_URL, CUIT, ID_DOCENTES FROM SIS_DOCENTES.DOCENTES WHERE ID_USUARIOS = " + Session["UsuarioID"]);
            if (FData.Tables[0].Rows.Count == 0)
            {
                Response.Redirect("nuevo-docente.aspx");
                return;
            }
            Session["DocenteNombre"] = Session["UsuarioDescripcion"].ToString();
            if (FData.Tables[0].Rows.Count == 1)
            {
                Session["CVAR"] = FData.Tables[0].Rows[0].ItemArray[0].ToString();
                Session["CVAR_URL"] = FData.Tables[0].Rows[0].ItemArray[1].ToString();
                Session["CUIT"] = FData.Tables[0].Rows[0].ItemArray[2].ToString();
                Session["CUIT_BKP"] = FData.Tables[0].Rows[0].ItemArray[2].ToString();
                Session["ID_DOCENTES"] = FData.Tables[0].Rows[0].ItemArray[3].ToString();
            }
            if (Session["CVAR"].ToString() == "S")
            {
                DataSet FData1 = FGestor.LeerSQL("SELECT D.ID_PAISES_ORIGEN, P.CODIGO_ISO, D.NUMERO_DOCUMENTO " +
                "FROM  SIS_DOCENTES.DOCENTES D, SIS_MAINFRAME.USUARIOS U, SIS_CONEAU.PAISES P " +
                "WHERE U.ID_USUARIOS = D.ID_USUARIOS AND D.ID_PAISES_ORIGEN = P.ID_PAISES " +
                 "AND D.ID_USUARIOS =" + Session["UsuarioID"]);
                if ((FData1.Tables[0].Rows.Count > 0) && (FData1.Tables[0].Rows[0].ItemArray[0].ToString() != "13"))
                    Session["CUIT"] = FData1.Tables[0].Rows[0].ItemArray[1].ToString() + " " + FData1.Tables[0].Rows[0].ItemArray[2].ToString();
                btnAbrirFicha.Text = "Ingresar a CVar";
                btnImportar.Text = "Ver versión CONEAU...";
                pnlCVarAyuda.Visible = true;
                VerificarCVArExistente();
                pnlNotificacion.Visible = false;
            }
            else
            {
                btnAbrirFicha.Text = "Abrir mi currículum";
                btnImportar.Visible = true;
                pnlCVarAyuda.Visible = false;
                pnlNotificacion.Visible = true;
               // VerificarCVArUsar();
            }

        }
        actualizarVinculaciones();
        actualizarVinculacionesOtras();
        if (popCargosDocentes.ShowOnPageLoad)
            actualizarActividades();
    }


    protected void VerificarCVArExistente()
    {
        btnAprobar.Visible = true;
        btnAprobarVin.Visible = true;
        btnRechazarVin.Visible = true;
        pnlNoAnda.Visible = false;
        try
        {
            WebProxy wp;
            if (sgwNucleo.Funciones.EjecucionDesdeIDE())
            {
                wp = new WebProxy("10.0.0.1:8080", true);
                wp.Credentials = new NetworkCredential("AdminAD", "USRobotic");
            }
            else
            {
                wp = new WebProxy("172.16.0.1:8080", true);
                wp.Credentials = new NetworkCredential("adminweb", "Coneau1391CONEAUGlobal");
            }

            string FURL = "http://servicios.sicytar.mincyt.gob.ar/services/curriculum/datosPersonales/identificacion/" + Session["CUIT"].ToString().Replace("-", "");
            HttpWebRequest wrua = (HttpWebRequest)WebRequest.Create(FURL);
            wrua.UserAgent = "Mozilla/5.0";
            wrua.Timeout = 2000;
            wrua.Accept = "application/xml, application/xhtml+xml, */*; q=0.5 ";
            wrua.Method = "GET";
            wrua.ContentType = "text/xml";
            wrua.Proxy = null;
            //wrua.Proxy = wp;
            HttpWebResponse respua = (HttpWebResponse)wrua.GetResponse();
            StreamReader respuaReader = new StreamReader(respua.GetResponseStream());
            string mensaje = respuaReader.ReadToEnd();
            if (mensaje.Contains("No se encontro curriculum con"))
            {
                lblCUIT.Text = Session["CUIT"].ToString();
                pnlNoAnda.Visible = true;
            }
            else
            {
                pnlNoAnda.Visible = false;
            }

        }
        catch
        {
            lblCUIT.Text = Session["CUIT"].ToString();
            pnlNoAnda.Visible = true;
        }

    }

    protected void VerificarCVArUsar()
    {
        if (Session["VERIFICAR_CVAR"] != null) return;
        bool FExistente = true;
        WebProxy wp;
        if (sgwNucleo.Funciones.EjecucionDesdeIDE())
        {
            wp = new WebProxy("10.0.0.1:8080", true);
            wp.Credentials = new NetworkCredential("AdminAD", "USRobotic");
        }
        else
        {
            wp = new WebProxy("172.16.0.1:8080", true);
            wp.Credentials = new NetworkCredential("adminweb", "Coneau1391CONEAUGlobal");
        }
        try
        {
            string FURL = "http://servicios.sicytar.mincyt.gob.ar/services/curriculum/datosPersonales/identificacion/" + Session["CUIT"].ToString().Replace("-", "");
            HttpWebRequest wrua = (HttpWebRequest)WebRequest.Create(FURL);
            wrua.UserAgent = "Mozilla/5.0";
            wrua.Accept = "application/xml, application/xhtml+xml, */*; q=0.5 ";
            wrua.Timeout = 2000;
            wrua.Method = "GET";
            wrua.ContentType = "text/xml";
            wrua.Proxy = null;
            HttpWebResponse respua = (HttpWebResponse)wrua.GetResponse();
            StreamReader respuaReader = new StreamReader(respua.GetResponseStream());
            string mensaje = respuaReader.ReadToEnd();
            if (mensaje.Contains("No se encontro curriculum con"))
                FExistente = false;
        }
        catch
        {
            FExistente = false;
        }
        lblCUIT2.Text = Session["CUIT"].ToString();
        popUsarCVar.ShowOnPageLoad = FExistente;
        Session["VERIFICAR_CVAR"] = false;
    }


    protected void btnUsarCVar_Click(object sender, EventArgs e)
    {
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        DataSet FData = FGestor.LeerSQL("SELECT ID_DOCENTES FROM SIS_DOCENTES.DOCENTES WHERE ID_USUARIOS = " + Session["UsuarioID"].ToString());
        FGestor.EscribirSQL("UPDATE SIS_DOCENTES.DOCENTES SET CVAR = 'S' WHERE ID_DOCENTES = " + FData.Tables[0].Rows[0].ItemArray[0].ToString());
        FGestor.EscribirSQL("INSERT INTO SIS_DOCENTES.DOCENTES_ORIGENES_CV (CVAR, ID_DOCENTES, FECHA, ID_DOCENTES_ORIGENES_CV) VALUES ('S', " + FData.Tables[0].Rows[0].ItemArray[0].ToString() + ", SYSDATE, SIS_DOCENTES.SEQ_DOCENTES_ORIGENES_CV.NEXTVAL)");
        Response.Redirect("inicio.aspx");
    }

    protected void btnNoUsarCVar_Click(object sender, EventArgs e)
    {
        sgwNucleo.Pagina.CerrarPopup(popUsarCVar);
    }


    protected void btnAbrirFicha_Click(object sender, EventArgs e)
    {
        if (Session["CVAR"].ToString() == "S")
            Response.Redirect("http://cvar.sicytar.mincyt.gob.ar/auth/");
        else
            Response.Redirect("coneau/abm-p1.aspx");
    }

    protected void btnCrearCVAR_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://cvar.sicytar.mincyt.gob.ar/auth/newreg.jsp");
    }

    

    protected void btnImportarFicha_Click(object sender, EventArgs e)
    {
        if (Session["CVAR"].ToString() == "S")
        {
            Session["ID_PRESENTACIONES"] = "";
            Session["ID_ESTADOS_PRESENTACIONES"] = "1";
            Response.Redirect("cvar/abm-p1.aspx?SoloLectura=1");
        }
        else
            Response.Redirect("importar.aspx");
    }

    protected void chkMostrarAprobadas_Click(object sender, EventArgs e)
    {
        actualizarVinculaciones();
    }

    protected void chkMostrarAprobadasOtras_Click(object sender, EventArgs e)
    {
        actualizarVinculacionesOtras();
    }

    protected void actualizarVinculaciones()
    {
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        string FCondicion = "ID_USUARIOS = " + Session["UsuarioID"].ToString();
        Docente FDocente = (Docente)FGestor.ObtenerObjeto(typeof(Docente), FCondicion);
        if (FDocente != null)
        {
            string FSQL = "SELECT CD.* FROM SIS_INSTRUCTIVOS.Q_CARGOS_DOCENTES CD WHERE CD.ID_ESTADOS_PRESENTACIONES IN (1,3) AND CD.ID_DOCENTES = " + FDocente.ID +
                " AND (CD.ELIMINADO <> 'S' OR CD.ELIMINADO IS NULL) AND (CD.ID_PRESENTACIONES_CARRERAS IN (SELECT PC.ID_PRESENTACIONES_CARRERAS FROM SIS_INSTRUCTIVOS." +
                "Q_PRESENTACIONES_CARRERAS PC WHERE PC.ID_PRESENTACIONES_CARRERAS = CD.ID_PRESENTACIONES_CARRERAS AND PC.COMPLETADA = 'S') OR CD.ID_NIVELES_EDUCATIVOS = 2)";
            if (!chkMostrarAprobadas.Checked)
            {
                lblPendientes.Text = " y que están pendientes de revisión, o fueron revisadas recientemente.";
                FSQL += " AND (CD.ID_TIPOS_ESTADOS_CARGOS = 1 OR (SYSDATE - FECHA_REVISION_DOC) < 8) ";
                grdCargos.SettingsText.EmptyDataRow = "No hay vinculaciones en docencia pendientes de revisión.";
                grdVinculacionesO.SettingsText.EmptyDataRow = "No hay otras vinculaciones pendientes de revisión.";
            }
            else
            {
                lblPendientes.Text = "";
                grdCargos.SettingsText.EmptyDataRow = "No hay vinculaciones en docencia vigentes.";
                grdVinculacionesO.SettingsText.EmptyDataRow = "No hay otras vinculaciones vigentes.";
            }
            grdCargos.DataSource = FGestor.LeerSQL(FSQL);
            grdCargos.DataBind();
        }
    }

    protected void actualizarVinculacionesOtras()
    {
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        string FCondicion = "ID_USUARIOS = " + Session["UsuarioID"].ToString();
        Docente FDocente = (Docente)FGestor.ObtenerObjeto(typeof(Docente), FCondicion);
        if (FDocente != null)
        {
            string FSQL = "SELECT * FROM SIS_INSTRUCTIVOS.Q_OTRAS_VINCULACIONES WHERE ID_DOCENTES = " + FDocente.ID;
            if (!chkMostrarAprobadasOtras.Checked)
            {
                lblPendientesOtras.Text = " y que están pendientes de revisión";
                FSQL += " AND ID_TIPOS_ESTADOS_CARGOS = 1 ";
            }
            else
                lblPendientesOtras.Text = "";
            grdVinculacionesO.DataSource = FGestor.LeerSQL(FSQL);
            grdVinculacionesO.DataBind();
        }
    }

    protected bool tieneTituloMaximo()
    {
        //return true;
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        if (Session["CVAR"].ToString() == "S")
            sgwFunciones.CONEAU.Docentes.cvarActualizarTituloMaximo(Session["CUIT"].ToString());
        DataSet FDatos = FGestor.LeerSQL("SELECT SIS_DOCENTES.PKG_DOCENTES.OBTENER_TITULO_MAXIMO(" + Session["ID_DOCENTES"] + ") FROM DUAL");
        if (FDatos.Tables[0].Rows[0].ItemArray[0].ToString() == "-") 
            return false; 
            else return true;

    }

    protected void btnRevisar_Click(object sender, EventArgs e)
    {
        if (grdCargos.FocusedRowIndex < 0) return;
        if (pnlNoAnda.Visible)
        {
            sgwNucleo.Pagina.MostrarEstado("No puede continuar debido a que no encontramos su currículum CVar.", 1);
            return;
        }
        if (!tieneTituloMaximo())
        {
            sgwNucleo.Pagina.MostrarEstado("Para continuar debe ingresar su formación (título obtenido).", 1);
            return;
        }

        sgwMulticapa.Objetos.CONEAU.Instructivos.CargoDocente FCargoDocente = new sgwMulticapa.Objetos.CONEAU.Instructivos.CargoDocente();
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        FGestor.ObtenerObjeto(FCargoDocente, grdCargos);
        txtInstitucion.Text = grdCargos.GetRowValues(grdCargos.FocusedRowIndex, "INSTITUCION").ToString();
        txtUnidadAcademica.Text = grdCargos.GetRowValues(grdCargos.FocusedRowIndex, "UNIDAD_ACADEMICA").ToString() + " (" +
            grdCargos.GetRowValues(grdCargos.FocusedRowIndex, "LOCALIZACION").ToString() + ")";
        txtTipoCargo.Text = grdCargos.GetRowValues(grdCargos.FocusedRowIndex, "TIPO_CARGO").ToString();
        txtDesignacion.Text = grdCargos.GetRowValues(grdCargos.FocusedRowIndex, "TIPO_DESIGNACION").ToString();
        txtDedicacion1.Text = FCargoDocente.DED_DOCENCIA.ToString();
        txtDedicacion2.Text = FCargoDocente.DED_INVESTIGACION.ToString();
        txtDedicacion3.Text = FCargoDocente.DED_EXTENSION.ToString();
        txtDedicacion4.Text = FCargoDocente.DED_TESIS.ToString();
        txtDedicacion5.Text = FCargoDocente.DED_TUTORIAS.ToString();
        txtDedicacion6.Text = FCargoDocente.DED_OTRAS.ToString();
        txtDedicacion7.Text = FCargoDocente.DED_VINCULACION.ToString();
        ddlModalidad1.SelectedValue = FCargoDocente.ID_TIPOS_DUR_DED_1.ToString();
        ddlModalidad2.SelectedValue = FCargoDocente.ID_TIPOS_DUR_DED_2.ToString();
        ddlModalidad3.SelectedValue = FCargoDocente.ID_TIPOS_DUR_DED_3.ToString();
        ddlModalidad4.SelectedValue = FCargoDocente.ID_TIPOS_DUR_DED_4.ToString();
        ddlModalidad5.SelectedValue = FCargoDocente.ID_TIPOS_DUR_DED_5.ToString();
        ddlModalidad6.SelectedValue = FCargoDocente.ID_TIPOS_DUR_DED_6.ToString();
        ddlModalidad7.SelectedValue = FCargoDocente.ID_TIPOS_DUR_DED_7.ToString();
        CalcularDedicaciones();
        actualizarActividades();
        pnlCargoGrado.Visible = grdCargos.GetRowValues(grdCargos.FocusedRowIndex, "ID_NIVELES_EDUCATIVOS").ToString() == "2";
        pnlCargoPosgrado.Visible = !pnlCargoGrado.Visible;
        pnlCargoPosgrado2.Visible = !pnlCargoGrado.Visible;
        pnlActividadesCurriculares.Visible = pnlCargoGrado.Visible;
        if (pnlCargoPosgrado.Visible)
        {
            if (FCargoDocente.PLANTEL_DOCENTE) txtPertenencia.Text = "Plantel docente"; else txtPertenencia.Text = "Cuerpo de tutores";
            if (FCargoDocente.VINCULO_ESTABLE) txtTipoVinculo.Text = "Estable"; else txtTipoVinculo.Text = "Invitado";
            txtCargoCarrera.Text = grdCargos.GetRowValues(grdCargos.FocusedRowIndex, "CARRERAS").ToString();
            chkCargoDirector.Checked = FCargoDocente.DIRECTOR;
            txtActividades.Text = FCargoDocente.DED_DESCRIPCION;
            txtFechaDesignacion.Text = FCargoDocente.LeerFecha("FECHA_DESIGNACION");
        }
        esGrado = pnlCargoGrado.Visible;
        popCargosDocentes.ShowOnPageLoad = true;
    }

    protected void Dedicacion_TextChanged(object sender, EventArgs e)
    {
        CalcularDedicaciones();
    }

    protected void Dedicacion_SelectedIndexChanged(object sender, EventArgs e)
    {
        CalcularDedicaciones();
    }

    protected void actualizarActividades()
    {
        if (grdCargos.FocusedRowIndex < 0) return;
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        string FCondicion = "ID_CARGOS_DOCENTES = " + grdCargos.GetRowValues(grdCargos.FocusedRowIndex, "ID_CARGOS_DOCENTES").ToString();
        grdActividades.DataSource = FGestor.LeerSQL("SELECT * FROM SIS_INSTRUCTIVOS.Q_DOC_CARGOS_ACT WHERE " + FCondicion);
        grdActividades.DataBind();
    }

    protected void CalcularDedicaciones()
    {
        if ((!sgwNucleo.Funciones.VerificarRequeridoInt(txtDedicacion1.Text)) ||
            (!sgwNucleo.Funciones.VerificarRequeridoInt(txtDedicacion2.Text)) ||
            (!sgwNucleo.Funciones.VerificarRequeridoInt(txtDedicacion3.Text)) ||
            (!sgwNucleo.Funciones.VerificarRequeridoInt(txtDedicacion4.Text)) ||
            (!sgwNucleo.Funciones.VerificarRequeridoInt(txtDedicacion5.Text)) ||
            (!sgwNucleo.Funciones.VerificarRequeridoInt(txtDedicacion6.Text)) ||
            (!sgwNucleo.Funciones.VerificarRequeridoInt(txtDedicacion7.Text))
            )
        {
            txtDedicacionP1.Text = "-";
            txtDedicacionP2.Text = "-";
            txtDedicacionP3.Text = "-";
            txtDedicacionP4.Text = "-";
            txtDedicacionP5.Text = "-";
            txtDedicacionP6.Text = "-";
            txtDedicacionP7.Text = "-";
            txtDedicacionTotal.Text = "-";
            txtDedicacionPTotal.Text = "-";
            return;
        }
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        DataSet FData;
        FData = FGestor.LeerSQL("SELECT CANTIDAD_SEMANAS FROM SIS_DOCENTES.TIPOS_DURACIONES_DED WHERE ID_TIPOS_DURACIONES_DED = " + ddlModalidad1.SelectedValue);
        txtDedicacionP1.Text = (float.Parse(txtDedicacion1.Text) * float.Parse(FData.Tables[0].Rows[0].ItemArray[0].ToString()) / 52).ToString();
        txtDedicacionP1.Text = txtDedicacionP1.Text.Substring(0, Math.Min(4, txtDedicacionP1.Text.Length));
        FData = FGestor.LeerSQL("SELECT CANTIDAD_SEMANAS FROM SIS_DOCENTES.TIPOS_DURACIONES_DED WHERE ID_TIPOS_DURACIONES_DED = " + ddlModalidad2.SelectedValue);
        txtDedicacionP2.Text = (float.Parse(txtDedicacion2.Text) * float.Parse(FData.Tables[0].Rows[0].ItemArray[0].ToString()) / 52).ToString();
        txtDedicacionP2.Text = txtDedicacionP2.Text.Substring(0, Math.Min(4, txtDedicacionP2.Text.Length));
        FData = FGestor.LeerSQL("SELECT CANTIDAD_SEMANAS FROM SIS_DOCENTES.TIPOS_DURACIONES_DED WHERE ID_TIPOS_DURACIONES_DED = " + ddlModalidad3.SelectedValue);
        txtDedicacionP3.Text = (float.Parse(txtDedicacion3.Text) * float.Parse(FData.Tables[0].Rows[0].ItemArray[0].ToString()) / 52).ToString();
        txtDedicacionP3.Text = txtDedicacionP3.Text.Substring(0, Math.Min(4, txtDedicacionP3.Text.Length));
        FData = FGestor.LeerSQL("SELECT CANTIDAD_SEMANAS FROM SIS_DOCENTES.TIPOS_DURACIONES_DED WHERE ID_TIPOS_DURACIONES_DED = " + ddlModalidad4.SelectedValue);
        txtDedicacionP4.Text = (float.Parse(txtDedicacion4.Text) * float.Parse(FData.Tables[0].Rows[0].ItemArray[0].ToString()) / 52).ToString();
        txtDedicacionP4.Text = txtDedicacionP4.Text.Substring(0, Math.Min(4, txtDedicacionP4.Text.Length));
        FData = FGestor.LeerSQL("SELECT CANTIDAD_SEMANAS FROM SIS_DOCENTES.TIPOS_DURACIONES_DED WHERE ID_TIPOS_DURACIONES_DED = " + ddlModalidad5.SelectedValue);
        txtDedicacionP5.Text = (float.Parse(txtDedicacion5.Text) * float.Parse(FData.Tables[0].Rows[0].ItemArray[0].ToString()) / 52).ToString();
        txtDedicacionP5.Text = txtDedicacionP5.Text.Substring(0, Math.Min(4, txtDedicacionP5.Text.Length));
        FData = FGestor.LeerSQL("SELECT CANTIDAD_SEMANAS FROM SIS_DOCENTES.TIPOS_DURACIONES_DED WHERE ID_TIPOS_DURACIONES_DED = " + ddlModalidad6.SelectedValue);
        txtDedicacionP6.Text = (float.Parse(txtDedicacion6.Text) * float.Parse(FData.Tables[0].Rows[0].ItemArray[0].ToString()) / 52).ToString();
        txtDedicacionP6.Text = txtDedicacionP6.Text.Substring(0, Math.Min(4, txtDedicacionP6.Text.Length));
        FData = FGestor.LeerSQL("SELECT CANTIDAD_SEMANAS FROM SIS_DOCENTES.TIPOS_DURACIONES_DED WHERE ID_TIPOS_DURACIONES_DED = " + ddlModalidad7.SelectedValue);
        txtDedicacionP7.Text = (float.Parse(txtDedicacion7.Text) * float.Parse(FData.Tables[0].Rows[0].ItemArray[0].ToString()) / 52).ToString();
        txtDedicacionP7.Text = txtDedicacionP7.Text.Substring(0, Math.Min(4, txtDedicacionP7.Text.Length));

        txtDedicacionTotal.Text = (int.Parse(txtDedicacion1.Text) + int.Parse(txtDedicacion2.Text) + int.Parse(txtDedicacion3.Text) +
            int.Parse(txtDedicacion4.Text) + int.Parse(txtDedicacion5.Text) + int.Parse(txtDedicacion6.Text) + int.Parse(txtDedicacion7.Text)).ToString();
        txtDedicacionPTotal.Text = (float.Parse(txtDedicacionP1.Text) + float.Parse(txtDedicacionP2.Text) + float.Parse(txtDedicacionP3.Text) +
            float.Parse(txtDedicacionP4.Text) + float.Parse(txtDedicacionP5.Text) + float.Parse(txtDedicacionP6.Text) + float.Parse(txtDedicacionP7.Text)).ToString();
        txtDedicacionPTotal.Text = txtDedicacionPTotal.Text.Substring(0, Math.Min(4, txtDedicacionPTotal.Text.Length));
    }

    protected void btnAceptarCargo_Click(object sender, EventArgs e)
    {
        sgwMulticapa.Objetos.CONEAU.Instructivos.CargoDocente FCargoDocente = new sgwMulticapa.Objetos.CONEAU.Instructivos.CargoDocente();
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        FGestor.ObtenerObjeto(FCargoDocente, grdCargos);
        FCargoDocente.ID_TIPOS_ESTADOS_CARGOS = 2;
        FCargoDocente.FECHA_REVISION_DOC = DateTime.Now;
        FCargoDocente.OBSERVACIONES = "";
        FGestor.GuardarObjeto(FCargoDocente);
        sgwNucleo.Pagina.CerrarPopup(popCargosDocentes);
        actualizarVinculaciones();
    }

    protected void btnCancelarCargo_Click(object sender, EventArgs e)
    {
        sgwMulticapa.Objetos.CONEAU.Instructivos.CargoDocente FCargoDocente = new sgwMulticapa.Objetos.CONEAU.Instructivos.CargoDocente();
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        FGestor.ObtenerObjeto(FCargoDocente, grdCargos);
        txtEscribir.Text = FCargoDocente.OBSERVACIONES;
        popEscribir.ShowOnPageLoad = true;
        sgwNucleo.Pagina.CerrarPopup(popCargosDocentes);
    }

    protected void btnAceptarEscribir_Click(object sender, EventArgs e)
    {
        if (!sgwNucleo.Funciones.VerificarRequerido(txtEscribir.Text))
        {
            sgwNucleo.Pagina.MostrarEstado("Debe ingresar el motivo del rechazo.", 1);
            return;
        }
        sgwMulticapa.Objetos.CONEAU.Instructivos.CargoDocente FCargoDocente = new sgwMulticapa.Objetos.CONEAU.Instructivos.CargoDocente();
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        FGestor.ObtenerObjeto(FCargoDocente, grdCargos);
        FCargoDocente.ID_TIPOS_ESTADOS_CARGOS = 3;
        FCargoDocente.FECHA_REVISION_DOC = DateTime.Now;
        FCargoDocente.OBSERVACIONES = txtEscribir.Text;
        FGestor.GuardarObjeto(FCargoDocente);
        sgwNucleo.Pagina.CerrarPopup(popEscribir);
        actualizarVinculaciones();
    }

    protected void btnCancelarEscribir_Click(object sender, EventArgs e)
    {
        sgwNucleo.Pagina.CerrarPopup(popEscribir);
    }



    protected void btnAprobarO_Click(object sender, EventArgs e)
    {
        if (grdVinculacionesO.FocusedRowIndex < 0) return;
        if (pnlNoAnda.Visible)
        {
            sgwNucleo.Pagina.MostrarEstado("No puede continuar debido a que no encontramos su currículum CVar.", 1);
            return;
        }
        if (!tieneTituloMaximo())
        {
            sgwNucleo.Pagina.MostrarEstado("Para continuar debe ingresar su formación (título obtenido).", 1);
            return;
        }
        string FSQL = "UPDATE " + grdVinculacionesO.GetRowValues(grdVinculacionesO.FocusedRowIndex, "TABLA").ToString() + " SET " +
            "ID_TIPOS_ESTADOS_CARGOS = 2 WHERE " + grdVinculacionesO.GetRowValues(grdVinculacionesO.FocusedRowIndex, "CAMPO_CLAVE").ToString() +
            " = " + grdVinculacionesO.GetRowValues(grdVinculacionesO.FocusedRowIndex, "CLAVE").ToString();
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        FGestor.EscribirSQL(FSQL);
        actualizarVinculacionesOtras();
    }

    protected void btnRechazarO_Click(object sender, EventArgs e)
    {
        if (grdVinculacionesO.FocusedRowIndex < 0) return;
        if (pnlNoAnda.Visible)
        {
            sgwNucleo.Pagina.MostrarEstado("No puede continuar debido a que no encontramos su currículum CVar.", 1);
            return;
        }
        if (!tieneTituloMaximo())
        {
            sgwNucleo.Pagina.MostrarEstado("Para continuar debe ingresar su formación (título obtenido).", 1);
            return;
        }
        string FSQL = "UPDATE " + grdVinculacionesO.GetRowValues(grdVinculacionesO.FocusedRowIndex, "TABLA").ToString() + " SET " +
            "ID_TIPOS_ESTADOS_CARGOS = 3 WHERE " + grdVinculacionesO.GetRowValues(grdVinculacionesO.FocusedRowIndex, "CAMPO_CLAVE").ToString() +
            " = " + grdVinculacionesO.GetRowValues(grdVinculacionesO.FocusedRowIndex, "CLAVE").ToString();
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        FGestor.EscribirSQL(FSQL);
        actualizarVinculacionesOtras();
    }

}
