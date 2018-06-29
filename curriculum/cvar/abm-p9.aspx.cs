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
using sgwMulticapa.Gestor;
using sgwMulticapa.Objetos;
using sgwMulticapa.Objetos.CONEAU.Docentes;

    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            sgwNucleo.Usuarios.VerificarUsuarioAutenticado();
            actualizarDatosEvaluaciones1();
            actualizarDatosEvaluaciones2();
            actualizarDatosEvaluaciones3();
            actualizarDatosEvaluaciones4();
        }

        
        #region Evaluaciones

        protected void btnModificarEvaluaciones1_Click(object sender, EventArgs e)
        {
            if (grdEvaluaciones.FocusedRowIndex < 0) return;
            Label27.Text = "Tipo de evaluación: ";
            Label1.Text = "Organismo o institución convocante: ";
            edtExperienciasEvaluacionAnio.Text = grdEvaluaciones.GetRowValues(grdEvaluaciones.FocusedRowIndex, "anio").ToString();
            edtExperienciasEvaluacionCiudad.Text = grdEvaluaciones.GetRowValues(grdEvaluaciones.FocusedRowIndex, "ciudad").ToString();
            edtExperienciasEvaluacionPais.Text = grdEvaluaciones.GetRowValues(grdEvaluaciones.FocusedRowIndex, "lugarPais").ToString();
            cmbExperienciasEvaluacionTiposEvaluacion.Text = grdEvaluaciones.GetRowValues(grdEvaluaciones.FocusedRowIndex, "tipoPersonalEvaluado").ToString();
            cmbInstitucion.Text = grdEvaluaciones.GetRowValues(grdEvaluaciones.FocusedRowIndex, "institucion").ToString();
            popEvaluaciones.ShowOnPageLoad = true;
        }

        protected void btnModificarEvaluaciones2_Click(object sender, EventArgs e)
        {
            if (grdEvaluacionInvestigacion.FocusedRowIndex < 0) return;
            Label27.Text = "Tipo de evaluación: ";
            Label1.Text = "Organismo o institución convocante: ";
            edtExperienciasEvaluacionAnio.Text = grdEvaluacionInvestigacion.GetRowValues(grdEvaluacionInvestigacion.FocusedRowIndex, "anio").ToString();
            edtExperienciasEvaluacionCiudad.Text = grdEvaluacionInvestigacion.GetRowValues(grdEvaluacionInvestigacion.FocusedRowIndex, "ciudad").ToString();
            edtExperienciasEvaluacionPais.Text = grdEvaluacionInvestigacion.GetRowValues(grdEvaluacionInvestigacion.FocusedRowIndex, "lugarPais").ToString();
            cmbExperienciasEvaluacionTiposEvaluacion.Text = "Programas/proyectos de investigación y desarrollo y/o extensión";
            cmbInstitucion.Text = grdEvaluacionInvestigacion.GetRowValues(grdEvaluacionInvestigacion.FocusedRowIndex, "institucion").ToString();
            popEvaluaciones.ShowOnPageLoad = true;
        }

        protected void btnModificarEvaluaciones3_Click(object sender, EventArgs e)
        {
            if (grdEvaluaciones.FocusedRowIndex < 0) return;
            Label27.Text = "Revista: ";
            Label1.Text = "Función: ";
            edtExperienciasEvaluacionAnio.Text = grdEvaluacionRevistas.GetRowValues(grdEvaluacionRevistas.FocusedRowIndex, "anio").ToString();
            edtExperienciasEvaluacionCiudad.Text = grdEvaluacionRevistas.GetRowValues(grdEvaluacionRevistas.FocusedRowIndex, "ciudad").ToString();
            edtExperienciasEvaluacionPais.Text = grdEvaluacionRevistas.GetRowValues(grdEvaluacionRevistas.FocusedRowIndex, "lugarPais").ToString();
            cmbExperienciasEvaluacionTiposEvaluacion.Text = grdEvaluacionRevistas.GetRowValues(grdEvaluacionRevistas.FocusedRowIndex, "tituloRevista").ToString();
            cmbInstitucion.Text = grdEvaluacionRevistas.GetRowValues(grdEvaluacionRevistas.FocusedRowIndex, "funcionDesempeniada").ToString();
            popEvaluaciones.ShowOnPageLoad = true;
        }

        protected void btnModificarEvaluaciones4_Click(object sender, EventArgs e)
        {
            if (grdEvaluaciones.FocusedRowIndex < 0) return;
            Label27.Text = "Tipo de evaluación: ";
            Label1.Text = "Organismo o institución convocante: ";
            edtExperienciasEvaluacionAnio.Text = grdEvaluacionInstitucional.GetRowValues(grdEvaluacionInstitucional.FocusedRowIndex, "anio").ToString();
            edtExperienciasEvaluacionCiudad.Text = grdEvaluacionInstitucional.GetRowValues(grdEvaluacionInstitucional.FocusedRowIndex, "ciudad").ToString();
            edtExperienciasEvaluacionPais.Text = grdEvaluacionInstitucional.GetRowValues(grdEvaluacionInstitucional.FocusedRowIndex, "lugarPais").ToString();
            cmbExperienciasEvaluacionTiposEvaluacion.Text = grdEvaluacionInstitucional.GetRowValues(grdEvaluacionInstitucional.FocusedRowIndex, "tipoEvaluacionInstitucional").ToString();
            cmbInstitucion.Text = grdEvaluacionInstitucional.GetRowValues(grdEvaluacionInstitucional.FocusedRowIndex, "institucion").ToString();
            popEvaluaciones.ShowOnPageLoad = true;
        }

        protected void btnCancelarEvaluaciones_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popEvaluaciones);
        }

        protected void actualizarDatosEvaluaciones1()
        {
            DataSet ds = new DataSet();
            System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "antecedentes/evaluacion/personalPremiosConcursos");
            ds.ReadXml(new XmlNodeReader(CVAR));
            if (ds.Tables.Count == 0) return;
                 if (ds.Tables[0].Columns.IndexOf("ciudad") < 0) ds.Tables[0].Columns.Add("ciudad");
                 if (ds.Tables[0].Columns.IndexOf("anio") < 0) ds.Tables[0].Columns.Add("anio");
                ds.Tables[0].Columns.Add("lugarPais");
                ds.Tables[0].Columns.Add("institucion");
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    if ((ds.Tables[0].ChildRelations.Count > 1) && (ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0]).Length > 0))
                    
                    ds.Tables[0].Rows[i].SetField(ds.Tables[0].Columns.Count - 1,
                        ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0])[0].ItemArray[0].ToString());

                    if ((ds.Tables[0].ChildRelations.Count > 1) && (ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[1]).Length > 0))

                        ds.Tables[0].Rows[i].SetField(ds.Tables[0].Columns.Count - 2,
                            ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[1])[0].ItemArray[0].ToString());
                }
                grdEvaluaciones.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
                grdEvaluaciones.DataSource = ds;
                grdEvaluaciones.DataBind();
            
        }

        protected void actualizarDatosEvaluaciones2()
        {
            DataSet ds = new DataSet();
            System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "antecedentes/evaluacion/programasProyectos");
            ds.ReadXml(new XmlNodeReader(CVAR));
            if (ds.Tables.Count == 0) return;
            if (ds.Tables[0].Columns.IndexOf("anio") < 0) ds.Tables[0].Columns.Add("anio");
            if (ds.Tables[0].Columns.IndexOf("lugarPais") < 0) ds.Tables[0].Columns.Add("lugarPais");
            if (ds.Tables[0].Columns.IndexOf("institucion") < 0) ds.Tables[0].Columns.Add("institucion");
          
            if (ds.Tables[0].Columns.IndexOf("ciudad") < 0) ds.Tables[0].Columns.Add("ciudad");
            
               // ds.Tables[0].Columns.Add("lugarPais");
              //  ds.Tables[0].Columns.Add("institucion");
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    ds.Tables[0].Rows[i].SetField(ds.Tables[0].Columns.Count - 1,
                        ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0])[0].ItemArray[0].ToString());

                 

                   //     if (ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[1]).Length > 0)
                    if ((ds.Tables[0].ChildRelations.Count > 1) && (ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[1]).Length > 0))


                        ds.Tables[0].Rows[i].SetField(ds.Tables[0].Columns.Count - 2,
                            ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[1])[0].ItemArray[0].ToString());

                  
                }
                grdEvaluacionInvestigacion.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
                grdEvaluacionInvestigacion.DataSource = ds;
                grdEvaluacionInvestigacion.DataBind();
            
        }

        protected void actualizarDatosEvaluaciones3()
        {
            DataSet ds = new DataSet();
            System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "antecedentes/evaluacion/trabajosEnRevistas");
            ds.ReadXml(new XmlNodeReader(CVAR));

            if (ds.Tables.Count == 0) return;

            if (ds.Tables[0].Columns["tituloRevista"] == null) ds.Tables[0].Columns.Add("tituloRevista");
            ds.Tables[0].Columns.Add("lugarPais");
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {

                    if (ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0]).Length > 0)
                    {
                        ds.Tables[0].Rows[i].SetField(ds.Tables[0].Columns.Count - 1,
                        ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0])[0].ItemArray[0].ToString());
                    }
                }
                grdEvaluacionRevistas.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
                grdEvaluacionRevistas.DataSource = ds;
                grdEvaluacionRevistas.DataBind();
            
        }

        protected void actualizarDatosEvaluaciones4()
        {
            DataSet ds = new DataSet();
            System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "antecedentes/evaluacion/institucional");
            ds.ReadXml(new XmlNodeReader(CVAR));
            if (ds.Tables.Count == 0) return;
            ds.Tables[0].Columns.Add("lugarPais");
         //   if (ds.Tables[0].Columns.IndexOf("pais") < 0) ds.Tables[0].Columns.Add("pais");
            if (ds.Tables[0].Columns["ciudad"] == null) ds.Tables[0].Columns.Add("ciudad");
            if (ds.Tables[0].Columns["tipoEvaluacionInstitucional"] == null) ds.Tables[0].Columns.Add("tipoEvaluacionInstitucional");
            if (ds.Tables[0].Columns["anio"] == null) ds.Tables[0].Columns.Add("anio");
            if (ds.Tables[0].Columns["organizacion"] == null) ds.Tables[0].Columns.Add("organizacion");
            ds.Tables[0].Columns.Add("institucion");



            if (ds.Tables[0].Columns.IndexOf("anio") < 0) ds.Tables[0].Columns.Add("anio");
            if (ds.Tables[0].Columns.IndexOf("lugarPais") < 0) ds.Tables[0].Columns.Add("lugarPais");
            if (ds.Tables[0].Columns.IndexOf("institucion") < 0) ds.Tables[0].Columns.Add("institucion");
            if (ds.Tables[0].Columns.IndexOf("ciudad") < 0) ds.Tables[0].Columns.Add("ciudad");


            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {

                if ((ds.Tables[0].ChildRelations.Count > 1) && (ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0]).Length > 0))
               

                ds.Tables[0].Rows[i].SetField(ds.Tables[0].Columns.Count - 1,
                    ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0])[0].ItemArray[0].ToString());




                if ((ds.Tables[0].ChildRelations.Count > 1) && (ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[1]).Length > 0))
                    ds.Tables[0].Rows[i].SetField(ds.Tables[0].Columns.Count - 2,
                        ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[1])[0].ItemArray[0].ToString());
            }
            if (ds.Tables[0].PrimaryKey.Length == 0)
                ds.Tables[0].PrimaryKey = new DataColumn[] { ds.Tables[0].Columns["tipoEvaluacionInstitucional"] };
            grdEvaluacionInstitucional.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
            grdEvaluacionInstitucional.DataSource = ds;
            grdEvaluacionInstitucional.DataBind();
        }

        #endregion


}
