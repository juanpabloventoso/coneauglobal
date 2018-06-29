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
using DevExpress.Web.ASPxGridView;

    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                actualizarDatos();
            actualizarDatosCargosActuales();
        }


        #region DatosGenerales

        protected void actualizarDatos()
        {
            int TD5 = 0;
            int TDA = 0;
            int TM5 = 0;
            int TMA = 0;
            int TG5 = 0;
            int TGA = 0;
            DataSet ds = new DataSet();
            System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "antecedentes/formacionRRHH/tesistas");
            ds.ReadXml(new XmlNodeReader(CVAR));
            try
            {
                if (ds.Tables.Count > 0)
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        if (row["funcionDesempeniada"].ToString() == "Director o tutor")
                        {
                            if ((row["anioHasta"].ToString() == "") || (DateTime.Now.Year - int.Parse(row["anioHasta"].ToString()) <= 0))
                            {
                                if (row["tipoTesis"].ToString() == "Tesis de Doctorado") TDA++;
                                else
                                    if (row["tipoTesis"].ToString() == "Trabajo final, proyecto, obra o tesis de Maestría") TMA++;
                                    else
                                        TGA++;
                            }
                            else
                            {
                                if (DateTime.Now.Year - int.Parse(row["anioHasta"].ToString()) < 6)
                                {
                                    if (row["tipoTesis"].ToString() == "Tesis de Doctorado") TD5++;
                                    else
                                        if (row["tipoTesis"].ToString() == "Trabajo final, proyecto, obra o tesis de Maestría") TM5++;
                                        else
                                            TG5++;
                                }
                            }
                        }
                    }
            }
            catch
            {
                if (ds.Tables.Count > 0)
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        if (row["funcionDesempeniada"].ToString() == "Director o tutor")
                        {
                            if (row["tipoTesis"].ToString() == "Tesis de Doctorado") TDA++;
                            else
                                if (row["tipoTesis"].ToString() == "Trabajo final, proyecto, obra o tesis de Maestría") TMA++;
                                else
                                    TGA++;
                        }
                    }
            }
            edtTesisDoctoralesActuales.Text = TDA.ToString();
            edtTesisDoctoralesConcluidas.Text = TD5.ToString();
            edtTesisMaestriaActuales.Text = TMA.ToString();
            edtTesisMaestriaConcluidas.Text = TM5.ToString();
            edtTesinasTPActuales.Text = TGA.ToString();
            edtTesinasTPConcluidas.Text = TG5.ToString();
        }

        #endregion



        #region CargosActuales

        // Botones ABM Cargos Docentes Actual

        protected void actualizarDatosCargosActuales()
        {
            DataSet ds = new DataSet();
            System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "cargosDocencia/superiorPosgrado");
            ds.ReadXml(new XmlNodeReader(CVAR));
            if (ds.Tables.Count == 0) return;
            if (ds.Tables[0].Columns.IndexOf("fechaFin") < 0) ds.Tables[0].Columns.Add("fechaFin");
            ds.Tables[0].Columns.Add("organizacion");
            if (ds.Tables[0].Columns.IndexOf("tipoCargo") < 0)
            {
                ds.Tables[0].Columns.Add("tipoCargo");
            }
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                if (ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0]).Length > 0)
                    ds.Tables[0].Rows[i].SetField("organizacion", ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0])[0].ItemArray[2].ToString());
                if (ds.Tables[0].Rows[i]["fechaInicio"].ToString() != "")
                {
                    DateTime DT = Convert.ToDateTime(ds.Tables[0].Rows[i]["fechaInicio"].ToString().Substring(0, 10));
                    ds.Tables[0].Rows[i].SetField("fechaInicio", DT.Day.ToString() + "/" + DT.Month.ToString() + "/" + DT.Year.ToString());
                }
                
                if (ds.Tables[0].Rows[i]["fechaFin"].ToString() != "")
                {
                    DateTime DT = Convert.ToDateTime(ds.Tables[0].Rows[i]["fechaFin"].ToString().Substring(0, 10));
                    ds.Tables[0].Rows[i].SetField("fechaFin", DT.Day.ToString() + "/" + DT.Month.ToString() + "/" + DT.Year.ToString());
                }
            }
            grdCargosDocentesActual.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
            ((GridViewDataColumn)grdCargosDocentesActual.Columns[1]).FieldName = grdCargosDocentesActual.KeyFieldName;
            grdCargosDocentesActual.DataSource = ds;
            grdCargosDocentesActual.DataBind();
        }

        protected void actualizarDatosActCurriculares()
        {
            DataSet ds = new DataSet();
            System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "cargosDocencia/superiorPosgrado");
            ds.ReadXml(new XmlNodeReader(CVAR));
            if (ds.Tables.Count == 0) return;
            DataSet ds2 = new DataSet();
            if (ds.Tables[0].ChildRelations.Count > 2)
            {
                ds2.Tables.Add(ds.Tables[0].ChildRelations[2].ChildTable.ChildRelations[0].ChildTable.Clone());
                string clave = grdCargosDocentesActual.GetRowValues(grdCargosDocentesActual.FocusedRowIndex, grdCargosDocentesActual.KeyFieldName).ToString();
                foreach (DataRow FRow in ds.Tables[0].ChildRelations[2].ChildTable.Rows)
                     if (FRow[grdCargosDocentesActual.KeyFieldName].ToString() == clave)
                    {
                        foreach (DataRow row in FRow.GetChildRows(ds.Tables[0].ChildRelations[2].ChildTable.ChildRelations[0]))
                            ds2.Tables[0].ImportRow(row);
                    }
                grdActCurricular.KeyFieldName = ds.Tables[0].ChildRelations[2].ChildTable.PrimaryKey[0].Caption;
                grdActCurricular.DataSource = ds2;
                grdActCurricular.DataBind();
               
            }
           
        }



        protected void btnModificarDocenteActual_Click(object sender, EventArgs e)
        {
            if (grdCargosDocentesActual.FocusedRowIndex < 0) return;
            edtOrganizacion.Text = (grdCargosDocentesActual.GetRowValues(grdCargosDocentesActual.FocusedRowIndex, "organizacion").ToString());
            edtCargo.Text = (grdCargosDocentesActual.GetRowValues(grdCargosDocentesActual.FocusedRowIndex, "cargo").ToString());
            edtDedicacion.Text = (grdCargosDocentesActual.GetRowValues(grdCargosDocentesActual.FocusedRowIndex, "dedicacionHorariaSemanal").ToString());
            edtTipoCargo.Text = (grdCargosDocentesActual.GetRowValues(grdCargosDocentesActual.FocusedRowIndex, "tipoCargo").ToString());
            edtFechaInicio.Text = (grdCargosDocentesActual.GetRowValues(grdCargosDocentesActual.FocusedRowIndex, "fechaInicio").ToString());
            edtFechaFin.Text = (grdCargosDocentesActual.GetRowValues(grdCargosDocentesActual.FocusedRowIndex, "fechaFin").ToString());

            actualizarDatosActCurriculares();
            popCargosDocentesActual.ShowOnPageLoad = true;
        }

        protected void btnCancelarCargoDocenteActual_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popCargosDocentesActual);
        }

        #endregion

    }
