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
            // carga combo de institucione

            DataSet datos = FGestor.LeerSQL("SELECT ID_TIPOS_REUNIONES, TIPO_REUNION FROM SIS_DOCENTES.Q_TIPOS_REUNIONES");
            Funciones.CompletarListaDesplegable(cmbReunionesCientificasTiposParticipacion, datos, false, false);
        }
        actualizarDatosEvaluaciones();

    }

    #region Evaluaciones

    protected void btnAgregarEvaluaciones_Click(object sender, EventArgs e)
    {
        Session["OperacionDetalle"] = "A";
        edtReunionesCientificasTitulo.Text = "";
        edtReunionesCientificasEvento.Text = "";
        edtReunionesCientificasLugar.Text = "";
        edtReunionesCientificasFecha.Text = "";
        cmbReunionesCientificasTiposParticipacion_SelectedIndexChanged(null, null);
        popEvaluaciones.ShowOnPageLoad = true;
    }

    protected void btnModificarEvaluaciones_Click(object sender, EventArgs e)
    {
        if (grdEvaluaciones.FocusedRowIndex < 0) return;
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        Reunion FReunion = new Reunion();
        FGestor.ObtenerObjeto(FReunion, grdEvaluaciones);
        Session["OperacionDetalle"] = "M";

        edtReunionesCientificasTitulo.Text = FReunion.REUNION;
        edtReunionesCientificasEvento.Text = FReunion.EVENTO;
        edtReunionesCientificasLugar.Text = FReunion.LUGAR;
        edtReunionesCientificasFecha.Text = FReunion.LeerFecha("FECHA");
        edtReunionesCientificasOtroTipoParticipacion.Text = FReunion.OTRO_TIPO_REUNION;
        cmbReunionesCientificasTiposParticipacion.SelectedValue = FReunion.ID_TIPOS_REUNIONES.ToString();
        cmbReunionesCientificasTiposParticipacion_SelectedIndexChanged(null, null);




        //if (FReunion.INSTITUCION_UNIV)
        //{
        //    cmbReunionesCientificasTiposParticipacion.SelectedValue = FReunion.ID_INSTITUCIONES.ToString();
        //    edtReunionesCientificasOtroTipoParticipacion.Text = "";
        //}
        //else
        //{
        //    cmbReunionesCientificasTiposParticipacion.SelectedValue = "-1";
        //    edtReunionesCientificasOtroTipoParticipacion.Text = FReunion.OTRA_INSTITUCION;
        //}

        popEvaluaciones.ShowOnPageLoad = true;
    }

    protected void btnEliminarEvaluaciones_Click(object sender, EventArgs e)
    {
        if (grdEvaluaciones.FocusedRowIndex < 0) return;
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        Reunion FReunion = new Reunion();
        FGestor.ObtenerObjeto(FReunion, grdEvaluaciones);
        FGestor.EliminarObjeto(FReunion);
        actualizarDatosEvaluaciones();
    }

    protected void btnAceptarEvaluaciones_Click(object sender, EventArgs e)
    {

        // Requeridos
        string FEstado = "";



        if (!sgwNucleo.Funciones.VerificarRequerido(edtReunionesCientificasTitulo.Text))
            FEstado = "el título";
        else
            if (!sgwNucleo.Funciones.VerificarRequerido(edtReunionesCientificasEvento.Text))
                FEstado = "el evento";
            else
                if (!sgwNucleo.Funciones.VerificarRequerido(edtReunionesCientificasLugar.Text))
                    FEstado = "el lugar";
                
                    else
                        if (!sgwNucleo.Funciones.VerificarRequerido(edtReunionesCientificasFecha.Text))
                            FEstado = "la fecha";
                        else
                            if ((pnlReunionesCientificasOtroTipoParticipacion.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtReunionesCientificasOtroTipoParticipacion.Text)))
                                FEstado = "el tipo de participación";
                       

        if (FEstado != "")
        {
            sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
            return;
        }
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        Reunion FReunion = new Reunion();
        if (Session["OperacionDetalle"].ToString() == "M")
        {

            FGestor.ObtenerObjeto(FReunion, int.Parse(grdEvaluaciones.GetRowValues(grdEvaluaciones.FocusedRowIndex, "ID_REUNIONES").ToString()));
        }

       
        FReunion.ID_DOCENTES = int.Parse(Session["ID_DOCENTES"].ToString());
        FReunion.GuardarFecha("FECHA", edtReunionesCientificasFecha.Text);
        FReunion.REUNION = edtReunionesCientificasTitulo.Text;
        FReunion.EVENTO= edtReunionesCientificasEvento.Text;
        FReunion.LUGAR = edtReunionesCientificasLugar.Text;
        if (pnlReunionesCientificasOtroTipoParticipacion.Visible)
        {
            FReunion.OTRO_TIPO_REUNION = edtReunionesCientificasOtroTipoParticipacion.Text;
            FReunion.ID_TIPOS_REUNIONES = int.Parse(cmbReunionesCientificasTiposParticipacion.SelectedValue.ToString());
        
        }
        else
        { FReunion.ID_TIPOS_REUNIONES = int.Parse(cmbReunionesCientificasTiposParticipacion.SelectedValue); }

        FGestor.GuardarObjeto(FReunion);
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
        DataSet datos = FGestor.LeerSQL("SELECT * FROM SIS_DOCENTES.Q_REUNIONES WHERE " + FCondicion);
        grdEvaluaciones.DataSource = datos;
        grdEvaluaciones.DataBind();

    }

    protected void cmbReunionesCientificasTiposParticipacion_SelectedIndexChanged(object sender, EventArgs e)
    {
       // pnlReunionesCientificasOtroTipoParticipacion.Visible = cmbReunionesCientificasTiposParticipacion.SelectedValue == "(Otra opción ...)";
        pnlReunionesCientificasOtroTipoParticipacion.Visible = cmbReunionesCientificasTiposParticipacion.SelectedValue == "1000";
       
    
        
    }

    #endregion

    #region DatosGenerales

    protected bool guardar()
    {


        return true;

    }

    protected void btnGuardarDatosGenerales_Click(object sender, EventArgs e)
    {
        if (guardar())
            sgwNucleo.Pagina.MostrarEstado("Se han guardado los cambios.", 2);
    }

    protected void btnGuardarC_Click(object sender, EventArgs e)
    {
        if (guardar())
            Response.Redirect("abm-p9.aspx");
    }

    protected void btnCancelarDatosGenerales_Click(object sender, EventArgs e)
    {
        Session.Remove("OperacionABM");
        Response.Redirect("../inicio.aspx");
    }

    #endregion


}
    
