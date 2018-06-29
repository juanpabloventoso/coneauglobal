using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
using System.Diagnostics;
using DevExpress.Web.ASPxPopupControl;

/// <summary>
/// Descripción breve de sgwNucleo
/// </summary>
namespace sgwNucleo
{

    /////////////////////////////////////////////////////////////////////
    // Funciones generales del núcleo
    /////////////////////////////////////////////////////////////////////
    public static class Funciones
    {

        // Verificar un texto requerido por el sistema
        public static bool VerificarRequerido(string ATexto)
        {
            return (ATexto.Trim() != "");
        }

        // Verificar un texto conversible a entero requerido por el sistema
        public static bool VerificarRequeridoInt(string ATexto)
        {
            if (!VerificarRequerido(ATexto))
                return false;
            int FValor = 0;
            return int.TryParse(ATexto, out FValor);
        }

        // Verificar un texto conversible a float requerido por el sistema
        public static bool VerificarRequeridoFloat(string ATexto)
        {
            if (!VerificarRequerido(ATexto))
                return false;
            float FValor = 0;
            return float.TryParse(ATexto, out FValor);
        }

        // Verificar un correo electrónico válido
        public static bool VerificarCorreo(string ACorreo)
        {
            string FExpresion = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";

            if (System.Text.RegularExpressions.Regex.IsMatch(ACorreo, FExpresion))
            {
                if (System.Text.RegularExpressions.Regex.Replace(ACorreo, FExpresion, String.Empty).Length == 0)
                    return true;
                else
                    return false;
            }
            else
                return false;
        }

        public static int CalcularDigitoCUIT(string ACUIT)
        {
            string BCUIT = ACUIT.Replace("-", "");
            int[] mult = new[] { 5, 4, 3, 2, 7, 6, 5, 4, 3, 2 };
            char[] nums = BCUIT.ToCharArray();
            int total = 0;
            for (int i = 0; i < mult.Length; i++)
                total += int.Parse(nums[i].ToString()) * mult[i];
            var resto = total % 11;
            return resto == 0 ? 0 : resto == 1 ? 9 : 11 - resto;
        }

        public static bool VerificarCUIT(string ACUIT)
        {
            string FExpresion = "^[0-9]{2}-[0-9]{8}-[0-9]$";

            if (System.Text.RegularExpressions.Regex.IsMatch(ACUIT, FExpresion))
            {
                if (System.Text.RegularExpressions.Regex.Replace(ACUIT, FExpresion, String.Empty).Length == 0)
                {
                    int calculado = CalcularDigitoCUIT(ACUIT);
                    int digito = int.Parse(ACUIT.Substring(12));
                    return calculado == digito;
                }
                else
                    return false;
            }
            else
                return false;
        }

        // Detectar si se ejecuta desde una PC de desarrollo
        public static bool EjecucionDesdeIDE()
        {
            string FAppName = Process.GetCurrentProcess().MainModule.FileName.ToString();
            return (FAppName.ToLower().Contains("webdev"));
        }

        public static bool ConexionLocal()
        {
            return (System.Web.HttpContext.Current.Request.UserHostAddress == "172.16.0.1") ||
                (System.Web.HttpContext.Current.Request.UserHostAddress == "127.0.0.1");
        }

        public static string DominioBase()
        {
            string FLink = "IP_REMOTO";
            if (ConexionLocal())
                FLink = "IP_LOCAL";
            return FLink;
        }

        public static string URLBase()
        {
            return "http://" + DominioBase() + "/";
        }

    }



    /////////////////////////////////////////////////////////////////////
    // Funciones de manejo de archivos
    /////////////////////////////////////////////////////////////////////

    public static class Archivos
    {
        public static string ObtenerNombreTemporal()
        {
            return "tmp_" + HttpContext.Current.Session.SessionID;
        }

        public static void CrearCarpeta(string ARuta)
        {
            if (!ExisteCarpeta(ARuta)) System.IO.Directory.CreateDirectory(ARuta);
        }

        public static void EliminarCarpeta(string ARuta)
        {
            DirectoryInfo di = new DirectoryInfo(ARuta);
            if (di.Exists) di.Delete(true);
        }

