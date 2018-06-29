using System;
using System.Collections;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DevExpress.Web.ASPxGridView;
using sgwMulticapa.Datos.Base;
using sgwMulticapa.Datos.Oracle;
using System.Reflection;
using System.Collections.Generic;

/// <summary>
/// Summary description for CapaGestor
/// </summary>

namespace sgwMulticapa.Gestor
{

    // Clase base de acceso a datos
    public class Gestor
    {
        CONEAUwsDB.wsDB _wsDB;
        int _usarWS;
        private static Gestor oGestor = null;
        private static DBHandler oDBHandler = null;

        public Gestor()
        {
            _usarWS = int.Parse(ConfigurationManager.AppSettings["UsarWS"]);
            if (_usarWS != 0)
            {
                _wsDB = new CONEAUwsDB.wsDB();
                CONEAUwsDB.sgwAuthHeader FAuth = new CONEAUwsDB.sgwAuthHeader();
                FAuth.Usuario = "USERNAME";
                FAuth.Password = "PASSWORD";
                _wsDB.sgwAuthHeaderValue = FAuth;
            }
        }

        public static Gestor GestorGlobal()
        {
            if (oGestor == null)
                oGestor = new Gestor();
            return oGestor;
        }


        #region DBHandler

        public static DBHandler DBGlobal()
        {
            if (oDBHandler == null)
            {
                string FMotor = ConfigurationManager.AppSettings["MotorDB"];
                oDBHandler = new OracleDBHandler();
            }
            return oDBHandler;
        }


        public DataSet LeerSQL(string ASQL)
        {
            if (_usarWS != 0)
                return _wsDB.LeerSQL(ASQL);
            DBHandler FConector = DBGlobal();
            FConector.Conectar("ORA_CONEAUIW");
            try
            {
                return FConector.ConsultarSQL(ASQL);
            }
            finally
            {
                FConector.Desconectar();
            }
        }

        public void EscribirSQL(string ASQL)
        {
            if (_usarWS != 0)
            {
                _wsDB.EscribirSQL(ASQL);
                return;
            }
            DBHandler FConector = DBGlobal();
            FConector.Conectar("ORA_CONEAUIW");
            try
            {
                FConector.EjecutarSQL(ASQL);
            }
            finally
            {
                FConector.Desconectar();
            }
        }

        public int EscribirSQLClave(string ASQL)
        {
            if (_usarWS != 0)
                return _wsDB.EscribirSQLClave(ASQL);
            DBHandler FConector = DBGlobal();
            FConector.Conectar("ORA_CONEAUIW");
            try
            {
                return FConector.EjecutarSQLClave(ASQL);
            }
            finally
            {
                FConector.Desconectar();
            }
        }

        public bool EsAuditable(string AEspacio, string AEntidad)
        {
            if (_usarWS != 0)
                return _wsDB.EsAuditable(AEspacio, AEntidad);
            DBHandler FConector = DBGlobal();
            FConector.Conectar("ORA_CONEAUIW");
            try
            {
                return (FConector.ConsultarSQL("SELECT COUNT(*) FROM DBA_TABLES WHERE OWNER = 'SIS_" + AEspacio + 
                    "' AND TABLE_NAME = 'AUD_" + AEntidad + "'").Tables[0].Rows[0].ItemArray[0].ToString() == "1");
            }
            finally
            {
                FConector.Desconectar();
            }
        }

        #endregion


        #region Propiedades
        public CONEAUwsDB.wsDB wsDB { get { return _wsDB; } set { _wsDB = value; } }
        #endregion


        #region Objetos

        public List<string> ObtenerClases(string NameSpace)
        {
            Assembly asm = Assembly.GetExecutingAssembly();
            List<string> namespacelist = new List<string>();
            List<string> classlist = new List<string>();
            foreach (Type type in asm.GetTypes())
                if (type.Namespace == NameSpace)
                    namespacelist.Add(type.Name);
            foreach (string classname in namespacelist)
                classlist.Add(classname);
            return classlist;
        }

