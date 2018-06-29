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
          
            if (!Page.IsPostBack)
            {
               
            }
            actualizarDatosNoAcademicos(); 
          
            
        }

        protected void actualizarDatosNoAcademicos()
        {

            if (Session["CVAR"].ToString() == "S")
            {

                DataSet ds = new DataSet();
                System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "antecedentes/otrasActividades/ejercicioProfesional");
                ds.ReadXml(new XmlNodeReader(CVAR));
                if (ds.Tables.Count == 0) return;

                    if (ds.Tables[0].Columns.IndexOf("organizacion") < 0) ds.Tables[0].Columns.Add("organizacion");
                    if (ds.Tables[0].Columns.IndexOf("tipoFuncionActividad") < 0) ds.Tables[0].Columns.Add("tipoFuncionActividad");
                    if (ds.Tables[0].Columns.IndexOf("fechaInicio") < 0) ds.Tables[0].Columns.Add("fechaInicio");
                    if (ds.Tables[0].Columns.IndexOf("fechaFin") < 0) ds.Tables[0].Columns.Add("fechaFin");
                    if (ds.Tables[0].Columns.IndexOf("areaEjercicio") < 0) ds.Tables[0].Columns.Add("areaEjercicio");
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {


                       // if ((ds.Tables[0].ChildRelations.Count > 0))

                        //try
                        //{
                        //    if (ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[ds.Tables[0].ChildRelations.Count - 1]).Length > 0)
                        //        ds.Tables[0].Rows[i].SetField("organizacion",
                        //        ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[ds.Tables[0].ChildRelations.Count - 1])[0].ItemArray[0].ToString());
                        //    else ds.Tables[0].Rows[i].SetField("organizacion",
                        //      ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0])[0].ItemArray[0].ToString());
                        //}
                        //catch
                        //{
                            if (ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0]).Length > 0)
                                ds.Tables[0].Rows[i].SetField("organizacion",
                                ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0])[0].ItemArray[0].ToString());
                       // }


                           
                                //ds.Tables[0].Rows[i].SetField(ds.Tables[0].Columns.Count - 1,
                                //    ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0])[0].ItemArray[0].ToString());


                        

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


                    grdCargosNoAcademicos.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
                    grdCargosNoAcademicos.DataSource = ds;
                    grdCargosNoAcademicos.DataBind();
                    return;
                
            }




            grdCargosNoAcademicos.DataBind();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

            if (grdCargosNoAcademicos.FocusedRowIndex < 0) return;
            edtOrganizacion.Text = (grdCargosNoAcademicos.GetRowValues(grdCargosNoAcademicos.FocusedRowIndex, "organizacion").ToString());
            edtFuncion.Text = (grdCargosNoAcademicos.GetRowValues(grdCargosNoAcademicos.FocusedRowIndex, "tipoFuncionActividad").ToString());
            edtArea.Text = (grdCargosNoAcademicos.GetRowValues(grdCargosNoAcademicos.FocusedRowIndex, "areaEjercicio").ToString());
            edtFechaInicio.Text = (grdCargosNoAcademicos.GetRowValues(grdCargosNoAcademicos.FocusedRowIndex, "fechaInicio").ToString());
            edtFechaFin.Text = (grdCargosNoAcademicos.GetRowValues(grdCargosNoAcademicos.FocusedRowIndex, "fechaFin").ToString());
            edtDescripcion.Text = (grdCargosNoAcademicos.GetRowValues(grdCargosNoAcademicos.FocusedRowIndex, "descripcion").ToString());
           
            popGeneral.ShowOnPageLoad = true;
        }


        protected void btnCerrarpopGeneral_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popGeneral);
        }
       

       
        
   

        
}
