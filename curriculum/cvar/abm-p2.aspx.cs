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
        actualizarDatosTitulosGrado();
        actualizarDatosTitulosDoctorados();
        actualizarDatosTitulosMaestrias();
        actualizarDatosTitulosEspecializaciones();
        actualizarDatosOtrosTitulos();
        actualizarTituloMaximo();
        cvarActualizarTituloMaximo(Session["CUIT"].ToString());
        if ((Session["ID_ESTADOS_PRESENTACIONES"].ToString() != null) && (Session["ID_ESTADOS_PRESENTACIONES"].ToString() != "2"))
        {
            if (Session["ID_PRESENTACIONES"] != "")
            {
                sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
                DataSet FData = FGestor.LeerSQL("SELECT ID_TIPOS_TITULOS FROM SIS_DOCENTES.DOCENTES WHERE ID_DOCENTES = " + Session["ID_DOCENTES"].ToString());
                string ID = FData.Tables[0].Rows[0].ItemArray[0].ToString();
                if (ID != "")
                    FGestor.EscribirSQL("UPDATE SIS_INSTRUCTIVOS.DOCENTES_PRES_TITULOS SET ID_TIPOS_TITULOS = " + ID +
                        " WHERE ID_PRESENTACIONES = " + Session["ID_PRESENTACIONES"].ToString() + " AND ID_DOCENTES = " + Session["ID_DOCENTES"].ToString());
            }
        }
    }

    public static void cvarActualizarTituloMaximo(string CUIT)
    {
        int idTipoTitulo = 0;

        // Doctorados
        try
        {
            DataSet ds = new DataSet();
            System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(CUIT, "formacionAcademica/doctorados");
            ds.ReadXml(new XmlNodeReader(CVAR));
            if (ds.Tables.Count > 0)
            {
                for (int i = ds.Tables[0].Rows.Count - 1; i >= 0; i--)
                    if ((ds.Tables[0].Columns.IndexOf("situacionDeNivel") >= 0) && (ds.Tables[0].Rows[i]["situacionDeNivel"].ToString() != "Completo"))
                        ds.Tables[0].Rows[i].Delete();
                if (ds.Tables[0].Rows.Count > 0)
                    idTipoTitulo = 6;
            }
        }
        catch { }

        // Maestrías
        if (idTipoTitulo == 0)
        {
            try
            {
                DataSet ds = new DataSet();
                System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(CUIT, "formacionAcademica/maestrias");
                ds.ReadXml(new XmlNodeReader(CVAR));
                if (ds.Tables.Count > 0)
                {
                    for (int i = ds.Tables[0].Rows.Count - 1; i >= 0; i--)
                        if ((ds.Tables[0].Columns.IndexOf("situacionDeNivel") >= 0) && (ds.Tables[0].Rows[i]["situacionDeNivel"].ToString() != "Completo"))
                            ds.Tables[0].Rows[i].Delete();
                    if (ds.Tables[0].Rows.Count > 0)
                        idTipoTitulo = 5;
                }
            }
            catch { }
        }

        // Especializaciones
        if (idTipoTitulo == 0)
        {
            try
            {
                DataSet ds = new DataSet();
                System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(CUIT, "formacionAcademica/especializaciones");
                ds.ReadXml(new XmlNodeReader(CVAR));
                if (ds.Tables.Count > 0)
                {
                    for (int i = ds.Tables[0].Rows.Count - 1; i >= 0; i--)
                        if ((ds.Tables[0].Columns.IndexOf("situacionDeNivel") >= 0) && (ds.Tables[0].Rows[i]["situacionDeNivel"].ToString() != "Completo"))
                            ds.Tables[0].Rows[i].Delete();
                    if (ds.Tables[0].Rows.Count > 0)
                        idTipoTitulo = 4;
                }
            }
            catch { }
        }

        // Grados
        if (idTipoTitulo == 0)
        {
            try
            {
                DataSet ds = new DataSet();
                System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(CUIT, "formacionAcademica/grados");
                ds.ReadXml(new XmlNodeReader(CVAR));
                if (ds.Tables.Count > 0)
                {
                    for (int i = ds.Tables[0].Rows.Count - 1; i >= 0; i--)
                        if ((ds.Tables[0].Columns.IndexOf("situacionDeNivel") >= 0) && (ds.Tables[0].Rows[i]["situacionDeNivel"].ToString() != "Completo"))
                            ds.Tables[0].Rows[i].Delete();
                    if (ds.Tables[0].Rows.Count > 0)
                        idTipoTitulo = 3;
                }
            }
            catch { }
        }

        // Terciarios
        if (idTipoTitulo == 0)
        {
            try
            {
                DataSet ds = new DataSet();
                System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(CUIT, "formacionAcademica/terciariaNoUniversitaria");
                ds.ReadXml(new XmlNodeReader(CVAR));
                if (ds.Tables.Count > 0)
                {
                    for (int i = ds.Tables[0].Rows.Count - 1; i >= 0; i--)
                        if ((ds.Tables[0].Columns.IndexOf("situacionDeNivel") >= 0) && (ds.Tables[0].Rows[i]["situacionDeNivel"].ToString() != "Completo"))
                            ds.Tables[0].Rows[i].Delete();
                    if (ds.Tables[0].Rows.Count > 0)
                        idTipoTitulo = 2;
                }
            }
            catch { }
        }

        // Guardar el título máximo obtenido
        try
        {
            sgwMulticapa.Gestor.Gestor FGestor = new sgwMulticapa.Gestor.Gestor();
            if (idTipoTitulo == 0)
                FGestor.EscribirSQL("UPDATE SIS_DOCENTES.DOCENTES SET ID_TIPOS_TITULOS = NULL WHERE CVAR = 'S' AND CUIT = '" + CUIT + "'");
            else
                FGestor.EscribirSQL("UPDATE SIS_DOCENTES.DOCENTES SET ID_TIPOS_TITULOS = " + idTipoTitulo + " WHERE CVAR = 'S' AND CUIT = '" + CUIT + "'");
        }
        catch { }
    }


    protected void actualizarTituloMaximo()
    {
       // bool FResult;
        string FEstado = "-";

        if (grdTitulosPosgradoDoctorado.VisibleRowCount > 0)
            FEstado = "Doctor";
        else
            if (grdTitulosPosgradoMaestrias.VisibleRowCount > 0)
                FEstado = "Magíster";
            else
                if (grdTitulosPosgradoEspecializaciones.VisibleRowCount > 0)
                    FEstado = "Especialista";
                else
                    if (grdTitulosGrado.VisibleRowCount > 0)
                        FEstado = "Grado";
                    else
                        if (grdOtroTitulo.VisibleRowCount > 0)
                            FEstado = "Superior";
                        else FEstado = "-";

        edtDocenteTituloMaximo.Text = FEstado;
    }   

    protected void actualizarDatosTitulosGrado()
    {
        DataSet ds = new DataSet();
        System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "formacionAcademica/grados");
        ds.ReadXml(new XmlNodeReader(CVAR));
        if (ds.Tables.Count == 0) return;
        for (int i = ds.Tables[0].Rows.Count - 1; i >= 0; i--)
        {
            if ((ds.Tables[0].Rows[i]["situacionDeNivel"]).ToString() != "Completo")
                ds.Tables[0].Rows[i].Delete();
        }
        if (ds.Tables[0].Columns.IndexOf("titulo") < 0) ds.Tables[0].Columns.Add("titulo");
        if (ds.Tables[0].Columns.IndexOf("fechaEgreso") < 0) ds.Tables[0].Columns.Add("fechaEgreso");
        ds.Tables[0].Columns.Add("institucion");

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {

           
                if (ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0]).Length > 0)
                    ds.Tables[0].Rows[i].SetField("institucion",
                    ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0])[0].ItemArray[0].ToString());


                if (ds.Tables[0].Rows[i]["fechaEgreso"].ToString() != "")
                    ds.Tables[0].Rows[i].SetField("fechaEgreso", ds.Tables[0].Rows[i].ItemArray[2].ToString().Substring(0, 4));
            
        }
        grdTitulosGrado.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
        grdTitulosGrado.DataSource = ds;
        grdTitulosGrado.DataBind();
        return;
    }  
    protected void actualizarDatosTitulosDoctorados()
    {
        DataSet ds = new DataSet();
        try
        {
            System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "formacionAcademica/doctorados");
            ds.ReadXml(new XmlNodeReader(CVAR));
            if (ds.Tables.Count == 0) return;
            for (int i = ds.Tables[0].Rows.Count - 1; i >= 0; i--)
            {
                if ((ds.Tables[0].Rows[i]["situacionDeNivel"]).ToString() != "Completo")
                    ds.Tables[0].Rows[i].Delete();
            }
            ds.Tables[0].Columns.Add("institucion");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                if (ds.Tables[0].Rows[i]["situacionDeNivel"].ToString() == "Completo")
                {

                    ds.Tables[0].Rows[i].SetField(ds.Tables[0].Columns.Count - 1,
                        ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0])[0].ItemArray[0].ToString());

                    if (ds.Tables[0].Rows[i]["fechaEgreso"].ToString() != "")
                        ds.Tables[0].Rows[i].SetField("fechaEgreso", ds.Tables[0].Rows[i].ItemArray[2].ToString().Substring(0, 4));
                }
                else
                {
                
                
                }
                
            }
            grdTitulosPosgradoDoctorado.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
            grdTitulosPosgradoDoctorado.DataSource = ds;
            grdTitulosPosgradoDoctorado.DataBind();
        }
        catch
        {
            grdTitulosPosgradoDoctorado.SettingsText.EmptyDataRow = "Ocurrió un error en CVar al intentar obtener los datos.";
            return;
        }
    }

    protected void actualizarDatosTitulosMaestrias()
    {
        DataSet ds = new DataSet();
        System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "formacionAcademica/maestrias");
        ds.ReadXml(new XmlNodeReader(CVAR));
        if (ds.Tables.Count == 0) return;
        for (int i = ds.Tables[0].Rows.Count - 1; i >= 0; i--)
        {
            if ((ds.Tables[0].Rows[i]["situacionDeNivel"]).ToString() != "Completo")
                ds.Tables[0].Rows[i].Delete();
        }
        if (ds.Tables[0].Columns.IndexOf("titulo") < 0) ds.Tables[0].Columns.Add("titulo");
        if (ds.Tables[0].Columns.IndexOf("fechaEgreso") < 0) ds.Tables[0].Columns.Add("fechaEgreso");
        ds.Tables[0].Columns.Add("institucion");
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {

            
                ds.Tables[0].Rows[i].SetField(ds.Tables[0].Columns.Count - 1,
                    ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0])[0].ItemArray[0].ToString());

                if (ds.Tables[0].Rows[i]["fechaEgreso"].ToString() != "")
                    ds.Tables[0].Rows[i].SetField("fechaEgreso", ds.Tables[0].Rows[i].ItemArray[2].ToString().Substring(0, 4));

            
        }
        grdTitulosPosgradoMaestrias.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
        grdTitulosPosgradoMaestrias.DataSource = ds;
        grdTitulosPosgradoMaestrias.DataBind();
        return;
    }

    protected void actualizarDatosTitulosEspecializaciones()
    {
        DataSet ds = new DataSet();
        System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "formacionAcademica/especializaciones");
        ds.ReadXml(new XmlNodeReader(CVAR));
        if (ds.Tables.Count == 0) return;
        for (int i = ds.Tables[0].Rows.Count - 1; i >= 0; i--)
        {
            if ((ds.Tables[0].Rows[i]["situacionDeNivel"]).ToString() != "Completo")
                ds.Tables[0].Rows[i].Delete();
        }
        if (ds.Tables[0].Columns.IndexOf("titulo") < 0) ds.Tables[0].Columns.Add("titulo");
        if (ds.Tables[0].Columns.IndexOf("fechaEgreso") < 0) ds.Tables[0].Columns.Add("fechaEgreso");
        ds.Tables[0].Columns.Add("institucion");
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {

           
                ds.Tables[0].Rows[i].SetField(ds.Tables[0].Columns.Count - 1,
                    ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0])[0].ItemArray[0].ToString());


                if (ds.Tables[0].Rows[i]["fechaEgreso"].ToString() != "")
                    ds.Tables[0].Rows[i].SetField("fechaEgreso", ds.Tables[0].Rows[i].ItemArray[2].ToString().Substring(0, 4));
           
        }
        grdTitulosPosgradoEspecializaciones.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
        grdTitulosPosgradoEspecializaciones.DataSource = ds;
        grdTitulosPosgradoEspecializaciones.DataBind();
        return;
    }

    protected void actualizarDatosOtrosTitulos()
    {
        DataSet ds = new DataSet();
        System.Xml.XmlDocument CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXML(Session["CUIT"].ToString(), "formacionAcademica/terciariaNoUniversitaria");
        ds.ReadXml(new XmlNodeReader(CVAR));
        if (ds.Tables.Count == 0) return;
        for (int i = ds.Tables[0].Rows.Count - 1; i >= 0; i--)
        {
            if ((ds.Tables[0].Rows[i]["situacionDeNivel"]).ToString() != "Completo")
                ds.Tables[0].Rows[i].Delete();
        }
        ds.Tables[0].Columns.Add("organizacion");
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i].SetField(ds.Tables[0].Columns.Count - 1,
                ds.Tables[0].Rows[i].GetChildRows(ds.Tables[0].ChildRelations[0])[0].ItemArray[0].ToString());

            if (ds.Tables[0].Rows[i]["fechaEgreso"].ToString() != "")
                ds.Tables[0].Rows[i].SetField("fechaEgreso", ds.Tables[0].Rows[i].ItemArray[2].ToString().Substring(0, 4));
        }
        grdOtroTitulo.KeyFieldName = ds.Tables[0].PrimaryKey[0].Caption;
        grdOtroTitulo.DataSource = ds;
        grdOtroTitulo.DataBind();
    }

    protected void btnModificarTituloGrado_Click(object sender, EventArgs e)
    {
        if (grdTitulosGrado.FocusedRowIndex < 0) return;
        edtFecha.Text = (grdTitulosGrado.GetRowValues(grdTitulosGrado.FocusedRowIndex, "fechaEgreso").ToString());
        edtInstitucion.Text = (grdTitulosGrado.GetRowValues(grdTitulosGrado.FocusedRowIndex, "institucion").ToString());
        edtTitulo.Text = (grdTitulosGrado.GetRowValues(grdTitulosGrado.FocusedRowIndex, "titulo").ToString());
        popGeneral.ShowOnPageLoad = true;
    }

    protected void btnModificarEspecializacion_Click(object sender, EventArgs e)
    {
        if (grdTitulosPosgradoEspecializaciones.FocusedRowIndex < 0) return;
        edtFecha.Text = (grdTitulosPosgradoEspecializaciones.GetRowValues(grdTitulosPosgradoEspecializaciones.FocusedRowIndex, "fechaEgreso").ToString());
        edtInstitucion.Text = (grdTitulosPosgradoEspecializaciones.GetRowValues(grdTitulosPosgradoEspecializaciones.FocusedRowIndex, "institucion").ToString());
        edtTitulo.Text = (grdTitulosPosgradoEspecializaciones.GetRowValues(grdTitulosPosgradoEspecializaciones.FocusedRowIndex, "titulo").ToString());
        popGeneral.ShowOnPageLoad = true;
    }

    protected void btnModificarDoctorado_Click(object sender, EventArgs e)
    {
        if (grdTitulosPosgradoDoctorado.FocusedRowIndex < 0) return;
        edtFecha.Text = (grdTitulosPosgradoDoctorado.GetRowValues(grdTitulosPosgradoDoctorado.FocusedRowIndex, "fechaEgreso").ToString());
        edtInstitucion.Text = (grdTitulosPosgradoDoctorado.GetRowValues(grdTitulosPosgradoDoctorado.FocusedRowIndex, "institucion").ToString());
        edtTitulo.Text = (grdTitulosPosgradoDoctorado.GetRowValues(grdTitulosPosgradoDoctorado.FocusedRowIndex, "titulo").ToString());
        popGeneral.ShowOnPageLoad = true;
    }

    protected void btnModificarMaestria_Click(object sender, EventArgs e)
    {
        if (grdTitulosPosgradoMaestrias.FocusedRowIndex < 0) return;
        edtFecha.Text = (grdTitulosPosgradoMaestrias.GetRowValues(grdTitulosPosgradoMaestrias.FocusedRowIndex, "fechaEgreso").ToString());
        edtInstitucion.Text = (grdTitulosPosgradoMaestrias.GetRowValues(grdTitulosPosgradoMaestrias.FocusedRowIndex, "institucion").ToString());
        edtTitulo.Text = (grdTitulosPosgradoMaestrias.GetRowValues(grdTitulosPosgradoMaestrias.FocusedRowIndex, "titulo").ToString());
        popGeneral.ShowOnPageLoad = true;
    }

    protected void btnModificarOtroTitulo_Click(object sender, EventArgs e)
    {
        if (grdOtroTitulo.FocusedRowIndex < 0) return;
        edtFecha.Text = (grdOtroTitulo.GetRowValues(grdOtroTitulo.FocusedRowIndex, "fechaEgreso").ToString());
        edtInstitucion.Text = (grdOtroTitulo.GetRowValues(grdOtroTitulo.FocusedRowIndex, "organizacion").ToString());
        edtTitulo.Text = (grdOtroTitulo.GetRowValues(grdOtroTitulo.FocusedRowIndex, "titulo").ToString());
        popGeneral.ShowOnPageLoad = true;
    }

    protected void btnCerrarpopGeneral_Click(object sender, EventArgs e)
    {
        sgwNucleo.Pagina.CerrarPopup(popGeneral);
    }


}