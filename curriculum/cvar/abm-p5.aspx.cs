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
        if (!Page.IsPostBack)
        {
            
           
          
        }
        actualizarDatos();
      
    }

    protected void actualizarDatos()
    {
        if (Session["CVAR"].ToString() == "S")
        {

            DataSet ds = new DataSet();
            System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "cargos/cargosGestionInstitucional");
            ds.ReadXml(new XmlNodeReader(CVAR));
            if (ds.Tables.Count == 0) return;
            if (ds.Tables[0].Columns["fechaFin"] == null) ds.Tables[0].Columns.Add("fechaFin");
            ds.Tables[0].Columns.Add("organizacion");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {

                if ((ds.Tables[0].ChildRelations.Count > 0) && (ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0]).Length > 0))
                    ds.Tables[0].Rows[i].SetField(ds.Tables[0].Columns.Count - 1,
                        ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0])[0].ItemArray[0].ToString());
                

                DateTime DT;

                if (ds.Tables[0].Rows[i]["fechaInicio"].ToString() != "")
                {
                    DT = Convert.ToDateTime(ds.Tables[0].Rows[i].ItemArray[0].ToString().Substring(0, 10));
                    ds.Tables[0].Rows[i].SetField("fechaInicio", DT.Day.ToString() + "/" + DT.Month.ToString() + "/" + DT.Year.ToString());
                }




                if (ds.Tables[0].Rows[i]["fechaFin"].ToString() != "")
                {
              
                    DT = Convert.ToDateTime(ds.Tables[0].Rows[i].ItemArray[1].ToString().Substring(0, 10));

                    ds.Tables[0].Rows[i].SetField("fechaFin", DT.Day.ToString() + "/" + DT.Month.ToString() + "/" + DT.Year.ToString());
                }
              
            }
            if (ds.Tables[0].PrimaryKey.Length == 0) return;
            grdCargosNoAcademicosABM.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
            grdCargosNoAcademicosABM.DataSource = ds;
            grdCargosNoAcademicosABM.DataBind();
            return;
        }

    }  
    protected void btnModificarTituloGrado_Click(object sender, EventArgs e)
    {
        if (grdCargosNoAcademicosABM.FocusedRowIndex < 0) return;
         edtFechaFin.Text = (grdCargosNoAcademicosABM.GetRowValues(grdCargosNoAcademicosABM.FocusedRowIndex, "fechaFin").ToString());
         edtFechaInicio.Text = (grdCargosNoAcademicosABM.GetRowValues(grdCargosNoAcademicosABM.FocusedRowIndex, "fechaInicio").ToString());
         edtOrganizacion.Text = (grdCargosNoAcademicosABM.GetRowValues(grdCargosNoAcademicosABM.FocusedRowIndex, "organizacion").ToString());
        edtCargo.Text = (grdCargosNoAcademicosABM.GetRowValues(grdCargosNoAcademicosABM.FocusedRowIndex, "cargo").ToString());
        edtDedicacion.Text = (grdCargosNoAcademicosABM.GetRowValues(grdCargosNoAcademicosABM.FocusedRowIndex, "dedicacionHorariaSemanal").ToString());
        edtFuncion.Text = (grdCargosNoAcademicosABM.GetRowValues(grdCargosNoAcademicosABM.FocusedRowIndex, "tipoFuncion").ToString());


        
        popGeneral.ShowOnPageLoad = true;
       
    }
    protected void btnCerrarpopGeneral_Click(object sender, EventArgs e)
    {
        sgwNucleo.Pagina.CerrarPopup(popGeneral);
    }



   
   

   



  

   

  

  

    
   
   

  

   
    
   



    


}