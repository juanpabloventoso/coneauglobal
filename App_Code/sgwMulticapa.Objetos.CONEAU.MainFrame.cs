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
using System.Collections;
using sgwMulticapa.Objetos.Base;

/// <summary>
/// Summary description for sgwfCliente
/// </summary>

namespace sgwMulticapa.Objetos.CONEAU.MainFrame
{
    public class Usuario : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "USUARIOS";
        public static string Espacio = "MAINFRAME";
        private string _CORREO_ELECTRONICO;
        private string _PASSWORD;
        private string _USUARIO;
        private int _ID_EXPERTOS;
        private int _ID_PERSONAL;
        private bool _ACTIVO;
        private bool _HABILITADO;
        private string _DESCRIPCION;
        private string _CODIGO_ACTIVACION;
        private DateTime _FECHA_CREACION;
        private bool _CAMBIAR_PASSWORD;
        private string _PREGUNTA;
        private string _RESPUESTA;
        private string _APELLIDO;
        private string _PRIMER_NOMBRE;
        private string _SEGUNDO_NOMBRE;
        private string _SEXO;
        private int _ID_USUARIOS_CREADOR;
        #region Propiedades
        public string CORREO_ELECTRONICO { get { return _CORREO_ELECTRONICO; } set { _CORREO_ELECTRONICO = value; } }
        public string PASSWORD { get { return _PASSWORD; } set { _PASSWORD = value; } }
        public string USUARIO { get { return _USUARIO; } set { _USUARIO = value; } }
        public int ID_EXPERTOS { get { return _ID_EXPERTOS; } set { _ID_EXPERTOS = value; } }
        public int ID_PERSONAL { get { return _ID_PERSONAL; } set { _ID_PERSONAL = value; } }
        public bool ACTIVO { get { return _ACTIVO; } set { _ACTIVO = value; } }
        public bool HABILITADO { get { return _HABILITADO; } set { _HABILITADO = value; } }
        public string DESCRIPCION { get { return _DESCRIPCION; } set { _DESCRIPCION = value; } }
        public string CODIGO_ACTIVACION { get { return _CODIGO_ACTIVACION; } set { _CODIGO_ACTIVACION = value; } }
        public DateTime FECHA_CREACION { get { return _FECHA_CREACION; } set { _FECHA_CREACION = value; } }
        public bool CAMBIAR_PASSWORD { get { return _CAMBIAR_PASSWORD; } set { _CAMBIAR_PASSWORD = value; } }
        public string PREGUNTA { get { return _PREGUNTA; } set { _PREGUNTA = value; } }
        public string RESPUESTA { get { return _RESPUESTA; } set { _RESPUESTA = value; } }
        public string APELLIDO { get { return _APELLIDO; } set { _APELLIDO = value; } }
        public string PRIMER_NOMBRE { get { return _PRIMER_NOMBRE; } set { _PRIMER_NOMBRE = value; } }
        public string SEGUNDO_NOMBRE { get { return _SEGUNDO_NOMBRE; } set { _SEGUNDO_NOMBRE = value; } }
        public string SEXO { get { return _SEXO; } set { _SEXO = value; } }
        public int ID_USUARIOS_CREADOR { get { return _ID_USUARIOS_CREADOR; } set { _ID_USUARIOS_CREADOR = value; } }
        #endregion
    }

    public class TipoUsuario : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "TIPOS_USUARIOS";
        public static string Espacio = "MAINFRAME";
        private string _TIPO_USUARIO;
        public string TIPO_USUARIO { get { return _TIPO_USUARIO; } set { _TIPO_USUARIO = value; } }
    }

    public class Sistema : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "SISTEMAS";
        public static string Espacio = "MAINFRAME";
        private string _ESQUEMA;
        private string _CODENAME;
        private string _SISTEMA;
        private string _SUBSISTEMA;
        private string _DESCRIPCION;
        private string _RUTA_RELATIVA;
        private string _SERVIDOR;
        private int _ID_ESTADOS_SISTEMAS;
        private int _ID_USOS_SISTEMAS;
        private int _ID_TIPOS_SISTEMAS;
        private int _ID_CATEGORIAS_SISTEMAS;
        public string ESQUEMA { get { return _ESQUEMA; } set { _ESQUEMA = value; } }
        public string CODENAME { get { return _CODENAME; } set { _CODENAME = value; } }
        public string SISTEMA { get { return _SISTEMA; } set { _SISTEMA = value; } }
        public string SUBSISTEMA { get { return _SUBSISTEMA; } set { _SUBSISTEMA = value; } }
        public string DESCRIPCION { get { return _DESCRIPCION; } set { _DESCRIPCION = value; } }
        public string RUTA_RELATIVA { get { return _RUTA_RELATIVA; } set { _RUTA_RELATIVA = value; } }
        public string SERVIDOR { get { return _SERVIDOR; } set { _SERVIDOR = value; } }
        public int ID_ESTADOS_SISTEMAS { get { return _ID_ESTADOS_SISTEMAS; } set { _ID_ESTADOS_SISTEMAS = value; } }
        public int ID_USOS_SISTEMAS { get { return _ID_USOS_SISTEMAS; } set { _ID_USOS_SISTEMAS = value; } }
        public int ID_TIPOS_SISTEMAS { get { return _ID_TIPOS_SISTEMAS; } set { _ID_TIPOS_SISTEMAS = value; } }
        public int ID_CATEGORIAS_SISTEMAS { get { return _ID_CATEGORIAS_SISTEMAS; } set { _ID_CATEGORIAS_SISTEMAS = value; } }
    }

    public class Grupo : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "GRUPOS";
        public static string Espacio = "MAINFRAME";
        private string _GRUPO;
        private string _DESCRIPCION;
        private int _ID_TIPOS_USUARIOS;
        private int _ID_SISTEMAS;
        public string GRUPO { get { return _GRUPO; } set { _GRUPO = value; } }
        public string DESCRIPCION { get { return _DESCRIPCION; } set { _DESCRIPCION = value; } }
        public int ID_TIPOS_USUARIOS { get { return _ID_TIPOS_USUARIOS; } set { _ID_TIPOS_USUARIOS = value; } }
        public int ID_SISTEMAS { get { return _ID_SISTEMAS; } set { _ID_SISTEMAS = value; } }
    }

    public class GrupoUsuario : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "GRUPOS_USUARIOS";
        public static string Espacio = "MAINFRAME";
        private int _ID_USUARIOS;
        private int _ID_GRUPOS;
        public int ID_USUARIOS { get { return _ID_USUARIOS; } set { _ID_USUARIOS = value; } }
        public int ID_GRUPOS { get { return _ID_GRUPOS; } set { _ID_GRUPOS = value; } }
    }

    public class Sesion : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "SESIONES";
        public static string Espacio = "MAINFRAME";
        private int _ID_USUARIOS;
        private bool _CONECTADO;
        private DateTime _FECHA;
        private string _HOST_IP;
        private string _HOST_NOMBRE;
        private string _URL;
        #region Propiedades
        public int ID_USUARIOS { get { return _ID_USUARIOS; } set { _ID_USUARIOS = value; } }
        public bool CONECTADO { get { return _CONECTADO; } set { _CONECTADO = value; } }
        public DateTime FECHA { get { return _FECHA; } set { _FECHA = value; } }
        public string HOST_IP { get { return _HOST_IP; } set { _HOST_IP = value; } }
        public string HOST_NOMBRE { get { return _HOST_NOMBRE; } set { _HOST_NOMBRE = value; } }
        public string URL { get { return _URL; } set { _URL = value; } }
        #endregion
    }
}