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
            DataSet FData = FGestor.LeerSQL("SELECT SEXO, PRIMER_NOMBRE FROM SIS_MAINFRAME.USUARIOS WHERE ID_USUARIOS = " + Session["UsuarioID"]);
            if (FData.Tables[0].Rows[0].ItemArray[0].ToString() == "F") lblBienvenido.Text = "Bienvenida, " + Session["UsuarioDescripcion"].ToString();
            else
                if (FData.Tables[0].Rows[0].ItemArray[0].ToString() == "M") lblBienvenido.Text = "Bienvenido, " + Session["UsuarioDescripcion"].ToString();
                else
                    lblBienvenido.Text = "Bienvenida/o, " + Session["UsuarioDescripcion"].ToString();
            lblNombre.Text = FData.Tables[0].Rows[0].ItemArray[1].ToString();
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
                VerificarCVArExistente();
            }

        }

        leerDatosVinculacion();
        if (pnlVinculacionCargo.Visible)
            actualizarActividades();
    }

    protected void btnCrearCVAR_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://cvar.sicytar.mincyt.gob.ar/auth/newreg.jsp");
    }

    protected void VerificarCVArExistente()
    {
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

    protected void leerDatosVinculacion()
    {
        if ((Request["id"] == null) || (Request["tipo"] == null))
        {
            Response.Redirect("default.aspx");
            return;
        }
        pnlVinculacionCargo.Visible = Request["tipo"].ToString() == "1";
        pnlVinculacionOtro.Visible = !pnlVinculacionCargo.Visible;
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();

        // Vinculación a un cargo docente
        if (pnlVinculacionCargo.Visible)
        {
            sgwMulticapa.Objetos.CONEAU.Instructivos.CargoDocente FCargoDocente = new sgwMulticapa.Objetos.CONEAU.Instructivos.CargoDocente();
            FGestor.ObtenerObjeto(FCargoDocente, int.Parse(Request["id"].ToString()));
            if (FCargoDocente.ID_DOCENTES != int.Parse(Session["ID_DOCENTES"].ToString()))
            {
                Response.Redirect("default.aspx");
                return;
            }
            if (FCargoDocente.ID_TIPOS_ESTADOS_CARGOS != 1)
            {
                Response.Redirect("default.aspx");
                return;
            }
            DataSet FData = FGestor.LeerSQL("SELECT P.ID_ESTADOS_PRESENTACIONES FROM SIS_INSTRUCTIVOS.PRESENTACIONES P, SIS_INSTRUCTIVOS.PRESENTACIONES_UA PUA " +
                " WHERE P.ID_PRESENTACIONES = PUA.ID_PRESENTACIONES AND PUA.ID_PRESENTACIONES_UA = " + FCargoDocente.ID_PRESENTACIONES_UA);
            if (FData.Tables[0].Rows[0].ItemArray[0].ToString() == "2")
            {
                Response.Redirect("default.aspx");
                return;
            }
            FData = FGestor.LeerSQL("SELECT * FROM SIS_INSTRUCTIVOS.Q_CARGOS_DOCENTES WHERE ID_CARGOS_DOCENTES = " + Request["id"].ToString());
            txtInstitucion.Text = FData.Tables[0].Rows[0]["INSTITUCION"].ToString();
            txtUnidadAcademica.Text = FData.Tables[0].Rows[0]["UNIDAD_ACADEMICA"].ToString() + " (" +
                FData.Tables[0].Rows[0]["LOCALIZACION"].ToString() + ")";
            txtTipoCargo.Text = FData.Tables[0].Rows[0]["TIPO_CARGO"].ToString();
            txtDesignacion.Text = FData.Tables[0].Rows[0]["TIPO_DESIGNACION"].ToString();
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
            pnlCargoGrado.Visible = FData.Tables[0].Rows[0]["ID_NIVELES_EDUCATIVOS"].ToString() == "2";
            pnlCargoPosgrado.Visible = !pnlCargoGrado.Visible;
            pnlCargoPosgrado2.Visible = !pnlCargoGrado.Visible;
            pnlActividadesCurriculares.Visible = pnlCargoGrado.Visible;
            if (pnlCargoPosgrado.Visible)
            {
                if (FCargoDocente.PLANTEL_DOCENTE) txtPertenencia.Text = "Plantel docente"; else txtPertenencia.Text = "Cuerpo de tutores";
                if (FCargoDocente.VINCULO_ESTABLE) txtTipoVinculo.Text = "Estable"; else txtTipoVinculo.Text = "Invitado";
                txtCargoCarrera.Text = FData.Tables[0].Rows[0]["CARRERAS"].ToString();
                chkCargoDirector.Checked = FCargoDocente.DIRECTOR;
                txtActividades.Text = FCargoDocente.DED_DESCRIPCION;
                txtFechaDesignacion.Text = FCargoDocente.LeerFecha("FECHA_DESIGNACION");
            }
            esGrado = pnlCargoGrado.Visible;
        }

        // Otras vinculaciones
        else
        {

            DataSet FData = FGestor.LeerSQL("SELECT * FROM SIS_INSTRUCTIVOS.Q_OTRAS_VINCULACIONES WHERE ID_CLAVE = '" + 
                Request["id"].ToString()  + "' AND ID_DOCENTES = " + Session["ID_DOCENTES"].ToString());
            if (FData.Tables[0].Rows.Count == 0)
            {
                Response.Redirect("default.aspx");
                return;
            }
            txtOtroInstitucion.Text = FData.Tables[0].Rows[0]["INSTITUCION"].ToString();
            txtOtroTipo.Text = FData.Tables[0].Rows[0]["TIPO_VINCULACION"].ToString();
            txtOtroVinculado.Text = FData.Tables[0].Rows[0]["DENOMINACION"].ToString();

        }
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
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        string FCondicion = "ID_CARGOS_DOCENTES = " + Request["id"].ToString();
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
        txtDedicacionTotal.Text = (int.Parse(txtDedicacion1.Text) + int.Parse(txtDedicacion2.Text) + int.Parse(txtDedicacion3.Text) +
            int.Parse(txtDedicacion4.Text) + int.Parse(txtDedicacion5.Text) + int.Parse(txtDedicacion6.Text) + int.Parse(txtDedicacion7.Text)).ToString();
        if (!esGrado) return;
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

        txtDedicacionPTotal.Text = (float.Parse(txtDedicacionP1.Text) + float.Parse(txtDedicacionP2.Text) + float.Parse(txtDedicacionP3.Text) +
            float.Parse(txtDedicacionP4.Text) + float.Parse(txtDedicacionP5.Text) + float.Parse(txtDedicacionP6.Text) + float.Parse(txtDedicacionP7.Text)).ToString();
        txtDedicacionPTotal.Text = txtDedicacionPTotal.Text.Substring(0, Math.Min(4, txtDedicacionPTotal.Text.Length));
    }

    protected void btnAceptarCargo_Click(object sender, EventArgs e)
    {
        sgwMulticapa.Objetos.CONEAU.Instructivos.CargoDocente FCargoDocente = new sgwMulticapa.Objetos.CONEAU.Instructivos.CargoDocente();
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        FGestor.ObtenerObjeto(FCargoDocente, int.Parse(Request["id"].ToString()));
        FCargoDocente.ID_TIPOS_ESTADOS_CARGOS = 2;
        FCargoDocente.FECHA_REVISION_DOC = DateTime.Now;
        FCargoDocente.OBSERVACIONES = "";
        FGestor.GuardarObjeto(FCargoDocente);
        Response.Redirect("default.aspx");
    }

    protected void btnCancelarCargo_Click(object sender, EventArgs e)
    {
        sgwMulticapa.Objetos.CONEAU.Instructivos.CargoDocente FCargoDocente = new sgwMulticapa.Objetos.CONEAU.Instructivos.CargoDocente();
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        FGestor.ObtenerObjeto(FCargoDocente, int.Parse(Request["id"].ToString()));
        txtEscribir.Text = FCargoDocente.OBSERVACIONES;
        pnlVinculacionCargo.Visible = false;
        pnlEscribir.Visible = true;
    }

    protected void btnAceptarEscribir_Click(object sender, EventArgs e)
    {
        if (!sgwNucleo.Funciones.VerificarRequerido(txtEscribir.Text))
        {
            sgwNucleo.Pagina.MostrarEstado("Debe ingresar el motivo del rechazo.", 1);
            pnlVinculacionCargo.Visible = false;
            pnlEscribir.Visible = true;
            return;
        }
        sgwMulticapa.Objetos.CONEAU.Instructivos.CargoDocente FCargoDocente = new sgwMulticapa.Objetos.CONEAU.Instructivos.CargoDocente();
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        FGestor.ObtenerObjeto(FCargoDocente, int.Parse(Request["id"].ToString()));
        FCargoDocente.ID_TIPOS_ESTADOS_CARGOS = 3;
        FCargoDocente.FECHA_REVISION_DOC = DateTime.Now;
        FCargoDocente.OBSERVACIONES = txtEscribir.Text;
        FGestor.GuardarObjeto(FCargoDocente);
        pnlVinculacionCargo.Visible = true;
        pnlEscribir.Visible = false;
        Response.Redirect("default.aspx");
    }

    protected void btnCancelarEscribir_Click(object sender, EventArgs e)
    {
        pnlVinculacionCargo.Visible = true;
        pnlEscribir.Visible = false;
    }


    protected void btnOtroAprobar_Click(object sender, EventArgs e)
    {
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        DataSet FData = FGestor.LeerSQL("SELECT * FROM SIS_INSTRUCTIVOS.Q_OTRAS_VINCULACIONES WHERE ID_CLAVE = '" +
            Request["id"].ToString() + "' AND ID_DOCENTES = " + Session["ID_DOCENTES"].ToString());
        FGestor.EscribirSQL("UPDATE " + FData.Tables[0].Rows[0]["TABLA"].ToString() + " SET " +
            "ID_TIPOS_ESTADOS_CARGOS = 2 WHERE " + FData.Tables[0].Rows[0]["CAMPO_CLAVE"].ToString() +
            " = " + FData.Tables[0].Rows[0]["CLAVE"].ToString());
        pnlVinculacionOtro.Visible = true;
        pnlEscribir.Visible = false;
        Response.Redirect("default.aspx");
    }

    protected void btnOtroRechazar_Click(object sender, EventArgs e)
    {
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        DataSet FData = FGestor.LeerSQL("SELECT * FROM SIS_INSTRUCTIVOS.Q_OTRAS_VINCULACIONES WHERE ID_CLAVE = '" +
            Request["id"].ToString() + "' AND ID_DOCENTES = " + Session["ID_DOCENTES"].ToString());
        FGestor.EscribirSQL("UPDATE " + FData.Tables[0].Rows[0]["TABLA"].ToString() + " SET " +
            "ID_TIPOS_ESTADOS_CARGOS = 3 WHERE " + FData.Tables[0].Rows[0]["CAMPO_CLAVE"].ToString() +
            " = " + FData.Tables[0].Rows[0]["CLAVE"].ToString());
        pnlVinculacionOtro.Visible = true;
        pnlEscribir.Visible = false;
        Response.Redirect("default.aspx");
    }



}