        public Type ObtenerClase(string Espacio, string Entidad)
        {
            Assembly asm = Assembly.GetExecutingAssembly();
            List<string> namespacelist = new List<string>();
            List<string> classlist = new List<string>();
            foreach (Type type in asm.GetTypes())
                if ((type.GetField("Espacio") != null) &&
                    (type.GetField("Espacio").GetValue(null).ToString() == Espacio) &&
                    (type.GetField("Entidad").GetValue(null).ToString() == Entidad))
                    return type;
            return null;
        }

        public string ObtenerObjeto(sgwMulticapa.Objetos.Base.ObjetoBase AObjeto, int AID)
        {
            DataSet FResult;
            string FSQLHead = "SELECT ";

            string FSQLBody = "";
            foreach (string FPropiedad in AObjeto.ObtenerPropiedades())
            {
                if (FSQLBody != "") FSQLBody += ", ";
                FSQLBody += FPropiedad;
            }
            string FSQLTail = " FROM SIS_" + AObjeto.GetType().GetField("Espacio").GetValue(null).ToString() + "." +
                AObjeto.GetType().GetField("Entidad").GetValue(null).ToString() + 
                " WHERE ID_" + AObjeto.GetType().GetField("Entidad").GetValue(null).ToString() + " = " + AID;
            string sql = FSQLHead + FSQLBody + FSQLTail;
            FResult = LeerSQL(FSQLHead + FSQLBody + FSQLTail);
            if (FResult == null)
                return "201";
            if (FResult.Tables[0].Rows.Count == 0)
                return "3";
            AObjeto.LeerValores(FResult.Tables[0].Rows[0]);
            return "0";
        }

        public string ObtenerObjeto(sgwMulticapa.Objetos.Base.ObjetoBase AObjeto, int AID, bool AGuardarROWSCN)
        {
            string FResultado = ObtenerObjeto(AObjeto, AID);
            if ((FResultado == "0") && (AGuardarROWSCN))
            {
                DataSet FData = LeerSQL("SELECT ORA_ROWSCN FROM SIS_" + 
                    AObjeto.GetType().GetField("Espacio").GetValue(null).ToString() + "." +
                    AObjeto.GetType().GetField("Entidad").GetValue(null).ToString() + 
                    " WHERE ID_" + AObjeto.GetType().GetField("Entidad").GetValue(null).ToString() + " = " + AObjeto.ID);
                HttpContext.Current.Session["ROWSCN_" + AObjeto.GetType().GetField("Entidad").
                    GetValue(null).ToString()] = FData.Tables[0].Rows[0].ItemArray[0].ToString();
            }
            return FResultado;
        }

        public string ObtenerObjeto(sgwMulticapa.Objetos.Base.ObjetoBase AObjeto, ASPxGridView AGrilla)
        {
            return ObtenerObjeto(AObjeto, int.Parse(AGrilla.GetRowValues(AGrilla.FocusedRowIndex, 
                "ID_" + AObjeto.GetType().GetField("Entidad").GetValue(null).ToString()).ToString()));
        }

        public string ObtenerObjeto(sgwMulticapa.Objetos.Base.ObjetoBase AObjeto, ASPxGridView AGrilla, bool AGuardarROWSCN)
        {
            string FResultado = ObtenerObjeto(AObjeto, AGrilla);
            if ((FResultado == "0") && (AGuardarROWSCN))
            {
                DataSet FData = LeerSQL("SELECT ORA_ROWSCN FROM SIS_" +
                    AObjeto.GetType().GetField("Espacio").GetValue(null).ToString() + "." +
                    AObjeto.GetType().GetField("Entidad").GetValue(null).ToString() +
                    " WHERE ID_" + AObjeto.GetType().GetField("Entidad").GetValue(null).ToString() + " = " + AObjeto.ID);
                HttpContext.Current.Session["ROWSCN_" + AObjeto.GetType().GetField("Entidad").
                    GetValue(null).ToString()] = FData.Tables[0].Rows[0].ItemArray[0].ToString();
            }
            return FResultado;
        }

