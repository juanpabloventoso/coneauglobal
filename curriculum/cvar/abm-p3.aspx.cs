using System;
using System.Collections;
using System.Xml;
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
            DataSet ds = new DataSet();
            try
            {
                System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "antecedentes/areasDeActuacion");
                XmlNode node = CVAR.SelectSingleNode("/areasDeActuacion");
                node.InnerXml = node.InnerXml.Replace("<area><area>", "<area><areaActuacion>").Replace("</area><subArea>", "</areaActuacion><subArea>");
                ds.ReadXml(new XmlNodeReader(CVAR));
                if (ds.Tables.Count == 0) return;
                grdAreas.KeyFieldName = "codigo";
                grdAreas.DataSource = ds;
                grdAreas.DataBind();
            }
            catch { }
        }

    }