        public static void RenombrarCarpeta(string ARuta, string ANuevaRuta)
        {
            if (ExisteCarpeta(ARuta)) System.IO.Directory.Move(ARuta, ANuevaRuta);
        }

        public static void MoverCarpeta(string AOrigen, string ADestino)
        {
            if (ExisteCarpeta(AOrigen)) System.IO.Directory.Move(AOrigen, ADestino);
        }

        public static bool ExisteCarpeta(string ARuta)
        {
            return System.IO.Directory.Exists(ARuta);
        }

        public static void Eliminar(string AArchivo)
        {
            System.IO.File.Delete(AArchivo);
        }

        public static void Copiar(string AOrigen, string ADestino)
        {
            System.IO.File.Copy(AOrigen, ADestino, true);
        }

        public static void Mover(string AOrigen, string ADestino)
        {
            if (Existe(AOrigen)) System.IO.File.Move(AOrigen, ADestino);
        }

        public static void Renombrar(string AArchivo, string ANuevoArchivo)
        {
            if (Existe(AArchivo)) System.IO.File.Move(AArchivo, ANuevoArchivo);
        }

        public static bool Existe(string AArchivo)
        {
            return System.IO.File.Exists(AArchivo);
        }

    }


    /////////////////////////////////////////////////////////////////////
    // Funciones de página
    /////////////////////////////////////////////////////////////////////

    public static class Pagina
    {
        // Retorna TRUE si existe un pedido de sólo lectura para ver el contenido actual
        public static bool SoloLectura()
        {
            return ((((HttpContext.Current.Session["SoloLectura"] != null) && (HttpContext.Current.Session["SoloLectura"] == "S"))
            || ((HttpContext.Current.Request.Params["SoloLectura"] != null) && (HttpContext.Current.Request.Params["SoloLectura"] == "1")))
            || (sgwNucleo.Usuarios.UsuarioGrupos("'Usuarios de consulta'")));
        }

        public static void MostrarEstado(string AEstado, int ATipo, int ATimeout = 3000)
        {
            System.Web.UI.Page FPage = (System.Web.UI.Page)System.Web.HttpContext.Current.Handler;
            MasterPage FMaster = FPage.Master;
            while (FMaster.Master != null)
                FMaster = FMaster.Master;
            Panel FPanel = ((Panel)FMaster.FindControl("pnlEstadoAJAX"));
            Label FLabel = ((Label)FMaster.FindControl("lblEstadoAJAX"));
            Literal FError = ((Literal)FMaster.FindControl("lblEstadoAJAXError"));
            FLabel.Text = AEstado;
            switch (ATipo)
            {
                case 1: 
                    FPanel.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFE6A8");
                    FLabel.ForeColor = System.Drawing.Color.Black;
                    FError.Visible = false;
                    break;
                case 2: 
                    FPanel.BackColor = System.Drawing.ColorTranslator.FromHtml("#B0DFA0");
                    FLabel.ForeColor = System.Drawing.Color.Black;
                    FError.Visible = false;
                    break;
                case 3:
                    FPanel.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF6633");
                    FLabel.ForeColor = System.Drawing.Color.White;
                    FError.Visible = false;
                    break;
                case 4:
                    FPanel.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF6633");
                    FLabel.ForeColor = System.Drawing.Color.White;
                    FError.Visible = true;
                    break;
            }
            ScriptManager.RegisterStartupScript((System.Web.UI.Page)System.Web.HttpContext.Current.Handler, typeof(Page),
            "MostrarEstado", "<script language='javascript'>document.getElementById('pnlEstadoAJAXContenedor').style.display = 'inline';</script>", false);
            ScriptManager.RegisterStartupScript((System.Web.UI.Page)System.Web.HttpContext.Current.Handler, typeof(Page),
            "OcultarEstado", "<script language='javascript'>setTimeout(function(){document.getElementById('pnlEstadoAJAXContenedor').style.display = 'none'}, " + ATimeout + ");</script>", false);
        }
        
        public static void NuevaVentana(string AURL, string ATitulo, int AAncho, int AAlto)
        {
            ScriptManager.RegisterStartupScript((System.Web.UI.Page)System.Web.HttpContext.Current.Handler, typeof(Page),
            "NuevaVentana" + ATitulo, "<script language='javascript'>sgwNuevaVentana('" + AURL + "');</script>", false);
        }