        public sgwMulticapa.Objetos.Base.ObjetoBase ObtenerObjeto(Type AClase, string ACondicion)
        {
            string FSQLHead = "SELECT ";
            string FSQLBody = "*";
            string FOrigen = "";
            string FSQLTail = " FROM SIS_" + AClase.GetField("Espacio").GetValue(null).ToString() +
                "." + AClase.GetField("Entidad").GetValue(null).ToString() + FOrigen;
            if (ACondicion != "")
                FSQLTail += " T WHERE " + ACondicion;
            DataSet FData = LeerSQL(FSQLHead + FSQLBody + FSQLTail);
            if ((FData == null) || (FData.Tables[0].Rows.Count == 0))
                return null;
            sgwMulticapa.Objetos.Base.ObjetoBase FObjeto = (sgwMulticapa.Objetos.Base.ObjetoBase)Activator.CreateInstance(AClase);
            FObjeto.LeerValores(FData.Tables[0].Rows[0]);
            HttpContext.Current.Session.Remove("ROWSCN_" + AClase.GetField("Entidad").GetValue(null).ToString());
            return FObjeto;
        }

        public sgwMulticapa.Objetos.Base.ObjetoBase ObtenerObjeto(string Espacio, string Entidad, int AID)
        {
            Type Clase = ObtenerClase(Espacio, Entidad);
            return ObtenerObjeto(Clase, "ID_" + Entidad + " = " + AID.ToString());
        }

        public sgwMulticapa.Objetos.Base.ObjetoBase ObtenerObjeto(Type AClase, string ACondicion, bool AGuardarROWSCN)
        {
            sgwMulticapa.Objetos.Base.ObjetoBase FResultado = ObtenerObjeto(AClase, ACondicion);
            if ((FResultado != null) && (AGuardarROWSCN))
            {
                DataSet FData = LeerSQL("SELECT ORA_ROWSCN FROM SIS_" +
                    AClase.GetField("Espacio").GetValue(null).ToString() + "." +
                    AClase.GetField("Entidad").GetValue(null).ToString() +
                    " WHERE ID_" + AClase.GetField("Entidad").GetValue(null).ToString() + " = " + FResultado.ID);
                HttpContext.Current.Session["ROWSCN_" + AClase.GetField("Entidad").
                    GetValue(null).ToString()] = FData.Tables[0].Rows[0].ItemArray[0].ToString();
            }
            return FResultado;
        }

        public ArrayList ObtenerObjetos(Type AClase)
        {
            string FSQLHead = "SELECT ";
            string FSQLBody = "*";
            string FOrigen = "";
            string FSQLTail = " FROM SIS_" + AClase.GetField("Espacio").GetValue(null).ToString() +
                "." + AClase.GetField("Entidad").GetValue(null).ToString() + FOrigen;
            DataSet FData = LeerSQL(FSQLHead + FSQLBody + FSQLTail);
            if (FData == null)
                return null;
            if (FData.Tables[0].Rows.Count == 0)
                return null;

            ArrayList FObjetos = new ArrayList();
            foreach (DataRow FRow in FData.Tables[0].Rows)
            {
                sgwMulticapa.Objetos.Base.ObjetoBase FObjeto = (sgwMulticapa.Objetos.Base.ObjetoBase)Activator.CreateInstance(AClase);
                FObjeto.LeerValores(FRow);
                FObjetos.Add(FObjeto);
            }
            return FObjetos;
        }

        public ArrayList ObtenerObjetos(Type AClase, string ACondicion)
        {
            string FSQLHead = "SELECT ";
            string FSQLBody = "*";
            string FOrigen = "";
            string FSQLTail = " FROM SIS_" + AClase.GetField("Espacio").GetValue(null).ToString() +
                "." + AClase.GetField("Entidad").GetValue(null).ToString() + FOrigen + " T WHERE " + ACondicion;
            DataSet FData = LeerSQL(FSQLHead + FSQLBody + FSQLTail);
            if (FData == null)
                return null;
            if (FData.Tables[0].Rows.Count == 0)
                return null;

            ArrayList FObjetos = new ArrayList();
            foreach (DataRow FRow in FData.Tables[0].Rows)
            {
                sgwMulticapa.Objetos.Base.ObjetoBase FObjeto = 
                    (sgwMulticapa.Objetos.Base.ObjetoBase)Activator.CreateInstance(AClase);
                FObjeto.LeerValores(FRow);
                FObjetos.Add(FObjeto);
            }
            return FObjetos;
        }

