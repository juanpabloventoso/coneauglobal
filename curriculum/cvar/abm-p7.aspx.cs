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
            if (!Page.IsPostBack)
                actualizarDatos();
            actualizarDatosSistemaPromocionOtro();
            actualizarDatosProyectoInvestigacion();
            actualizarDatosPubRevistasCA();
            actualizarDatosPubLibros();
            actualizarDatosPubCapitulosLibros();
            
            actualizarDatosProdProtegidos();
            actualizarDatosProdNoProtegidos();
        }

        #region DatosGenerales

        protected void actualizarDatos()
        {
            // Incentivos
            DataSet ds = new DataSet();
            chkIncentivos.Checked = false;
            ddlIncentivos.Text = "";
            System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "cargosDocencia/categorizacionesIncentivos");
            ds.ReadXml(new XmlNodeReader(CVAR));
           
            try
            {
                if (ds.Tables.Count > 0)
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        if ((row["fechaFin"].ToString() == "") || (DateTime.Parse(row["fechaFin"].ToString()) > DateTime.Now))
                        {
                            chkIncentivos.Checked = true;
                            ddlIncentivos.Text = row["claseCargo"].ToString();
                        }
                    }
            }
            catch
            {
                if (ds.Tables.Count > 0)
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        chkIncentivos.Checked = true;
                        ddlIncentivos.Text = row["claseCargo"].ToString();
                    }
            }
            pnlIncentivos.Visible = chkIncentivos.Checked;

            // CONICET
            ds = new DataSet();
            chkCONICET.Checked = false;
            ddlCONICET.Text = "";
            CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "cargosDocencia/cargosOrganismosCyT");
            ds.ReadXml(new XmlNodeReader(CVAR));
          
            try
            {
                if (ds.Tables.Count > 0)
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        if ((row["fechaFin"].ToString() == "") || (DateTime.Parse(row["fechaFin"].ToString()) > DateTime.Now))
                        {
                            if (row["carrera"].ToString() == "Carrera de investigador científico y tecnológico (CONICET)")
                            {
                                chkCONICET.Checked = true;
                                ddlCONICET.Text = row["categoria"].ToString();
                            }
                        }
                    }
            }
            catch
            {
                if (ds.Tables.Count > 0)
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        if (row["carrera"].ToString() == "Carrera de investigador científico y tecnológico (CONICET)")
                        {
                            chkCONICET.Checked = true;
                            ddlCONICET.Text = row["categoria"].ToString();
                        }
                    }
            }
            pnlCONICET.Visible = chkCONICET.Checked;
        }

        #endregion

        

        #region InvestigacionOtro

        protected void actualizarDatosSistemaPromocionOtro()
        {
            DataSet ds = new DataSet();
            System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "cargosDocencia/cargosOtroTipoInstitucion");
            ds.ReadXml(new XmlNodeReader(CVAR));
            if (ds.Tables.Count == 0) return;
            ds.Tables[0].Columns.Add("organismo");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ds.Tables[0].Rows[i].SetField(ds.Tables[0].Columns.Count - 1,
                    ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0])[0].ItemArray[0].ToString());
            }
            grdSistemasPromocionOtrosABM.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
            grdSistemasPromocionOtrosABM.DataSource = ds;
            grdSistemasPromocionOtrosABM.DataBind();
        }

        protected void btnModificarSistemaPromocionOtro_Click(object sender, EventArgs e)
        {
            if (grdSistemasPromocionOtrosABM.FocusedRowIndex < 0) return;
            cmbSistemasPromocionOtrosInstitucion.Text = grdSistemasPromocionOtrosABM.GetRowValues(grdSistemasPromocionOtrosABM.FocusedRowIndex, "organismo").ToString();
            edtSistemasPromocionOtrosCategoria.Text = (grdSistemasPromocionOtrosABM.GetRowValues(grdSistemasPromocionOtrosABM.FocusedRowIndex, "cargo").ToString());
            popSistemasPromocionOtros.ShowOnPageLoad = true;
        }

        protected void btnCancelarSistemaPromocionOtro_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popSistemasPromocionOtros);
        }

        #endregion

        
        #region ProyectosInvestigacion

        protected void actualizarDatosProyectoInvestigacion()
        {
            DataSet ds = new DataSet();
            System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "antecedentes/financiamiento");
            ds.ReadXml(new XmlNodeReader(CVAR));

            if (ds.Tables.Count == 0) return;
            ds.Tables[0].Columns.Add("instituciones");
            ds.Tables[0].Columns.Add("funcion");

            if (ds.Tables[0].Columns.IndexOf("titulo") < 0)
                ds.Tables[0].Columns.Add("titulo");
          

            if (ds.Tables[0].Columns.IndexOf("fechaHasta") < 0)
                ds.Tables[0].Columns.Add("fechaHasta");

            if (ds.Tables[0].Columns.IndexOf("fechaDesde") < 0)
                ds.Tables[0].Columns.Add("fechaDesde");

          
              

            
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DateTime DT;

                if (ds.Tables[0].Rows[i]["fechaDesde"].ToString() != "")
                {
                    DT = Convert.ToDateTime(ds.Tables[0].Rows[i]["fechaDesde"].ToString().Substring(0, 10));
                    ds.Tables[0].Rows[i].SetField("fechaDesde", DT.Day.ToString() + "/" + DT.Month.ToString() + "/" + DT.Year.ToString());
                }
                if (ds.Tables[0].Rows[i]["fechaHasta"].ToString() != "")
                {
                    DT = Convert.ToDateTime(ds.Tables[0].Rows[i]["fechaHasta"].ToString().Substring(0, 10));
                    ds.Tables[0].Rows[i].SetField("fechaHasta", DT.Day.ToString() + "/" + DT.Month.ToString() + "/" + DT.Year.ToString());
                }


                if ((ds.Tables[0].ChildRelations.Count > 3)) 
                        
                {
                
                    if ((ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[3])[0]).Table.Columns.IndexOf("FuncionDesempeniada") > 0)
                       



                    ds.Tables[0].Rows[i].SetField(ds.Tables[0].Columns.Count - 1,
                        ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[3])[0]["funcionDesempeniada"].ToString());
                
                }
            }
            grdProyectosInvestigacion.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
            grdProyectosInvestigacion.DataSource = ds;
            grdProyectosInvestigacion.DataBind();
        }

        protected void btnModificarProyectoInvestigacion_Click(object sender, EventArgs e)
        {
            if (grdProyectosInvestigacion.FocusedRowIndex < 0) return;
            edtProyectosInvestigacionFechaInicio.Text = grdProyectosInvestigacion.GetRowValues(grdProyectosInvestigacion.FocusedRowIndex, "fechaDesde").ToString();
            edtProyectosInvestigacionFechaFinalizacion.Text = grdProyectosInvestigacion.GetRowValues(grdProyectosInvestigacion.FocusedRowIndex, "fechaHasta").ToString();
            edtProyectosInvestigacionTituloProyecto.Text = grdProyectosInvestigacion.GetRowValues(grdProyectosInvestigacion.FocusedRowIndex, "titulo").ToString();
            edtProyectosInvestigacionCaracterParticipacion.Text = grdProyectosInvestigacion.GetRowValues(grdProyectosInvestigacion.FocusedRowIndex, "funcion").ToString();
            edtProyectosInvestigacionPrincipalesResultados.Text = grdProyectosInvestigacion.GetRowValues(grdProyectosInvestigacion.FocusedRowIndex, "descripcion").ToString();
            popProyectosInvestigacion.ShowOnPageLoad = true;
        }

        protected void btnCancelarProyectoInvestigacion_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popProyectosInvestigacion);
        }

        #endregion


        #region PublicacionesRevistasCA

        protected void actualizarDatosPubRevistasCA()
        {
            DataSet ds = new DataSet();
            System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "produccion/cientifica/articulos");
            XmlNode node = CVAR.SelectSingleNode("/articulos/articulo/tipoSoporte");
            while (node != null)
            {
                node.ParentNode.RemoveChild(node);
                node = CVAR.SelectSingleNode("/articulos/articulo/tipoSoporte");
            }
            ds.ReadXml(new XmlNodeReader(CVAR));
            if (ds.Tables.Count == 0) return;
            ds.Tables[0].Columns.Add("Nrevista");
            ds.Tables[0].Columns.Add("Nanio");
            if (ds.Tables[0].Columns.IndexOf("paginaInicial") < 0)
                ds.Tables[0].Columns.Add("paginaInicial");
            if (ds.Tables[0].Columns.IndexOf("paginaFinal") < 0)
                ds.Tables[0].Columns.Add("paginaFinal");
            if (ds.Tables[0].Columns.IndexOf("volumen") < 0)
                ds.Tables[0].Columns.Add("volumen");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ds.Tables[0].Rows[i].SetField("Nanio",
                    ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0])[0]["anioPublica"].ToString());
                ds.Tables[0].Rows[i].SetField("Nrevista",
                    ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0])[0]["nombre"].ToString());
            }
            grdPublicacionesRevistasConArbitraje.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
            grdPublicacionesRevistasConArbitraje.DataSource = ds;
            grdPublicacionesRevistasConArbitraje.DataBind();
        }

        protected void btnModificarPublicacionRevistaConArbitraje_Click(object sender, EventArgs e)
        {
            if (grdPublicacionesRevistasConArbitraje.FocusedRowIndex < 0) return;
            edtPublicacionesRevistasConArbitrajeAnio.Text = grdPublicacionesRevistasConArbitraje.GetRowValues(grdPublicacionesRevistasConArbitraje.FocusedRowIndex, "Nanio").ToString(); ;
            edtPublicacionesRevistasConArbitrajeTipo.Text = grdPublicacionesRevistasConArbitraje.GetRowValues(grdPublicacionesRevistasConArbitraje.FocusedRowIndex, "referato").ToString(); ;
            edtPublicacionesRevistasConArbitrajePaginas.Text = grdPublicacionesRevistasConArbitraje.GetRowValues(grdPublicacionesRevistasConArbitraje.FocusedRowIndex, "paginaInicial").ToString(); ;
            edtPublicacionesRevistasConArbitrajePaginas2.Text = grdPublicacionesRevistasConArbitraje.GetRowValues(grdPublicacionesRevistasConArbitraje.FocusedRowIndex, "paginaFinal").ToString(); ;
            edtPublicacionesRevistasConArbitrajeRevista.Text = grdPublicacionesRevistasConArbitraje.GetRowValues(grdPublicacionesRevistasConArbitraje.FocusedRowIndex, "Nrevista").ToString(); ;
            edtPublicacionesRevistasConArbitrajeTitulo.Text = grdPublicacionesRevistasConArbitraje.GetRowValues(grdPublicacionesRevistasConArbitraje.FocusedRowIndex, "titulo").ToString(); ;
            edtPublicacionesRevistasConArbitrajeVolumen.Text = grdPublicacionesRevistasConArbitraje.GetRowValues(grdPublicacionesRevistasConArbitraje.FocusedRowIndex, "volumen").ToString(); ;
            edtPublicacionesRevistasConArbitrajeResumen.Text = grdPublicacionesRevistasConArbitraje.GetRowValues(grdPublicacionesRevistasConArbitraje.FocusedRowIndex, "resumenOAbstract").ToString(); ;
            
            popPublicacionesRevistasConArbitraje.ShowOnPageLoad = true;
        }

        protected void btnCancelarPublicacionRevistaConArbitraje_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popPublicacionesRevistasConArbitraje);
        }

        #endregion


        #region PublicacionesLibros

        protected void actualizarDatosPubLibros()
        {
            
            DataSet ds = new DataSet();
            System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "produccion/cientifica/libros");
            XmlNode node = CVAR.SelectSingleNode("/libros/libro/tipoSoporte");
            while (node != null)
            {
                node.ParentNode.RemoveChild(node);
                node = CVAR.SelectSingleNode("/libros/libro/tipoSoporte");
            }
            ds.ReadXml(new XmlNodeReader(CVAR));
            if (ds.Tables.Count == 0) return;
            if (ds.Tables[0].Columns.IndexOf("cantidadPaginas") < 0)
                ds.Tables[0].Columns.Add("cantidadPaginas");
            grdPublicacionesLibros.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
            grdPublicacionesLibros.DataSource = ds;
            grdPublicacionesLibros.DataBind();
        }

        protected void btnModificarPublicacionLibro_Click(object sender, EventArgs e)
        {
            if (grdPublicacionesLibros.FocusedRowIndex < 0) return;
            edtPublicacionesLibrosAnio.Text = grdPublicacionesLibros.GetRowValues(grdPublicacionesLibros.FocusedRowIndex, "anioPublicacion").ToString();
            edtPublicacionesLibrosEditorial.Text = grdPublicacionesLibros.GetRowValues(grdPublicacionesLibros.FocusedRowIndex, "editorial").ToString();
            edtPublicacionesLibrosLugarImpresion.Text = grdPublicacionesLibros.GetRowValues(grdPublicacionesLibros.FocusedRowIndex, "ciudadDeLaEditorial").ToString();
            edtPublicacionesLibrosPaginas.Text = grdPublicacionesLibros.GetRowValues(grdPublicacionesLibros.FocusedRowIndex, "cantidadPaginas").ToString();
            edtPublicacionesLibrosTituloLibro.Text = grdPublicacionesLibros.GetRowValues(grdPublicacionesLibros.FocusedRowIndex, "titulo").ToString();
            edtPublicacionesLibrosResumen.Text = grdPublicacionesLibros.GetRowValues(grdPublicacionesLibros.FocusedRowIndex, "resumen").ToString();
            popPublicacionesLibros.ShowOnPageLoad = true;
        }

        protected void btnCancelarPublicacionLibro_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popPublicacionesLibros);
        }


        #endregion


        #region PublicacionesCapitulosLibros

        protected void actualizarDatosPubCapitulosLibros()
        {
            DataSet ds = new DataSet();
            System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "produccion/cientifica/partesDeLibros");
            XmlNode node = CVAR.SelectSingleNode("/partesDeLibros/parteLibro/tipoSoporte");
            while (node != null)
            {
                node.ParentNode.RemoveChild(node);
                node = CVAR.SelectSingleNode("/partesDeLibros/parteLibro/tipoSoporte");
            }

            ds.ReadXml(new XmlNodeReader(CVAR));
            if (ds.Tables.Count == 0) return;
            if (ds.Tables[0].Columns.IndexOf("paginaInicial") < 0)
                ds.Tables[0].Columns.Add("paginaInicial");
            if (ds.Tables[0].Columns.IndexOf("paginaFinal") < 0)
                ds.Tables[0].Columns.Add("paginaFinal");
            if (ds.Tables[0].Columns.IndexOf("cantidadDePaginas") < 0)
                ds.Tables[0].Columns.Add("cantidadDePaginas");
            if (ds.Tables[0].Columns.IndexOf("ciudadDeLaEditorial") < 0) ds.Tables[0].Columns.Add("ciudadDeLaEditorial");


            grdPublicacionesCapitulosLibros.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
            grdPublicacionesCapitulosLibros.DataSource = ds;
            grdPublicacionesCapitulosLibros.DataBind();
        }

        protected void btnModificarPublicacionCapituloLibro_Click(object sender, EventArgs e)
        {
            if (grdPublicacionesCapitulosLibros.FocusedRowIndex < 0) return;
            edtPublicacionesCapitulosLibrosAnio.Text = grdPublicacionesCapitulosLibros.GetRowValues(grdPublicacionesCapitulosLibros.FocusedRowIndex, "anioPublicacion").ToString();
            edtPublicacionesCapitulosLibrosEditoresLibros.Text = grdPublicacionesCapitulosLibros.GetRowValues(grdPublicacionesCapitulosLibros.FocusedRowIndex, "tipoParteLibro").ToString();
            edtPublicacionesCapitulosLibrosEditorial.Text = grdPublicacionesCapitulosLibros.GetRowValues(grdPublicacionesCapitulosLibros.FocusedRowIndex, "editorial").ToString();
            edtPublicacionesCapitulosLibrosLugarImpresion.Text = grdPublicacionesCapitulosLibros.GetRowValues(grdPublicacionesCapitulosLibros.FocusedRowIndex, "ciudadDeLaEditorial").ToString();
            edtPublicacionesCapitulosLibrosPaginas.Text = grdPublicacionesCapitulosLibros.GetRowValues(grdPublicacionesCapitulosLibros.FocusedRowIndex, "cantidadDePaginas").ToString();
            edtPublicacionesCapitulosLibrosTituloCapitulo.Text = grdPublicacionesCapitulosLibros.GetRowValues(grdPublicacionesCapitulosLibros.FocusedRowIndex, "tituloParte").ToString();
            edtPublicacionesCapitulosLibrosTituloLibro.Text = grdPublicacionesCapitulosLibros.GetRowValues(grdPublicacionesCapitulosLibros.FocusedRowIndex, "tituloLibro").ToString();
            edtPublicacionesCapitulosLibrosResumen.Text = grdPublicacionesCapitulosLibros.GetRowValues(grdPublicacionesCapitulosLibros.FocusedRowIndex, "resumen").ToString();
            popPublicacionesCapitulosLibros.ShowOnPageLoad = true;
        }

        protected void btnCancelarPublicacionCapituloLibro_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popPublicacionesCapitulosLibros);
        }

        #endregion


        #region ProductosProtegidos

        protected void actualizarDatosProdProtegidos()
        {
            DataSet ds = new DataSet();
            System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "produccion/tecnologica/conPropiedadIntelectual");
            ds.ReadXml(new XmlNodeReader(CVAR));
            if (ds.Tables.Count == 0) return;
            if (ds.Tables[0].Columns.IndexOf("fechaConcesionDesde") < 0) ds.Tables[0].Columns.Add("fechaConcesionDesde");
            if (ds.Tables[0].Columns.IndexOf("titulares") < 0) ds.Tables[0].Columns.Add("titulares");
            if (ds.Tables[0].Columns.IndexOf("fechaSolicitud") < 0) ds.Tables[0].Columns.Add("fechaSolicitud");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {

                DateTime DT;
                if (ds.Tables[0].Rows[i]["fechaSolicitud"].ToString() != "")
                {
                 DT = Convert.ToDateTime(ds.Tables[0].Rows[i]["fechaSolicitud"].ToString().Substring(0, 10));
                ds.Tables[0].Rows[i].SetField("fechaSolicitud", DT.Day.ToString() + "/" + DT.Month.ToString() + "/" + DT.Year.ToString());
                }

                if (ds.Tables[0].Rows[i]["fechaConcesionDesde"].ToString() != "")
                {
                    DT = Convert.ToDateTime(ds.Tables[0].Rows[i]["fechaConcesionDesde"].ToString().Substring(0, 10));
                    ds.Tables[0].Rows[i].SetField("fechaConcesionDesde", DT.Day.ToString() + "/" + DT.Month.ToString() + "/" + DT.Year.ToString());
                }
            }
            grdProductosProtegidos.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
            grdProductosProtegidos.DataSource = ds;
            grdProductosProtegidos.DataBind();
        }

        protected void btnModificarProductoProtegido_Click(object sender, EventArgs e)
        {
            if (grdProductosProtegidos.FocusedRowIndex < 0) return;
            edtProductosProtegidosDesarrollo.Text = grdProductosProtegidos.GetRowValues(grdProductosProtegidos.FocusedRowIndex, "titulo").ToString();
            edtProductosProtegidosFechaOtorgamiento.Text = grdProductosProtegidos.GetRowValues(grdProductosProtegidos.FocusedRowIndex, "fechaConcesionDesde").ToString();
            edtProductosProtegidosFechaSolicitud.Text = grdProductosProtegidos.GetRowValues(grdProductosProtegidos.FocusedRowIndex, "fechaSolicitud").ToString();
            edtProductosProtegidosTitular.Text = grdProductosProtegidos.GetRowValues(grdProductosProtegidos.FocusedRowIndex, "titulares").ToString();
            popProductosProtegidos.ShowOnPageLoad = true;
        }

        protected void btnCancelarProductoProtegido_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popProductosProtegidos);
        }

        #endregion


        #region ProductosNoProtegidos

        protected void actualizarDatosProdNoProtegidos()
        {
            DataSet ds = new DataSet();
            System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "produccion/tecnologica/sinPropiedadIntelectual");
            ds.ReadXml(new XmlNodeReader(CVAR));
            if (ds.Tables.Count == 0) return;
            grdProductosNoProtegidos.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
            grdProductosNoProtegidos.DataSource = ds;
            grdProductosNoProtegidos.DataBind();
        }

        protected void btnModificarProductoNoProtegido_Click(object sender, EventArgs e)
        {
            if (grdProductosNoProtegidos.FocusedRowIndex < 0) return;
            edtProductosNoProtegidosDescripcion.Text = grdProductosNoProtegidos.GetRowValues(grdProductosNoProtegidos.FocusedRowIndex, "descripcion").ToString();
            edtProductosNoProtegidosProducto.Text = grdProductosNoProtegidos.GetRowValues(grdProductosNoProtegidos.FocusedRowIndex, "produccion").ToString();
            popProductosNoProtegidos.ShowOnPageLoad = true;
        }

        protected void btnCancelarProductoNoProtegido_Click(object sender, EventArgs e)
        {
            sgwNucleo.Pagina.CerrarPopup(popProductosNoProtegidos);
        }

        #endregion

}
