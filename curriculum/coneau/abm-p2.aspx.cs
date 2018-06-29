using System;
using System.Xml;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using sgwMulticapa.Gestor;
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
            FDatos = FGestor.LeerSQL("SELECT ID_TIPOS_TITULOS, TIPO_TITULO FROM SIS_UNIVERSIDADES.TIPOS_TITULOS WHERE ID_TIPOS_TITULOS BETWEEN 4 AND 6");
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbTitulosPosgradoTipo, FDatos, false, false);
            FDatos = FGestor.LeerSQL("SELECT ID_INSTITUCIONES, INSTITUCION FROM SIS_UNIVERSIDADES.INSTITUCIONES WHERE ID_ESTADOS_INSTITUCIONES = 1 ORDER BY INSTITUCION");
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbTitulosGradoInstitucionOtorgante, FDatos, false, false);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbTitulosPosgradoInstitucionOtorgante, FDatos, false, false);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbOtrosTitulosInstitucion, FDatos, true, false);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCarrerasFormacionDocenteInstituciones, FDatos, true, false);
            FDatos = FGestor.LeerSQL("SELECT ID_PAISES, PAIS FROM SIS_CONEAU.PAISES");
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbTitulosGradoPais, FDatos, false, false);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbTitulosPosgradoPais, FDatos, false, false);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbOtrosTitulosPais, FDatos, false, false);
            actualizarDatos();
        }
        actualizarDatosTitulosGrado();
        actualizarDatosTitulosPosgrado();
        actualizarDatosOtrosTitulos();
        actualizarDatosCarreraDocente();
        actualizarTituloMaximo();
    }



    #region DatosGenerales

    protected bool guardar()
    {
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        Docente FDocente = new Docente();
        FGestor.ObtenerObjeto(FDocente, int.Parse(Session["ID_DOCENTES"].ToString()));
        FDocente.CARRERA_DOCENTE = chkCarreraDocente.Checked;
        return FGestor.GuardarObjeto(FDocente);
    }

    protected void btnGuardarC_Click(object sender, EventArgs e)
    {
        if (guardar())
            Response.Redirect("abm-p3.aspx");
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
        if (Session["CVAR"].ToString() == "S")
        {
            return;
        }

        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        Docente FDocente = new Docente();
        FGestor.ObtenerObjeto(FDocente, int.Parse(Session["ID_DOCENTES"].ToString()));
        chkCarreraDocente.Checked = FDocente.CARRERA_DOCENTE;
    }

    protected void actualizarTituloMaximo()
    {
        if (Session["CVAR"].ToString() == "S")
        {
            return;
        }
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        DataSet FDatos;
        //if (Session["ID_PRESENTACIONES"] == null)
        //{

        if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
            FDatos = FGestor.LeerSQL("SELECT SIS_DOCENTES.PKG_DOCENTES.OBTENER_TITULO_MAXIMO_PRES(" + Session["ID_DOCENTES"] + ", " + Session["ID_PRESENTACIONES"].ToString() + ") FROM DUAL");
        else
            FDatos = FGestor.LeerSQL("SELECT SIS_DOCENTES.PKG_DOCENTES.OBTENER_TITULO_MAXIMO(" + Session["ID_DOCENTES"] + ") FROM DUAL");
        edtDocenteTituloMaximo.Text = FDatos.Tables[0].Rows[0].ItemArray[0].ToString();






        //}
        //else
        //{
        //    FDatos = FGestor.LeerSQL("SELECT TIPO_TITULO FROM SIS_INSTRUCTIVOS.DOCENTES_PRES_TITULOS T,  SIS_UNIVERSIDADES.TIPOS_TITULOS P  WHERE T.ID_PRESENTACIONES = " + Session["ID_PRESENTACIONES"].ToString() +
        //            " AND T.ID_TIPOS_TITULOS = P.ID_TIPOS_TITULOS AND T.ID_DOCENTES = " + Session["ID_DOCENTES"].ToString());
        //    if (FDatos.Tables[0].Rows.Count > 0) { edtDocenteTituloMaximo.Text = FDatos.Tables[0].Rows[0].ItemArray[0].ToString(); }
        //    else {
        //        FDatos = FGestor.LeerSQL("SELECT SIS_DOCENTES.PKG_DOCENTES.OBTENER_TITULO_MAXIMO(" + Session["ID_DOCENTES"] + ") FROM DUAL");
        //        edtDocenteTituloMaximo.Text = FDatos.Tables[0].Rows[0].ItemArray[0].ToString();
            
        //    }
           
               
        //}
    }

    #endregion



    #region TitulosGrado

    // Botones ABM Titulos Grado
    protected void actualizarDatosTitulosGrado()
    {
        if (Session["CVAR"].ToString() == "S")
        {
            return;
        }
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        string FCondicion = " ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
        if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
            FCondicion += " AND ((FECHA_ALTA - 1) <= '" + Session["FECHA_PRESENTADA"].ToString() + "' OR FECHA_ALTA IS NULL)";
        grdTitulosGradoABM.DataSource = FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_TITULOS WHERE ID_TIPOS_TITULOS = 3 AND " + FCondicion);
        grdTitulosGradoABM.DataBind();
    }

    protected void btnAgregarTituloGrado_Click(object sender, EventArgs e)
    {
        cmbTitulosGradoPais.SelectedValue = Session["ID_PAISES"].ToString();
        cmbTitulosGradoPais_SelectedIndexChanged(sender, e);
        edtTitulosGradoAnioObtencion.Text = "";
        edtTitulosGradoOtraInstitucionOtorgante.Text = "";
        edtTitulosGradoTituloObtenido.Text = "";
        cmbTitulosGradoInstitucionOtorgante.SelectedIndex = 0;
        Session["OperacionDetalle"] = "1";
        popTitulosGrado.ShowOnPageLoad = true;
    }

    protected void btnModificarTituloGrado_Click(object sender, EventArgs e)
    {
        if (grdTitulosGradoABM.FocusedRowIndex < 0) return;
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        Titulo FTitulo = new Titulo();
        FGestor.ObtenerObjeto(FTitulo, grdTitulosGradoABM);
        Session["OperacionDetalle"] = "2";
        cmbTitulosGradoPais.SelectedValue = FTitulo.ID_PAISES.ToString();
        cmbTitulosGradoPais_SelectedIndexChanged(sender, e);
        edtTitulosGradoAnioObtencion.Text = FTitulo.ANIO_OBTENCION.ToString();
        edtTitulosGradoOtraInstitucionOtorgante.Text = FTitulo.OTRA_INSTITUCION;
        edtTitulosGradoTituloObtenido.Text = FTitulo.TITULO;
        if (FTitulo.ID_PAISES == 13)
        {
            if (FTitulo.ID_INSTITUCIONES.ToString() != "0" )
            cmbTitulosGradoInstitucionOtorgante.SelectedValue = FTitulo.ID_INSTITUCIONES.ToString();
        
        }

           



        popTitulosGrado.ShowOnPageLoad = true;
    }

    protected void btnEliminarTituloGrado_Click(object sender, EventArgs e)
    {
        if (grdTitulosGradoABM.FocusedRowIndex < 0) return;
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        Titulo FTitulo = new Titulo();
        FGestor.ObtenerObjeto(FTitulo, grdTitulosGradoABM);
        FGestor.EliminarObjeto(FTitulo);
        actualizarDatosTitulosGrado();
        actualizarTituloMaximo();
    }

    protected void cmbTitulosGradoPais_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlTitulosGradoInstitucionOtorgante.Visible = cmbTitulosGradoPais.SelectedValue == "13";
        pnlTitulosGradoOtraInstitucionOtorgante.Visible = !pnlTitulosGradoInstitucionOtorgante.Visible;
    }


    // Botones Popup Titulos Grado
    protected void btnGuardarTituloGrado_Click(object sender, EventArgs e)
    {
        // Requeridos
        string FEstado = "";
        if (!sgwNucleo.Funciones.VerificarRequerido(edtTitulosGradoTituloObtenido.Text))
            FEstado = "la denominación del título";
        else
            if (!sgwNucleo.Funciones.VerificarRequeridoInt(edtTitulosGradoAnioObtencion.Text))
                FEstado = "el año de obtención";
            else
                if ((pnlTitulosGradoOtraInstitucionOtorgante.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtTitulosGradoOtraInstitucionOtorgante.Text)))
                    FEstado = "la institución otorgante";
        if (FEstado != "")
        {
            sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
            return;
        }
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        Titulo FTitulo = new Titulo();
        if (Session["OperacionDetalle"].ToString() == "1")
        {
            FTitulo.ID_TIPOS_TITULOS = 3;
            FTitulo.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
        }
        else
            FGestor.ObtenerObjeto(FTitulo, grdTitulosGradoABM);
        FTitulo.ID_PAISES = int.Parse(cmbTitulosGradoPais.SelectedValue);
        FTitulo.ANIO_OBTENCION = int.Parse(edtTitulosGradoAnioObtencion.Text);
        FTitulo.TITULO = edtTitulosGradoTituloObtenido.Text;
        if (FTitulo.ID_PAISES == 13)
        {
            FTitulo.ID_INSTITUCIONES = int.Parse(cmbTitulosGradoInstitucionOtorgante.SelectedValue);
            FTitulo.OTRA_INSTITUCION = "";
        }
        else
        {
            FTitulo.ID_INSTITUCIONES = 0;
            FTitulo.OTRA_INSTITUCION = edtTitulosGradoOtraInstitucionOtorgante.Text;
        }
        FGestor.GuardarObjeto(FTitulo);
        actualizarDatosTitulosGrado();
        actualizarTituloMaximo();
        sgwNucleo.Pagina.CerrarPopup(popTitulosGrado);
    }
    protected void btnCancelarTituloGrado_Click(object sender, EventArgs e)
    {
        sgwNucleo.Pagina.CerrarPopup(popTitulosGrado);
    }

    #endregion



    #region TitulosPosgrado

    // Botnes ABM Titulos posgrado
    protected void actualizarDatosTitulosPosgrado()
    {

        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        string FCondicion = " ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
        if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
            FCondicion += " AND ((FECHA_ALTA - 1) <= '" + Session["FECHA_PRESENTADA"].ToString() + "' OR FECHA_ALTA IS NULL)";
        grdTitulosPosgradoABM.DataSource = FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_TITULOS WHERE ID_TIPOS_TITULOS BETWEEN 4 AND 6 AND " + FCondicion);
        grdTitulosPosgradoABM.DataBind();
    }

    protected void btnAgregarTituloPosgrado_Click(object sender, EventArgs e)
    {
        cmbTitulosPosgradoPais.SelectedValue = Session["ID_PAISES"].ToString();
        cmbTitulosPosgradoPais_SelectedIndexChanged(sender, e);
        edtTitulosPosgradoAnioObtencion.Text = "";
        edtTitulosPosgradoOtraInstitucionOtorgante.Text = "";
        edtTitulosPosgradoTituloObtenido.Text = "";
        cmbTitulosPosgradoTipo.SelectedIndex = 0;
        cmbTitulosPosgradoInstitucionOtorgante.SelectedIndex = 0;
        Session["OperacionDetalle"] = "1";
        popTitulosPosgrado.ShowOnPageLoad = true;
    }

    protected void btnModificarTituloPosgrado_Click(object sender, EventArgs e)
    {
        if (grdTitulosPosgradoABM.FocusedRowIndex < 0) return;
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        Titulo FTitulo = new Titulo();
        FGestor.ObtenerObjeto(FTitulo, grdTitulosPosgradoABM);
        Session["OperacionDetalle"] = "2";
        cmbTitulosPosgradoPais.SelectedValue = FTitulo.ID_PAISES.ToString();
        cmbTitulosPosgradoPais_SelectedIndexChanged(sender, e);
        edtTitulosPosgradoAnioObtencion.Text = FTitulo.ANIO_OBTENCION.ToString();
        edtTitulosPosgradoOtraInstitucionOtorgante.Text = FTitulo.OTRA_INSTITUCION;
        edtTitulosPosgradoTituloObtenido.Text = FTitulo.TITULO;
        cmbTitulosPosgradoTipo.SelectedValue = FTitulo.ID_TIPOS_TITULOS.ToString();
        if (FTitulo.ID_PAISES == 13)
        {
            if (FTitulo.ID_INSTITUCIONES.ToString() != "0")

                cmbTitulosPosgradoInstitucionOtorgante.SelectedValue = FTitulo.ID_INSTITUCIONES.ToString();

        }

        popTitulosPosgrado.ShowOnPageLoad = true;
    }

    protected void btnEliminarTituloPosgrado_Click(object sender, EventArgs e)
    {
        if (grdTitulosPosgradoABM.FocusedRowIndex < 0) return;
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        Titulo FTitulo = new Titulo();
        FGestor.ObtenerObjeto(FTitulo, grdTitulosPosgradoABM);
        FGestor.EliminarObjeto(FTitulo);
        actualizarDatosTitulosPosgrado();
        actualizarTituloMaximo();
    }

    protected void cmbTitulosPosgradoPais_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlTitulosPosgradoInstitucionOtorgante.Visible = cmbTitulosPosgradoPais.SelectedValue == "13";
        pnlTitulosPosgradoOtraInstitucionOtorgante.Visible = !pnlTitulosPosgradoInstitucionOtorgante.Visible;
    }


    // Botones Popup Titulos Posgrado
    protected void btnGuardarTituloPosgrado_Click(object sender, EventArgs e)
    {
        // Requeridos
        string FEstado = "";
        if (!sgwNucleo.Funciones.VerificarRequerido(edtTitulosPosgradoTituloObtenido.Text))
            FEstado = "la denominación del título";
        else
            if (!sgwNucleo.Funciones.VerificarRequeridoInt(edtTitulosPosgradoAnioObtencion.Text))
                FEstado = "el año de obtención";
            else
                if ((pnlTitulosPosgradoOtraInstitucionOtorgante.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtTitulosPosgradoOtraInstitucionOtorgante.Text)))
                    FEstado = "la institución otorgante";
        if (FEstado != "")
        {
            sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
            return;
        }
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        Titulo FTitulo = new Titulo();
        if (Session["OperacionDetalle"].ToString() == "1")
            FTitulo.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
        else
            FGestor.ObtenerObjeto(FTitulo, grdTitulosPosgradoABM);
        FTitulo.ID_TIPOS_TITULOS = int.Parse(cmbTitulosPosgradoTipo.SelectedValue);
        FTitulo.ID_PAISES = int.Parse(cmbTitulosPosgradoPais.SelectedValue);
        FTitulo.ANIO_OBTENCION = int.Parse(edtTitulosPosgradoAnioObtencion.Text);
        FTitulo.TITULO = edtTitulosPosgradoTituloObtenido.Text;
        if (FTitulo.ID_PAISES == 13)
        {
            FTitulo.ID_INSTITUCIONES = int.Parse(cmbTitulosPosgradoInstitucionOtorgante.SelectedValue);
            FTitulo.OTRA_INSTITUCION = "";
        }
        else
        {
            FTitulo.ID_INSTITUCIONES = 0;
            FTitulo.OTRA_INSTITUCION = edtTitulosPosgradoOtraInstitucionOtorgante.Text;
        }
        FGestor.GuardarObjeto(FTitulo);
        actualizarDatosTitulosPosgrado();
        actualizarTituloMaximo();
        sgwNucleo.Pagina.CerrarPopup(popTitulosPosgrado);
    }
    protected void btnCancelarTituloPosgrado_Click(object sender, EventArgs e)
    {
        sgwNucleo.Pagina.CerrarPopup(popTitulosPosgrado);
    }

    #endregion



    #region OtrosTitulos

    // Botones ABM Otros titulos
    protected void actualizarDatosOtrosTitulos()
    {
        if (Session["CVAR"].ToString() == "S")
        {
            return;
        }

        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        string FCondicion = " ID_DOCENTES = " + Session["ID_DOCENTES"].ToString();
        if ((Session["ID_ESTADOS_PRESENTACIONES"] != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() == "2") && (Session["FECHA_PRESENTADA"] != null) && (Session["FECHA_PRESENTADA"].ToString() != ""))
            FCondicion += " AND ((FECHA_ALTA - 1) <= '" + Session["FECHA_PRESENTADA"].ToString() + "' OR FECHA_ALTA IS NULL)";
        grdOtrosTitulosABM.DataSource = FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_TITULOS WHERE ID_TIPOS_TITULOS = 2 AND " + FCondicion);
        grdOtrosTitulosABM.DataBind();
    }

    protected void btnAgregarOtroTitulo_Click(object sender, EventArgs e)
    {
        cmbOtrosTitulosPais.SelectedValue = Session["ID_PAISES"].ToString();
        cmbOtrosTitulosPais_SelectedIndexChanged(sender, e);
        edtOtrosTitulosAnioObtencion.Text = "";
        edtOtrosTitulosOtraInstitucion.Text = "";
        edtOtrosTitulosTituloObtenido.Text = "";
        cmbOtrosTitulosInstitucion.SelectedIndex = 0;
        Session["OperacionDetalle"] = "1";
        popOtrosTitulos.ShowOnPageLoad = true;
    }

    protected void btnModificarOtroTitulo_Click(object sender, EventArgs e)
    {
        if (grdOtrosTitulosABM.FocusedRowIndex < 0) return;
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        Titulo FTitulo = new Titulo();
        FGestor.ObtenerObjeto(FTitulo, grdOtrosTitulosABM);
        Session["OperacionDetalle"] = "2";
        cmbOtrosTitulosPais.SelectedValue = FTitulo.ID_PAISES.ToString();
        cmbOtrosTitulosPais_SelectedIndexChanged(sender, e);
        edtOtrosTitulosAnioObtencion.Text = FTitulo.ANIO_OBTENCION.ToString();
        edtOtrosTitulosOtraInstitucion.Text = FTitulo.OTRA_INSTITUCION;
        edtOtrosTitulosTituloObtenido.Text = FTitulo.TITULO;
        if (FTitulo.ID_PAISES == 13)
        {
            if (FTitulo.ID_INSTITUCIONES.ToString() == "0") 
            { 
                cmbOtrosTitulosInstitucion.SelectedValue = "-1";
                cmbOtrosTitulosInstitucion_SelectedIndexChanged(sender, e);
            
            }
            else cmbOtrosTitulosInstitucion.SelectedValue = FTitulo.ID_INSTITUCIONES.ToString();
        }
        popOtrosTitulos.ShowOnPageLoad = true;
    }

    protected void btnEliminarOtroTitulo_Click(object sender, EventArgs e)
    {
        if (grdOtrosTitulosABM.FocusedRowIndex < 0) return;
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        Titulo FTitulo = new Titulo();
        FGestor.ObtenerObjeto(FTitulo, grdOtrosTitulosABM);
        FGestor.EliminarObjeto(FTitulo);
        actualizarDatosOtrosTitulos();
        actualizarTituloMaximo();
    }

    protected void cmbOtrosTitulosPais_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlOtrosTitulosInstitucionOtorgante.Visible = cmbOtrosTitulosPais.SelectedValue == "13";
        pnlOtrosTitulosOtraInstitucionOtorgante.Visible = !pnlOtrosTitulosInstitucionOtorgante.Visible;
    }

    protected void cmbOtrosTitulosInstitucion_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlOtrosTitulosOtraInstitucionOtorgante.Visible = cmbOtrosTitulosInstitucion.SelectedValue == "-1";
        pnlOtrosTitulosInstitucionOtorgante.Visible = !pnlOtrosTitulosOtraInstitucionOtorgante.Visible;
    }
    
    // Botones Popup Otros Titulos
    protected void btnGuardarOtroTitulo_Click(object sender, EventArgs e)
    {
        // Requeridos
        string FEstado = "";
        if (!sgwNucleo.Funciones.VerificarRequerido(edtOtrosTitulosTituloObtenido.Text))
            FEstado = "la denominación del título";
        else
            if (!sgwNucleo.Funciones.VerificarRequeridoInt(edtOtrosTitulosAnioObtencion.Text))
                FEstado = "el año de obtención";
            else
                if ((pnlOtrosTitulosOtraInstitucionOtorgante.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtOtrosTitulosOtraInstitucion.Text)))
                    FEstado = "la institución otorgante";
        if (FEstado != "")
        {
            sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
            return;
        }
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        Titulo FTitulo = new Titulo();
        if (Session["OperacionDetalle"].ToString() == "1")
        {
            FTitulo.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
            FTitulo.ID_TIPOS_TITULOS = 2;
        }
        else
            FGestor.ObtenerObjeto(FTitulo, grdOtrosTitulosABM);
        FTitulo.ID_PAISES = int.Parse(cmbOtrosTitulosPais.SelectedValue);
        FTitulo.ANIO_OBTENCION = int.Parse(edtOtrosTitulosAnioObtencion.Text);
        FTitulo.TITULO = edtOtrosTitulosTituloObtenido.Text;
        //if (FTitulo.ID_PAISES == 13)
        //{
            
        //    FTitulo.ID_INSTITUCIONES = int.Parse(cmbOtrosTitulosInstitucion.SelectedValue);
        //    FTitulo.OTRA_INSTITUCION = "";
        //}
        //else
        //{
        //    FTitulo.ID_INSTITUCIONES = 0;
        //    FTitulo.OTRA_INSTITUCION = edtOtrosTitulosOtraInstitucion.Text;
        //}
        if (!pnlOtrosTitulosOtraInstitucionOtorgante.Visible)
        {

            FTitulo.ID_INSTITUCIONES = int.Parse(cmbOtrosTitulosInstitucion.SelectedValue);
            FTitulo.OTRA_INSTITUCION = "";
        }
        else
        {
            FTitulo.ID_INSTITUCIONES = 0;
            FTitulo.OTRA_INSTITUCION = edtOtrosTitulosOtraInstitucion.Text;
        }


        FGestor.GuardarObjeto(FTitulo);
        actualizarDatosOtrosTitulos();
        actualizarTituloMaximo();
        sgwNucleo.Pagina.CerrarPopup(popOtrosTitulos);
    }
    protected void btnCancelarOtroTitulo_Click(object sender, EventArgs e)
    {
        sgwNucleo.Pagina.CerrarPopup(popOtrosTitulos);
    }

    #endregion



    #region CarreraDocente

    // Botones ABM Carrera formacion docente
    protected void actualizarDatosCarreraDocente()
    {
        if (Session["CVAR"].ToString() == "S")
        {
            return;
        }

        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        grdCarreraFormacionDocenteABM.DataSource = FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_CARRERAS_DOCENTES WHERE " +
            "ID_DOCENTES = " + Session["ID_DOCENTES"]);
        grdCarreraFormacionDocenteABM.DataBind();
    }

    protected void btnAgregarCarreraFormacionDocente_Click(object sender, EventArgs e)
    {
        edtCarrerasFormacionDocenteAnioObtencion.Text = "";
        edtCarrerasFormacionDocenteTitulo.Text = "";
        cmbCarrerasFormacionDocenteInstituciones.SelectedIndex = 0;
        cmbCarrerasFormacionDocenteInstituciones_SelectedIndexChanged(sender, e);
        cmbCarrerasFormacionDocenteUA.SelectedIndex = 0;
        cmbCarrerasFormacionDocenteUA_SelectedIndexChanged(sender, e);
        Session["OperacionDetalle"] = "1";
        popCarrerasFormacionDocente.ShowOnPageLoad = true;
    }

    protected void btnModificarCarreraFormacionDocente_Click(object sender, EventArgs e)
    {
        if (grdCarreraFormacionDocenteABM.FocusedRowIndex < 0) return;
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        CarreraDocente FCarreraDocente = new CarreraDocente();
        FGestor.ObtenerObjeto(FCarreraDocente, grdCarreraFormacionDocenteABM);
        Session["OperacionDetalle"] = "2";
        edtCarrerasFormacionDocenteAnioObtencion.Text = FCarreraDocente.ANIO_OBTENCION.ToString();
        edtCarrerasFormacionDocenteTitulo.Text = FCarreraDocente.TITULO;
        edtCarrerasFormacionDocenteDuracion.Text = FCarreraDocente.DURACION_CARRERA.ToString();
        if (FCarreraDocente.INSTITUCION_UNIV)
        {
            cmbCarrerasFormacionDocenteInstituciones.SelectedValue = FCarreraDocente.ID_INSTITUCIONES.ToString();
            edtCarrerasFormacionDocenteOtraInst.Text = "";
        }
        else
        {
            cmbCarrerasFormacionDocenteInstituciones.SelectedValue = "-1";
            edtCarrerasFormacionDocenteOtraInst.Text = FCarreraDocente.OTRA_INSTITUCION;
        }

        cmbCarrerasFormacionDocenteInstituciones_SelectedIndexChanged(sender, e);
        if (FCarreraDocente.UA_UNIV)
        {
            cmbCarrerasFormacionDocenteUA.SelectedValue = FCarreraDocente.ID_UNIDADES_ACADEMICAS.ToString();
            edtCarrerasFormacionDocenteOtraUA.Text = "";
        }
        else
        {
            cmbCarrerasFormacionDocenteUA.SelectedValue = "-1";
            edtCarrerasFormacionDocenteOtraUA.Text = FCarreraDocente.OTRA_UNIDAD_ACADEMICA;
        }
        cmbCarrerasFormacionDocenteUA_SelectedIndexChanged(sender, e);
        popCarrerasFormacionDocente.ShowOnPageLoad = true;
    }

    protected void btnEliminarCarreraFormacionDocente_Click(object sender, EventArgs e)
    {
        if (grdCarreraFormacionDocenteABM.FocusedRowIndex < 0) return;
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        CarreraDocente FCarreraDocente = new CarreraDocente();
        FGestor.ObtenerObjeto(FCarreraDocente, grdCarreraFormacionDocenteABM);
        FGestor.EliminarObjeto(FCarreraDocente);
        actualizarDatosCarreraDocente();
    }

    protected void cmbCarrerasFormacionDocenteInstituciones_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlCarrerasFormacionDocenteOtraInst.Visible = cmbCarrerasFormacionDocenteInstituciones.SelectedValue == "-1";
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        DataSet FDatos = FGestor.LeerSQL("SELECT ID_UNIDADES_ACADEMICAS, UNIDAD_ACADEMICA FROM SIS_UNIVERSIDADES.UNIDADES_ACADEMICAS WHERE " +
            "ACTIVO = 'S' AND ID_INSTITUCIONES = " + cmbCarrerasFormacionDocenteInstituciones.SelectedValue);
        sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbCarrerasFormacionDocenteUA, FDatos, true, false);
        cmbCarrerasFormacionDocenteUA_SelectedIndexChanged(sender, e);
    }

    protected void cmbCarrerasFormacionDocenteUA_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlCarrerasFormacionDocenteOtraUA.Visible = cmbCarrerasFormacionDocenteUA.SelectedValue == "-1";
    }


    // Botones Popup Carrera formacion docente
    protected void btnGuardarCarreraFormacionDocente_Click(object sender, EventArgs e)
    {
        // Requeridos
        string FEstado = "";
        if (!sgwNucleo.Funciones.VerificarRequerido(edtCarrerasFormacionDocenteTitulo.Text))
            FEstado = "la denominación del título";
        else
            if (!sgwNucleo.Funciones.VerificarRequeridoInt(edtCarrerasFormacionDocenteAnioObtencion.Text))
                FEstado = "el año de obtención";
            else
                if ((pnlCarrerasFormacionDocenteOtraInst.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCarrerasFormacionDocenteOtraInst.Text)))
                    FEstado = "la institución";
                else
                    if ((pnlCarrerasFormacionDocenteOtraUA.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtCarrerasFormacionDocenteOtraUA.Text)))
                        FEstado = "la unidad académica";
                    else
                        if (!sgwNucleo.Funciones.VerificarRequeridoInt(edtCarrerasFormacionDocenteDuracion.Text))
                            FEstado = "la duración de la carrera";
        if (FEstado != "")
        {
            sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
            return;
        }
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        CarreraDocente FCarreraDocente = new CarreraDocente();
        if (Session["OperacionDetalle"].ToString() == "1")
            FCarreraDocente.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
        else
            FGestor.ObtenerObjeto(FCarreraDocente, grdCarreraFormacionDocenteABM);
        FCarreraDocente.ANIO_OBTENCION = int.Parse(edtCarrerasFormacionDocenteAnioObtencion.Text);
        FCarreraDocente.TITULO = edtCarrerasFormacionDocenteTitulo.Text;
        FCarreraDocente.DURACION_CARRERA = int.Parse(edtCarrerasFormacionDocenteDuracion.Text);
        if (cmbCarrerasFormacionDocenteInstituciones.SelectedValue == "-1")
        {
            FCarreraDocente.INSTITUCION_UNIV = false;
            FCarreraDocente.ID_INSTITUCIONES = 0;
            FCarreraDocente.OTRA_INSTITUCION = edtCarrerasFormacionDocenteOtraInst.Text;
        }
        else
        {
            FCarreraDocente.INSTITUCION_UNIV = true;
            FCarreraDocente.ID_INSTITUCIONES = int.Parse(cmbCarrerasFormacionDocenteInstituciones.SelectedValue);
            FCarreraDocente.OTRA_INSTITUCION = "";
        }
        if (cmbCarrerasFormacionDocenteUA.SelectedValue == "-1")
        {
            FCarreraDocente.UA_UNIV = false;
            FCarreraDocente.ID_UNIDADES_ACADEMICAS = 0;
            FCarreraDocente.OTRA_UNIDAD_ACADEMICA = edtCarrerasFormacionDocenteOtraUA.Text;
        }
        else
        {
            FCarreraDocente.UA_UNIV = true;
            FCarreraDocente.ID_UNIDADES_ACADEMICAS = int.Parse(cmbCarrerasFormacionDocenteUA.SelectedValue);
            FCarreraDocente.OTRA_UNIDAD_ACADEMICA = "";
        }
        FGestor.GuardarObjeto(FCarreraDocente);
        actualizarDatosCarreraDocente();
        sgwNucleo.Pagina.CerrarPopup(popCarrerasFormacionDocente);
    }
    protected void btnCancelarCarreraFormacionDocente_Click(object sender, EventArgs e)
    {
        sgwNucleo.Pagina.CerrarPopup(popCarrerasFormacionDocente);
    }

    #endregion


}