        public ArrayList ObtenerObjetos(string Espacio, string Entidad, string ACondicion)
        {
            Type Clase = ObtenerClase(Espacio, Entidad);
            return ObtenerObjetos(Clase, ACondicion);
        }


        public bool EliminarObjeto(sgwMulticapa.Objetos.Base.ObjetoBase AObjeto)
        {
            if (AObjeto.ID == 0) return false;

            string FSQLHead = "";
            string FSQLTail = "";
            string FEspacio = AObjeto.GetType().GetField("Espacio").GetValue(null).ToString();
            string FEntidad = AObjeto.GetType().GetField("Entidad").GetValue(null).ToString();

            FSQLHead += "BEGIN ";
            string FOrigen = "";
            FSQLHead += "SIS_" + FEspacio + ".PKG_" + FEspacio + FOrigen;
            FSQLHead += ".B_" + FEntidad + " (";

            foreach (string FPropiedad in AObjeto.ObtenerPropiedades())
            {
                if (FPropiedad != "ID_" + FEntidad) continue;
                FSQLTail += "P_" + FPropiedad + " => " + AObjeto.ObtenerValorSQL(FPropiedad);
            }

            FSQLTail += "); END;";

            try
            {
                EscribirSQL(FSQLHead + FSQLTail);
            }
            catch (Exception E)
            {
                if ((E.Message.Contains("ORA-02292")) || (E.Message.Contains("ORA-12899")))
                    sgwNucleo.Pagina.MostrarEstado("No se puede eliminar debido a que los datos son referenciados: " + E.Message, 3);
                else
                    if (E.Message.Contains("ORA-02290"))
                        sgwNucleo.Pagina.MostrarEstado("Un valor no se puede agregar porque una condición de control lo impide: " + E.Message, 3);
                    else
                        if (E.Message.Contains("ORA-00001"))
                            sgwNucleo.Pagina.MostrarEstado("Un valor que está ingresando ya existe y no puede duplicarse: " + E.Message, 3);
                        else
                            throw E;
                return false;
            }
            AuditarOperacion(FEspacio, FEntidad, AObjeto.ID, 3);
            return true;
        }

        public bool EliminarObjeto(Type AClase, int AID)
        {
            if (AID == 0) return false;

            string FSQLHead = "";
            string FSQLTail = "";
            string FEspacio = AClase.GetField("Espacio").GetValue(null).ToString();
            string FEntidad = AClase.GetField("Entidad").GetValue(null).ToString();

            FSQLHead += "BEGIN ";
            string FOrigen = "";
            FSQLHead += "SIS_" + FEspacio + ".PKG_" + FEspacio + FOrigen;
            FSQLHead += ".B_" + FEntidad + " (";

            FSQLTail += "P_ID_" + FEntidad + " => " + AID.ToString();
            FSQLTail += "); END;";

            try
            {
                EscribirSQL(FSQLHead + FSQLTail);
            }
            catch (Exception E)
            {
                if ((E.Message.Contains("ORA-02292")) || (E.Message.Contains("ORA-12899")))
                    sgwNucleo.Pagina.MostrarEstado("No se puede eliminar debido a que los datos son referenciados: " + E.Message, 3);
                else
                    if (E.Message.Contains("ORA-02290"))
                        sgwNucleo.Pagina.MostrarEstado("Un valor no se puede agregar porque una condición de control lo impide: " + E.Message, 3);
                    else
                        if (E.Message.Contains("ORA-00001"))
                            sgwNucleo.Pagina.MostrarEstado("Un valor que está ingresando ya existe y no puede duplicarse: " + E.Message, 3);
                        else
                            throw E;
                return false;
            }

            AuditarOperacion(FEspacio, FEntidad, AID, 3);
            return true;
        }