        public static void CerrarPopup(ASPxPopupControl APopup)
        {
            APopup.ShowOnPageLoad = false;
            ScriptManager.RegisterStartupScript((System.Web.UI.Page)System.Web.HttpContext.Current.Handler, typeof(Page), "popup", 
                "<script language='javascript'>document.getElementsByTagName('html')[0].style.overflow = '';</script>", false);
        }
      
        public static void AplicarSoloLectura(Control APadre)
        {
            foreach (Control FControl in APadre.Controls)
            {
                // Cuadros en sólo lectura
                if (FControl.GetType().ToString().Equals("System.Web.UI.WebControls.TextBox"))
                    ((TextBox)FControl).ReadOnly = true;

                // Listas desplegables desactivadas
                if ((FControl.GetType().ToString().Equals("System.Web.UI.WebControls.DropDownList")) &&
                    (!FControl.ID.StartsWith("ddlNav")))
                    ((DropDownList)FControl).Enabled = false;

                // Casillas de verificación desactivadas
                if (FControl.GetType().ToString().Equals("System.Web.UI.WebControls.CheckBox"))
                    ((CheckBox)FControl).Enabled = false;

                // Selección de archivos (estándar)
                if (FControl.GetType().ToString().Equals("System.Web.UI.WebControls.FileUpload"))
                    FControl.Visible = false;

                // Selección de archivos (AJAX)
                if (FControl.GetType().ToString().Equals("AjaxControlToolkit.AsyncFileUpload"))
                    FControl.Visible = false;

                // Calendarios (AJAX)
                if (FControl.GetType().ToString().Equals("AjaxControlToolkit.CalendarExtender"))
                    ((AjaxControlToolkit.CalendarExtender)FControl).Enabled = false;

                // Ocultar/cambiar texto de botones
                if (FControl.GetType().ToString().Equals("System.Web.UI.WebControls.Button"))
                {
                    Button FButton = ((Button)FControl);
                    if (FButton.Text.Contains("Guardar"))
                        FButton.Visible = false;
                    if (FButton.Text.Contains("Aceptar"))
                        FButton.Visible = false;
                    if (FButton.Text.Contains("Agregar"))
                        FButton.Visible = false;
                    if (FButton.Text == "+")
                        FButton.Visible = false;
                    if (FButton.Text.Contains("Modificar"))
                        FButton.Text = "Abrir";
                    if (FButton.Text.Contains("Eliminar"))
                        FButton.Visible = false;
                    if (FButton.Text.Contains("Seleccionar"))
                        FButton.Visible = false;
                    if (FButton.Text.Contains("Cancelar"))
                        FButton.Text = "Cerrar";
                }
                AplicarSoloLectura(FControl);
            }
        } 

        public static void AbrirFrame(string AURL)
        {
            ScriptManager.RegisterStartupScript((System.Web.UI.Page)System.Web.HttpContext.Current.Handler, typeof(Page),
                "cgIFRAME",
                "<script language='javascript'>" +
                "if (document.getElementById('divIFrame') != null) { " +
                "document.getElementById('elemIF').src = '" + AURL + "'; " +
                "document.getElementById('divIFrame').style.display = 'block'; " +
                "} else {" +
                "var elemIF = document.createElement('iframe'); " +
                "elemIF.id = 'elemIF'; " +
                "elemIF.src = '" + AURL + "'; " +
                "elemIF.frameBorder = '0'; " +
                "elemIF.style.width = '100%'; " +
                "elemIF.style.height = '100%'; " +
                "var elemDIV2 = document.createElement('div'); " +
                "elemDIV2.className = 'div-mostrar-frame'; " +
                "elemDIV2.appendChild(elemIF); " +
                "var elemC = document.createElement('img'); " +
                "elemC.className = 'div-mostrar-frame-cerrar'; " +
                "elemC.src = '/coneauglobal/imagenes/ajax/close.png'; " +
                "elemC.title = 'Cerrar'; " +
                "elemC.onclick = function() { document.getElementById('divIFrame').style.display = 'none'; document.getElementById('elemIF').src = ''; }; " +
                "var elemDIV = document.createElement('div'); " +
                "elemDIV.id = 'divIFrame'; " +
                "elemDIV.className = 'divActualizacionAJAXFS'; " +
                "elemDIV.style.textAlign = 'center'; " +
                "elemDIV.appendChild(elemDIV2); " +
                "elemDIV.appendChild(elemC); " +
                "document.body.appendChild(elemDIV);" +
                "}</script>", false);
        }

