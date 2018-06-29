using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Xml;
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
        actualizarDatosEvaluaciones();
        actualizarDatosEvaluaciones2();
    }


    protected void actualizarDatosEvaluaciones()
    {
        DataSet ds = new DataSet();
        System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "produccion/cientifica/trabajosEnEventosPublicados");
        ds.ReadXml(new XmlNodeReader(CVAR));
        if (ds.Tables.Count == 0) return;
        if (ds.Tables[0].Columns.IndexOf("paisEvento") < 0) ds.Tables[0].Columns.Add("paisEvento");
        if (ds.Tables[0].Columns.IndexOf("mesEvento") < 0) ds.Tables[0].Columns.Add("mesEvento");
        grdEvaluaciones.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
        grdEvaluaciones.DataSource = ds;
        grdEvaluaciones.DataBind();
    }

    protected void actualizarDatosEvaluaciones2()
    {
        DataSet ds = new DataSet();
        System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "produccion/cientifica/trabajosEnEventosNoPublicados");
        ds.ReadXml(new XmlNodeReader(CVAR));
        if (ds.Tables.Count == 0) return;
        if (ds.Tables[0].Columns.IndexOf("paisEvento") < 0) ds.Tables[0].Columns.Add("paisEvento");
        if (ds.Tables[0].Columns.IndexOf("mesEvento") < 0) ds.Tables[0].Columns.Add("mesEvento");
        grdEvaluaciones2.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
        grdEvaluaciones2.DataSource = ds;
        grdEvaluaciones2.DataBind();
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {

        if (grdEvaluaciones.FocusedRowIndex < 0) return;
        edtTitulo.Text = (grdEvaluaciones.GetRowValues(grdEvaluaciones.FocusedRowIndex, "titulo").ToString());
        edtAnioEvento.Text = (grdEvaluaciones.GetRowValues(grdEvaluaciones.FocusedRowIndex, "anioEvento").ToString());
        edtMesEvento.Text = (grdEvaluaciones.GetRowValues(grdEvaluaciones.FocusedRowIndex, "mesEvento").ToString());
        edtEvento.Text = (grdEvaluaciones.GetRowValues(grdEvaluaciones.FocusedRowIndex, "nombreEvento").ToString());
        edtTipoEvento.Text = (grdEvaluaciones.GetRowValues(grdEvaluaciones.FocusedRowIndex, "tipoEvento").ToString());
        edtPais.Text = (grdEvaluaciones.GetRowValues(grdEvaluaciones.FocusedRowIndex, "paisEvento").ToString());
        popGeneral.ShowOnPageLoad = true;
    }

    protected void btnModificar2_Click(object sender, EventArgs e)
    {

        if (grdEvaluaciones2.FocusedRowIndex < 0) return;
        edtTitulo.Text = (grdEvaluaciones2.GetRowValues(grdEvaluaciones2.FocusedRowIndex, "titulo").ToString());
        edtAnioEvento.Text = (grdEvaluaciones2.GetRowValues(grdEvaluaciones2.FocusedRowIndex, "anioEvento").ToString());
        edtMesEvento.Text = (grdEvaluaciones2.GetRowValues(grdEvaluaciones2.FocusedRowIndex, "mesEvento").ToString());
        edtEvento.Text = (grdEvaluaciones2.GetRowValues(grdEvaluaciones2.FocusedRowIndex, "nombreEvento").ToString());
        edtTipoEvento.Text = (grdEvaluaciones2.GetRowValues(grdEvaluaciones2.FocusedRowIndex, "tipoEvento").ToString());
        edtPais.Text = (grdEvaluaciones2.GetRowValues(grdEvaluaciones2.FocusedRowIndex, "paisEvento").ToString());
        popGeneral.ShowOnPageLoad = true;
    }


    protected void btnCerrarpopGeneral_Click(object sender, EventArgs e)
    {
        sgwNucleo.Pagina.CerrarPopup(popGeneral);
    }

    

    


}
    