        public bool GuardarObjetoNoAuditar(sgwMulticapa.Objetos.Base.ObjetoBase AObjeto)
        {
            string FSQLHead = "";
            string FSQLTail = "";
            string FEspacio = AObjeto.GetType().GetField("Espacio").GetValue(null).ToString();
            string FEntidad = AObjeto.GetType().GetField("Entidad").GetValue(null).ToString();
            DataSet FData = null;
            FSQLHead += "BEGIN ";
            FSQLHead += "? := ";
            string FOrigen = "";
            FSQLHead += "SIS_" + FEspacio + ".PKG_" + FEspacio + FOrigen;
            FSQLHead += ".A_" + FEntidad + " (";
            foreach (string FPropiedad in AObjeto.ObtenerPropiedades())
            {
                if ((AObjeto.ID == 0) && (FPropiedad == "ID_" + FEntidad)) continue;
                if (FSQLTail != "") FSQLTail += ", ";
                FSQLTail += "P_" + FPropiedad + " => " + AObjeto.ObtenerValorSQL(FPropiedad);
            }
            FSQLTail += "); END;";
            int FID = EscribirSQLClave(FSQLHead + FSQLTail);
            AObjeto.ID = FID;
            return true;
        }

        public bool GuardarObjeto(sgwMulticapa.Objetos.Base.ObjetoBase AObjeto)
        {
            string FSQLHead = "";
            string FSQLTail = "";
            string FEspacio = AObjeto.GetType().GetField("Espacio").GetValue(null).ToString();
            string FEntidad = AObjeto.GetType().GetField("Entidad").GetValue(null).ToString();
            string FROWSCN = "";
            DataSet FData = null;
            if (HttpContext.Current.Session["ROWSCN_" + FEntidad] != null)
                FROWSCN = HttpContext.Current.Session["ROWSCN_" + FEntidad].ToString();
            if ((AObjeto.ID != 0) && (FROWSCN != ""))
            {
                FData = LeerSQL("SELECT ORA_ROWSCN FROM SIS_" + FEspacio + "." + FEntidad + " WHERE ID_" + FEntidad + " = " + AObjeto.ID);
                if (FROWSCN != FData.Tables[0].Rows[0].ItemArray[0].ToString())
                {
                    sgwNucleo.Pagina.MostrarEstado("Un usuario ha modificado esta información. Deberá actualizar la página para poder guardar los cambios.", 3);
                    return false;
                }
            }

            FSQLHead += "BEGIN ";

            if (AObjeto.ID == 0)
                FSQLHead += "? := ";

            string FOrigen = "";
            FSQLHead += "SIS_" + FEspacio + ".PKG_" + FEspacio + FOrigen;

            int FOperacion;
            if (AObjeto.ID == 0)
            {
                FOperacion = 1;
                FSQLHead += ".A_" + FEntidad + " (";
            }
            else
            {
                FOperacion = 2;
                FSQLHead += ".M_" + FEntidad + " (";
            }

            foreach (string FPropiedad in AObjeto.ObtenerPropiedades())
            {
                if ((AObjeto.ID == 0) && (FPropiedad == "ID_" + FEntidad)) continue;
                if (FSQLTail != "") FSQLTail += ", ";
                FSQLTail += "P_" + FPropiedad + " => " + AObjeto.ObtenerValorSQL(FPropiedad);
            }

            FSQLTail += "); END;";

            string a = FSQLHead + FSQLTail;

            try
            {
                int FID = EscribirSQLClave(FSQLHead + FSQLTail);
                if (AObjeto.ID == 0)
                    AObjeto.ID = FID;
            }
            catch (Exception E)
            {
                if ((E.Message.Contains("ORA-01461")) || (E.Message.Contains("ORA-12899")))
                    sgwNucleo.Pagina.MostrarEstado("Un valor es demasiado largo. Verifique la cantidad de caracteres ingresados.", 3);
                else
                    if (E.Message.Contains("ORA-02290"))
                        sgwNucleo.Pagina.MostrarEstado("Un valor no se puede agregar porque una condición de control lo impide: " + E.Message, 3);
                    else
                        if (E.Message.Contains("ORA-00001"))
                            sgwNucleo.Pagina.MostrarEstado("Un valor que está ingresando ya existe y no puede duplicarse: " + E.Message, 3);
                        else
                            throw E;
                return false;
            }
            HttpContext.Current.Session.Remove("ROWSCN_" + FEntidad);
            if (FOperacion == 1)
                GuardarAlta(FEspacio, FEntidad, AObjeto.ID);
            AuditarOperacion(FEspacio, FEntidad, AObjeto.ID, FOperacion);
            return true;
        }