        public static void MostrarPDF(string ARuta)
        {
            if (!Archivos.Existe(ARuta)) return;
            HttpContext.Current.Session["SGW_ARCHIVO_RUTA"] = ARuta;
            AbrirFrame("/coneauglobal/mainframe/funciones/mostrar-pdf.aspx");
        }

        public static void AbrirArchivo(string ARuta, string ANombre)
        {
            if (!sgwNucleo.Archivos.Existe(ARuta))
                return;
            if (System.IO.Path.GetExtension(ARuta).ToLower() == ".pdf")
                sgwNucleo.Pagina.MostrarPDF(ARuta);              
            else
                sgwNucleo.Pagina.Descargar(ARuta, ANombre, true);
        }

        public static void DescargarArchivoEvaluador(string ARuta, string ANombre)
        {
            sgwNucleo.Pagina.Descargar(ARuta, ANombre, false);
        }

        public static void AbrirArchivoEvaluador(string ARuta, string ANombre)
        {
            if (System.IO.Path.GetExtension(ARuta).ToLower() == ".pdf")
                sgwNucleo.Pagina.MostrarPDF(ARuta);
            else
                sgwNucleo.Pagina.Descargar(ARuta, ANombre, false);
        }

        public static void Descargar(string ARuta, string ANombre, bool AEliminar)
        {
            if (!Archivos.Existe(ARuta)) return;
            HttpContext.Current.Session["SGW_ARCHIVO_RUTA"] = ARuta;
            HttpContext.Current.Session["SGW_ARCHIVO_NOMBRE"] = ANombre;
            if (AEliminar)
                HttpContext.Current.Session["SGW_ARCHIVO_ELIMINAR"] = true;
            else
                HttpContext.Current.Session.Remove("SGW_ARCHIVO_ELIMINAR");

            ScriptManager.RegisterStartupScript((System.Web.UI.Page)System.Web.HttpContext.Current.Handler, typeof(Page),
                "downloadFile",
                "<script language='javascript'>var elemIF = document.createElement('iframe'); " +
                "elemIF.src = '/coneauglobal/mainframe/funciones/descargar.aspx'; " + 
                "elemIF.style.display = 'none'; " + 
                "document.body.appendChild(elemIF);</script>", false);
        }

        public static void DescargarRAR(string ARuta, string ANombre, bool AEliminar)
        {
            string FRAR = Rutas.RutaTemporales() + "\\" + Archivos.ObtenerNombreTemporal() + ".rar";
            sgwNucleo.RAR.Funciones.Comprimir(ARuta, FRAR, "");
            sgwNucleo.Pagina.Descargar(FRAR, ANombre, AEliminar);
        }

        public static void ExportarGrilla(int AModo, string AGrilla)
        {
            MasterPage FMaster = ((System.Web.UI.Page)System.Web.HttpContext.Current.Handler).Master;
            while (FMaster.Master != null)
            FMaster = FMaster.Master;
            DevExpress.Web.ASPxGridView.Export.ASPxGridViewExporter grdExportar = 
                ((DevExpress.Web.ASPxGridView.Export.ASPxGridViewExporter)FMaster.FindControl("grdExportar"));
            grdExportar.GridViewID = AGrilla;
            switch (AModo)
            {
                case 1: grdExportar.WriteCsvToResponse("Listado"); return;
                case 2: grdExportar.WritePdfToResponse("Listado"); return;
                case 3: grdExportar.WriteRtfToResponse("Listado"); return;
                case 4: grdExportar.WriteXlsToResponse("Listado"); return;
            }
        }

