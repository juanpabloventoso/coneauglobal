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
using sgwMulticapa.Gestor;
using sgwMulticapa.Objetos.CONEAU.Docentes;

public partial class form_inicio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        sgwNucleo.Usuarios.VerificarUsuarioAutenticado();
        if (!Page.IsPostBack)
        {
            DataSet FData = FGestor.LeerSQL("SELECT  CVAR, CUIT, ID_PAISES, APELLIDO, ID_DOCENTES FROM SIS_DOCENTES.DOCENTES WHERE ID_USUARIOS = " + Session["UsuarioID"]);
            Session["ID_DOCENTES"] = FData.Tables[0].Rows[0].ItemArray[4].ToString();
            if (FData.Tables[0].Rows[0].ItemArray[0].ToString() == "S")
            {
                ddlOrigen.SelectedIndex = 0;
                Session["ORIGENCV"] = 0;
            }
            else
            {
                ddlOrigen.SelectedIndex = 1;
                Session["ORIGENCV"] = 1;
            }

            pnlColaborador.Visible = FData.Tables[0].Rows[0].ItemArray[0].ToString() == "N";
            Session["APELLIDO"] = FData.Tables[0].Rows[0].ItemArray[3].ToString();
            txtCUIT.Text = FData.Tables[0].Rows[0].ItemArray[1].ToString();
            pnlCUIT.Visible = false;//FData.Tables[0].Rows[0].ItemArray[2].ToString() == "13";
            FData = FGestor.LeerSQL("SELECT U.CORREO_ELECTRONICO FROM SIS_DOCENTES.DOCENTES D, SIS_MAINFRAME.USUARIOS U WHERE U.ID_USUARIOS = D.ID_USUARIOS_COLABORADOR " +
                "AND D.ID_USUARIOS = " + Session["UsuarioID"]);
            if (FData.Tables[0].Rows.Count == 1)
                txtColaborador.Text = FData.Tables[0].Rows[0].ItemArray[0].ToString();
            else
                txtColaborador.Text = "";
        }
    }


    protected bool verificarCurriculumCvar(string CUIT)
    {
        System.Xml.XmlDocument CVAR = null;
        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        DataSet FData = FGestor.LeerSQL("SELECT D.ID_PAISES_ORIGEN, P.CODIGO_ISO, D.NUMERO_DOCUMENTO " +
        "FROM  SIS_DOCENTES.DOCENTES D, SIS_MAINFRAME.USUARIOS U, SIS_CONEAU.PAISES P " + 
        "WHERE U.ID_USUARIOS = D.ID_USUARIOS AND D.ID_PAISES_ORIGEN = P.ID_PAISES " +
         "AND D.ID_USUARIOS = " + Session["UsuarioID"]);
        string FIdentificador = CUIT;
        if (FData.Tables[0].Rows[0].ItemArray[0].ToString() != "13")
            FIdentificador = FData.Tables[0].Rows[0].ItemArray[1].ToString() + " " + FData.Tables[0].Rows[0].ItemArray[2].ToString();

        try
        {
            CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXMLRemoto(FIdentificador, "datosPersonales/identificacion");
        }
        catch
        {
            if (FData.Tables[0].Rows[0].ItemArray[0].ToString() != "13")
            {
                try
                {
                    CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXMLRemoto(CUIT, "datosPersonales/identificacion");
                    FGestor.EscribirSQL("UPDATE SIS_DOCENTES.DOCENTES SET ID_PAISES_ORIGEN = 13 WHERE CUIT = '" + CUIT + "'");
                }
                catch
                {
                    sgwNucleo.Pagina.MostrarEstado("No se encontró un currículum en CVar con su número de CUIT.", 1);
                    return false;
                }
            }
        }
        string FApellido = sgwFunciones.CONEAU.Docentes.cvarLeer(CVAR, "apellido").ToLower().Trim();
        if (!Session["APELLIDO"].ToString().ToLower().Trim().Contains(FApellido))
        {
            sgwNucleo.Pagina.MostrarEstado("No se encontró un currículum en CVar que coincida con su apellido.", 1);
            return false;
        }
        CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXMLRemoto(FIdentificador, "datosPersonales/direccionResidencial");
        string FMail1 = sgwFunciones.CONEAU.Docentes.cvarLeer(CVAR, "email").ToLower().Trim();
        CVAR = sgwFunciones.CONEAU.Docentes.cvarLeerXMLRemoto(FIdentificador, "datosPersonales/direccionLaboral");
        string FMail2 = sgwFunciones.CONEAU.Docentes.cvarLeer(CVAR, "email").ToLower().Trim();
        if ((!Session["UsuarioCorreo"].ToString().ToLower().Trim().Contains(FMail1)) && (!Session["UsuarioCorreo"].ToString().ToLower().Trim().Contains(FMail2)))
        {
            sgwNucleo.Pagina.MostrarEstado("No se encontró un currículum en CVar que coincida con su dirección de correo electrónico.", 1);
            return false;
        }
        return true;
    }

    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        if ((pnlCUIT.Visible) && (!sgwNucleo.Funciones.VerificarCUIT(txtCUIT.Text)))
        {
            sgwNucleo.Pagina.MostrarEstado("El CUIT ingresado no es válido.", 1);
            return;
        }

        // Origen CVar
        if (ddlOrigen.SelectedIndex == 0)
            if (!verificarCurriculumCvar(txtCUIT.Text)) return;

        sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
        int idColaborador = 0;
        if (txtColaborador.Text != "")
        {
            if (!sgwNucleo.Funciones.VerificarCorreo(txtColaborador.Text))
            {
                sgwNucleo.Pagina.MostrarEstado("La dirección de correo ingresada no es correcta.", 1);
                return;
            }
            DataSet FData = FGestor.LeerSQL("SELECT U.ID_USUARIOS FROM SIS_MAINFRAME.USUARIOS U WHERE ACTIVO = 'S' AND LOWER(TRIM(U.CORREO_ELECTRONICO)) = '" + txtColaborador.Text.ToLower().Trim() + "'");
            if (FData.Tables[0].Rows.Count != 1)
            {
                sgwNucleo.Pagina.MostrarEstado("El colaborador ingresado no posee cuenta activa de CONEAU Global.", 1);
                return;
            }
            idColaborador = int.Parse(FData.Tables[0].Rows[0].ItemArray[0].ToString());
        }
        string FSQL = "UPDATE SIS_DOCENTES.DOCENTES SET ";
        if (ddlOrigen.SelectedIndex == 0)
            FSQL += "CVAR = 'S'";
        else
            FSQL += "CVAR = 'N'";
        if (pnlCUIT.Visible)
            FSQL += ", CUIT = '" + txtCUIT.Text.Trim() + "'";
        if (txtColaborador.Text != "")
            FSQL += ", ID_USUARIOS_COLABORADOR = " + idColaborador.ToString();
        else
            FSQL += ", ID_USUARIOS_COLABORADOR = NULL";
        FSQL += " WHERE ID_USUARIOS = " + Session["UsuarioID"];

        if (idColaborador > 0)
        {
            DataSet FData = FGestor.LeerSQL("SELECT GU.ID_GRUPOS_USUARIOS FROM SIS_MAINFRAME.GRUPOS_USUARIOS GU WHERE ID_USUARIOS = " + idColaborador + " AND ID_GRUPOS = 76");
            if (FData.Tables[0].Rows.Count == 0)
                FGestor.EscribirSQL("INSERT INTO SIS_MAINFRAME.GRUPOS_USUARIOS (ID_GRUPOS_USUARIOS, ID_GRUPOS, ID_USUARIOS) VALUES (" +
                "SIS_MAINFRAME.SEQ_GRUPOS_USUARIOS.NEXTVAL, 76, " + idColaborador + ")");
        }
        FGestor.EscribirSQL(FSQL);

        if (ddlOrigen.SelectedIndex != int.Parse(Session["ORIGENCV"].ToString()))
        {
            if (ddlOrigen.SelectedIndex == 0) Session["ORIGENCV"] = "S"; else Session["ORIGENCV"] = "N";
            FGestor.EscribirSQL("INSERT INTO SIS_DOCENTES.DOCENTES_ORIGENES_CV (CVAR, ID_DOCENTES, FECHA, ID_DOCENTES_ORIGENES_CV) VALUES ('" + Session["ORIGENCV"].ToString() + "', " + int.Parse(Session["ID_DOCENTES"].ToString()) + ", SYSDATE, SIS_DOCENTES.SEQ_DOCENTES_ORIGENES_CV.NEXTVAL )");
        } 


        Response.Redirect("default.aspx");
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("default.aspx");
    }

}