        public bool GuardarObjeto(sgwMulticapa.Objetos.Base.ObjetoBase AObjeto, bool AGuardarClaveEnSesion)
        {
            bool FResult = GuardarObjeto(AObjeto);
            if ((FResult) && (AGuardarClaveEnSesion))
                HttpContext.Current.Session["ID_" + AObjeto.GetType().GetField("Entidad").
                    GetValue(null).ToString()] = AObjeto.ID;
            return FResult;
        }

        public sgwMulticapa.Objetos.Base.ObjetoBase CopiarObjeto(sgwMulticapa.Objetos.Base.ObjetoBase AObjeto)
        {
            sgwMulticapa.Objetos.Base.ObjetoBase FObjeto = (sgwMulticapa.Objetos.Base.ObjetoBase)Activator.CreateInstance(AObjeto.GetType());
            PropertyInfo[] FPropiedades = FObjeto.GetType().GetProperties();
            foreach (PropertyInfo FPropiedad in FPropiedades)
                if ((FPropiedad.CanRead) && (FPropiedad.CanWrite))
                {
                    PropertyInfo FPropiedadO = AObjeto.GetType().GetProperty(FPropiedad.Name);
                    if ((FPropiedadO != null) && (FPropiedadO.GetValue(AObjeto, null) != null))
                        FPropiedad.SetValue(FObjeto, FPropiedadO.GetValue(AObjeto, null), null);
                }
            FObjeto.ID = 0;
            return FObjeto;
        }

        public void GuardarAlta(string AEspacio, string AEntidad, int AID)
        {
            DataSet FData = LeerSQL("SELECT COUNT(*) AS CANTIDAD FROM SYS.ALL_TAB_COLUMNS WHERE OWNER = 'SIS_" + AEspacio + 
                "' AND TABLE_NAME = '" + AEntidad + "' AND COLUMN_NAME = 'FECHA_ALTA'");
            if (FData.Tables[0].Rows[0]["CANTIDAD"].ToString() != "1") return;
            EscribirSQL("UPDATE SIS_" + AEspacio + "." + AEntidad + " SET FECHA_ALTA = SYSDATE WHERE " +
                "ID_" + AEntidad + " = " + AID.ToString());
        }

        public void AuditarOperacion(string AEspacio, string AEntidad, int AID, int AOperacion)
        {
            if (!EsAuditable(AEspacio, AEntidad)) return;
            if (HttpContext.Current.Session["UsuarioID"] == null) return;
            string FOperacion = "";
            if (AOperacion == 1) FOperacion = "'Alta'";
            if (AOperacion == 2) FOperacion = "'Modificación'";
            if (AOperacion == 3) FOperacion = "'Baja'";
            string FSQLHead = "INSERT INTO SIS_" + AEspacio + ".AUD_" + AEntidad;
            if (AEntidad.ToLower() == "usuarios")
                FSQLHead = FSQLHead + " (ID_USUARIOS_AUD, ID_" + AEntidad + ", OPERACION, FECHA, HOST_IP, HOST_NOMBRE, URL) ";
            else
                FSQLHead = FSQLHead + " (ID_USUARIOS, ID_" + AEntidad + ", OPERACION, FECHA, HOST_IP, HOST_NOMBRE, URL) ";
            string FSQLTail = "VALUES (" + HttpContext.Current.Session["UsuarioID"].ToString() + ", " + AID + ", " + FOperacion + ", " + " SYSDATE, '" + 
                HttpContext.Current.Request.UserHostAddress.ToString() + "', '" +
                HttpContext.Current.Request.UserHostName.ToString() + "', '" + 
                HttpContext.Current.Request.Url.ToString() + "')";
            EscribirSQL(FSQLHead + FSQLTail);
        }

        #endregion

    }
}