        public static void ExportarGrillaPV(int AModo, string AGrilla)
        {
            MasterPage FMaster = ((System.Web.UI.Page)System.Web.HttpContext.Current.Handler).Master;
            while (FMaster.Master != null)
                FMaster = FMaster.Master;
            DevExpress.Web.ASPxPivotGrid.Export.ASPxPivotGridExporter grdExportar =
                ((DevExpress.Web.ASPxPivotGrid.Export.ASPxPivotGridExporter)FMaster.FindControl("grdPvExportar"));
            grdExportar.ASPxPivotGridID = AGrilla;
            string Ruta = "";
            string Archivo = "Listado";
            switch (AModo)
            {
                case 1:
                    Archivo += ".html";
                    Ruta = sgwNucleo.Rutas.RutaTemporales() + "\\" + Archivo;
                    grdExportar.ExportToHtml(Ruta);
                    sgwNucleo.Pagina.Descargar(Ruta, Archivo, true);
                    return;
                case 2: 
                    Archivo += ".pdf";
                    Ruta = sgwNucleo.Rutas.RutaTemporales() + "\\" + Archivo;
                    grdExportar.ExportToPdf(Ruta);
                    sgwNucleo.Pagina.Descargar(Ruta, Archivo, true);
                    return;
                case 3: 
                    Archivo += ".rtf";
                    Ruta = sgwNucleo.Rutas.RutaTemporales() + "\\" + Archivo;
                    grdExportar.ExportToRtf(Ruta);
                    sgwNucleo.Pagina.Descargar(Ruta, Archivo, true);
                    return;
                case 4: 
                    Archivo += ".xls";
                    Ruta = sgwNucleo.Rutas.RutaTemporales() + "\\" + Archivo;
                    grdExportar.ExportToXls(Ruta);
                    sgwNucleo.Pagina.Descargar(Ruta, Archivo, true);
                    return;
            }
           
        }


    }    

    /////////////////////////////////////////////////////////////////////
    // Funciones de rutas de acceso constantes
    /////////////////////////////////////////////////////////////////////

    public static class Rutas
    {
        public static string RutaBase()
        {
            if (Funciones.EjecucionDesdeIDE())
                return "C:\\Proyectos\\CONEAUGlobal\\_LOCAL";
            else
                return "E:\\CONEAU Global";
        }

        public static string RutaPrivada()
        {
            return RutaBase() + "\\Privado";
        }

        public static string RutaTemporales()
        {
            return RutaPrivada() + "\\Temporales";
        }

        public static string RutaPublica()
        {
            if (Funciones.EjecucionDesdeIDE())
                return RutaBase() + "C:\\Proyectos\\CONEAUGlobal";
            else
                return RutaBase() + "\\Público";
        }
    }

    /////////////////////////////////////////////////////////////////////
    // Funciones de control de usuarios y grupos
    /////////////////////////////////////////////////////////////////////

    public static class Usuarios
    {

        public static bool UsuarioAutenticado()
        {
            return ((HttpContext.Current.Session["UsuarioAutenticado"] != null) &&
                (HttpContext.Current.Session["UsuarioAutenticado"].ToString() == "S"));
        }

        public static bool VerificarUsuarioAutenticado()
        {
            if (!UsuarioAutenticado())
            {
                HttpContext.Current.Response.Redirect("/coneauglobal/iniciar-sesion/");
                return false;
            }
            return true;
        }

        public static bool VerificarUsuarioPersonal()
        {
            VerificarUsuarioAutenticado();
            if (!sgwNucleo.Usuarios.UsuarioGrupo("Personal de la CONEAU"))
            {
                HttpContext.Current.Response.Redirect("/coneauglobal/mainframe/application/acceso-denegado.aspx");
                return false;
            }
            return true;
        }

        public static void DenegarAcceso(string AMensaje)
        {
            HttpContext.Current.Session["AccesoDenegadoMensaje"] = AMensaje;
            HttpContext.Current.Response.Redirect("/coneauglobal/mainframe/application/acceso-denegado.aspx");
        }


        public static bool GrupoPersonal()
        {
            return UsuarioGrupo("Personal de la CONEAU");
        }

        public static bool GrupoEvaluador()
        {
            return UsuarioGrupo("Pares evaluadores");
        }

        public static bool GrupoUniversitario()
        {
            return UsuarioGrupo("Usuarios universitarios");
        }

        public static bool GrupoDocente()
        {
            return UsuarioGrupo("Docentes universitarios") || UsuarioGrupo("Colaboradores de docentes universitarios");
        }

        public static bool GrupoAdministrador()
        {
            return UsuarioGrupo("Administradores de CONEAU Global");
        }

