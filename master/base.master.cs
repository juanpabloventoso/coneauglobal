using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DevExpress.Web.ASPxGridView.Export;
using DevExpress.Web.ASPxPivotGrid;


public partial class mpBase : System.Web.UI.MasterPage
{

    // URL actual
    public string urlActual = "";

    protected void Page_Init(object sender, EventArgs e)
    {
        urlActual = Request.Url.PathAndQuery.ToLower().Replace("default.aspx", "");
        DevExpress.Web.ASPxClasses.ASPxWebControl.RegisterUtilsScript(Page);
        if (!Page.IsPostBack)
        {
            grdExportar.ReportHeader = "Exportación de CONEAU Global";
            grdExportar.ReportFooter = "Generado por CONEAU Global - Área de Sistemas de la CONEAU";
        }
        if (sgwNucleo.Pagina.SoloLectura())
            sgwNucleo.Pagina.AplicarSoloLectura(this);


    }


    public ASPxGridViewExporter grd_Exportar
    {
        get { return grdExportar; }
    }
    public void ExportarCSV()
    {
        grdExportar.WriteCsvToResponse("Listado");
    }
    public void ExportarPDF()
    {
        grdExportar.WritePdfToResponse("Listado");
    }
    public void ExportarRTF()
    {
        grdExportar.WriteRtfToResponse("Listado");
    }
    public void ExportarXLS()
    {
        grdExportar.WriteXlsToResponse("Listado");
    }

    protected void ToolkitScriptManager1_AsyncPostBackError(object sender, AsyncPostBackErrorEventArgs e)
    {
        Exception E = e.Exception;
        Session["ExceptionFrom"] = Request.Url;
        Session["ExceptionInnerException"] = E.InnerException;
        Session["ExceptionMessage"] = E.Message;
        Session["ExceptionStackTrace"] = E.StackTrace;
    }

}