        public static bool EsPersonal()
        {
            return UsuarioAutenticado() && GrupoPersonal();
        }

        public static bool EsEvaluador()
        {
            return UsuarioAutenticado() && GrupoEvaluador();
        }

        public static bool EsUniversitario()
        {
            return UsuarioAutenticado() && GrupoUniversitario();
        }

        public static bool EsDocente()
        {
            return UsuarioAutenticado() && GrupoDocente();
        }

        public static bool EsAdministrador()
        {
            return UsuarioAutenticado() && GrupoAdministrador();
        }

        // Generar un nombre de usuario nuevo a partir de sus datos personales
        public static string GenerarUsuario(string AApellido, string APrimerNombre, string ASegundoNombre)
        {
            bool FExistente = true;
            int FCount = 1;
            string FUsuario = "";
            while (FExistente)
            {
                string FInicio = "";
                if (APrimerNombre.Trim() != "")
                    FInicio = APrimerNombre.ToLower().Replace("'", "").Replace("´", "").Replace(" ", "").Replace("á", "a").Replace("é", "e").Replace("í", "i").Replace("ó", "o").Replace("ú", "u").Replace("ñ", "n").Substring(0, FCount);
                string FMedio = "";
                if (ASegundoNombre.Trim() != "")
                    FMedio = ASegundoNombre.ToLower().Replace("'", "").Replace("´", "").Replace(" ", "").Replace("á", "a").Replace("é", "e").Replace("í", "i").Replace("ó", "o").Replace("ú", "u").Replace("ñ", "n").Substring(0, FCount);
                string FFin = AApellido.ToLower().Replace("'", "").Replace("´", "").Replace(" ", "").Replace("á", "a").Replace("é", "e").Replace("í", "i").Replace("ó", "o").Replace("ú", "u").Replace("ñ", "n");
                if ((FInicio == "") && (FMedio == "") && (FCount > 1))
                    FUsuario = FInicio + FMedio + FFin + (FCount - 1).ToString();
                else
                    FUsuario = FInicio + FMedio + FFin;
                sgwMulticapa.Gestor.Gestor FGestor = new sgwMulticapa.Gestor.Gestor();
                DataSet FData = FGestor.LeerSQL("SELECT USUARIO FROM SIS_MAINFRAME.USUARIOS WHERE USUARIO = '" + FUsuario + "'");
                FExistente = ((FData != null) && (FData.Tables[0].Rows.Count > 0));
                FCount++;
            }
            return FUsuario;
        }

        // Generar una contraseña de 8 caracteres
        public static string GenerarPassword()
        {
            string FResult = System.Guid.NewGuid().ToString();
            FResult = FResult.Replace("-", string.Empty);
            return FResult.Substring(0, 8);
        }

        public static string GenerarCodigoAleatorio()
        {
            string FResult = System.Guid.NewGuid().ToString();
            FResult = FResult.Replace("-", string.Empty);
            return FResult;
        }

        public static bool ValidarPassword(string APassword)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(APassword, "(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,16})$");
        }

        public static string MD5Hash(string APassword)
        {
            byte[] FHash = System.Security.Cryptography.MD5.Create().ComputeHash(System.Text.Encoding.ASCII.GetBytes(APassword));
            System.Text.StringBuilder FSB = new System.Text.StringBuilder();
            for (int I = 0; I < FHash.Length; I++)
                FSB.Append(FHash[I].ToString("X2"));
            return FSB.ToString();
        }

        // Verificar si el usuario de sistema pertenece a un grupo determinado
        public static bool UsuarioGrupo(string AGrupo)
        {
            sgwMulticapa.Gestor.Gestor FGestor = new sgwMulticapa.Gestor.Gestor();
            DataSet FData = FGestor.LeerSQL("SELECT GRUPO FROM SIS_MAINFRAME.Q_GRUPOS_USUARIOS WHERE ID_USUARIOS = " +
                HttpContext.Current.Session["UsuarioID"].ToString() + " AND GRUPO = '" + AGrupo + "'");
            return ((FData != null) && (FData.Tables[0].Rows.Count == 1));
        }

        // Obtener los grupos a los que pertenece el usuario
        public static string ObtenerGrupos()
        {
            sgwMulticapa.Gestor.Gestor FGestor = new sgwMulticapa.Gestor.Gestor();
            DataSet FData = FGestor.LeerSQL("SELECT WM_CONCAT(GRUPO) FROM SIS_MAINFRAME.Q_GRUPOS_USUARIOS WHERE ID_USUARIOS = " +
                HttpContext.Current.Session["UsuarioID"].ToString());
            return FData.Tables[0].Rows[0].ItemArray[0].ToString();
        }

        // Verificar si el usuario de sistema pertenece a uno de los grupos especificados
        public static bool UsuarioGrupos(string AGrupos)
        {
            if (HttpContext.Current.Session["UsuarioID"] == null) return false;
            sgwMulticapa.Gestor.Gestor FGestor = new sgwMulticapa.Gestor.Gestor();
            DataSet FData = FGestor.LeerSQL("SELECT GRUPO FROM SIS_MAINFRAME.Q_GRUPOS_USUARIOS WHERE ID_USUARIOS = " +
                HttpContext.Current.Session["UsuarioID"].ToString() + " AND GRUPO IN (" + AGrupos + ")");
            return ((FData != null) && (FData.Tables[0].Rows.Count > 0));
        }

        // Notificar al usuario el acceso denegado a una página
        public static void NotificarAccesoDenegado(string AMensaje)
        {
            HttpContext.Current.Session["AccesoDenegadoMensaje"] = AMensaje;
            HttpContext.Current.Response.Redirect("/coneauglobal/mainframe/application/acceso-denegado.aspx");
        }

        // Iniciar la sesión en el servidor
        public static void IniciarSesion()
        {
            // Ignorar la auditoría si se está ejecutando en desarrollo
            if (!Funciones.EjecucionDesdeIDE())
            {
                sgwMulticapa.Gestor.Gestor FGestor = new sgwMulticapa.Gestor.Gestor();
                FGestor.EscribirSQL("INSERT INTO SIS_MAINFRAME.SESIONES (ID_SESIONES, ID_USUARIOS, CONECTADO, FECHA, HOST_IP, HOST_NOMBRE, URL) VALUES " +
                "(SIS_MAINFRAME.SEQ_SESIONES.NEXTVAL, " + HttpContext.Current.Session["UsuarioID"].ToString() + ", 'S', SYSDATE, '" +
                HttpContext.Current.Request.UserHostAddress.ToString() + "', '" +
                HttpContext.Current.Request.UserHostName.ToString() + "', '" +
                HttpContext.Current.Request.Url.ToString() + "')");
            }
            HttpContext.Current.Session["UsuarioAutenticado"] = "S";
        }

        // Finalizar la sesión en el servidor
        public static void FinalizarSesion()
        {
            // Ignorar la auditoría si se está ejecutando en desarrollo
            if (!Funciones.EjecucionDesdeIDE())
            {
                sgwMulticapa.Gestor.Gestor FGestor = new sgwMulticapa.Gestor.Gestor();
                if (HttpContext.Current.Session["UsuarioAutenticado"] != "S") return;
                FGestor.EscribirSQL("INSERT INTO SIS_MAINFRAME.SESIONES (ID_SESIONES, ID_USUARIOS, CONECTADO, FECHA, HOST_IP, HOST_NOMBRE, URL) VALUES " +
                "(SIS_MAINFRAME.SEQ_SESIONES.NEXTVAL, " + HttpContext.Current.Session["UsuarioID"].ToString() + ", 'N', SYSDATE, '" +
                HttpContext.Current.Request.UserHostAddress.ToString() + "', '" +
                HttpContext.Current.Request.UserHostName.ToString() + "', '" +
                HttpContext.Current.Request.Url.ToString() + "')");
            }
            HttpContext.Current.Session.Remove("UsuarioAutenticado");
            HttpContext.Current.Session.Remove("Usuario");
            HttpContext.Current.Session.Remove("UsuarioID");
            HttpContext.Current.Session.Remove("UsuarioPassword");
            HttpContext.Current.Session.Remove("UsuarioDescripcion");
        }

    }

    /////////////////////////////////////////////////////////////////////
    // Funciones de geolocalización y mapas
    /////////////////////////////////////////////////////////////////////

    public static class GeoLocalizacion
    {


    }
}