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
/// sgwMulticapa.Objetos.CONEAU.Instructivos
/// 
/// Objetos del motor multicapa para
/// SIS_INSTRUCTIVOS (común a todos los niveles educativos)
/// </summary>

namespace sgwMulticapa.Objetos.CONEAU.Instructivos
{

    #region CuerpoAcademico

    public class CargoDocente : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "CARGOS_DOCENTES";
        public static string Espacio = "INSTRUCTIVOS";
        private string _DED_DESCRIPCION;
        private int _DED_DOCENCIA;
        private int _DED_EXTENSION;
        private int _DED_VINCULACION;
        private int _DED_INVESTIGACION;
        private int _DED_OTRAS;
        private int _DED_TESIS;
        private int _DED_TUTORIAS;
        private DateTime _FECHA_DESIGNACION;
        private DateTime _FECHA_FINALIZACION;
        private int _ID_PRESENTACIONES_UA;
        private int _ID_TIPOS_ESTADOS_CARGOS;
        private int _ID_DOCENTES;
        private int _ID_TIPOS_CARGOS;
        private int _ID_TIPOS_DESIGNACIONES;
        private bool _PLANTEL_DOCENTE;
        private int _ID_TIPOS_DUR_DED_1;
        private int _ID_TIPOS_DUR_DED_2;
        private int _ID_TIPOS_DUR_DED_3;
        private int _ID_TIPOS_DUR_DED_4;
        private int _ID_TIPOS_DUR_DED_5;
        private int _ID_TIPOS_DUR_DED_6;
        private int _ID_TIPOS_DUR_DED_7;
        private bool _VINCULO_ESTABLE;
        private DateTime _FECHA_REVISION_DOC;
        private string _OBSERVACIONES;
        private bool _DESCRIPCION_DED;
        private bool _DIRECTOR;
        private int _ID_PRESENTACIONES_CARRERAS;
        private bool _MIEMBRO_COMITE;
        private bool _RESIDENCIA_CARRERA;
        private bool _CODIRECTOR;
        private bool _COORDINADOR;
        private bool _ELIMINADO;
        private string _FUNCIONES;

        #region Propiedades

        public string OBSERVACIONES { get { return _OBSERVACIONES; } set { _OBSERVACIONES = value; } }
        public string DED_DESCRIPCION { get { return _DED_DESCRIPCION; } set { _DED_DESCRIPCION = value; } }
        public int DED_DOCENCIA { get { return _DED_DOCENCIA; } set { _DED_DOCENCIA = value; } }
        public int DED_EXTENSION { get { return _DED_EXTENSION; } set { _DED_EXTENSION = value; } }
        public int DED_INVESTIGACION { get { return _DED_INVESTIGACION; } set { _DED_INVESTIGACION = value; } }
        public int DED_OTRAS { get { return _DED_OTRAS; } set { _DED_OTRAS = value; } }
        public int DED_TESIS { get { return _DED_TESIS; } set { _DED_TESIS = value; } }
        public int DED_TUTORIAS { get { return _DED_TUTORIAS; } set { _DED_TUTORIAS = value; } }
        public int DED_VINCULACION { get { return _DED_VINCULACION; } set { _DED_VINCULACION = value; } }
        public DateTime FECHA_DESIGNACION { get { return _FECHA_DESIGNACION; } set { _FECHA_DESIGNACION = value; } }
        public DateTime FECHA_FINALIZACION { get { return _FECHA_FINALIZACION; } set { _FECHA_FINALIZACION = value; } }
        public DateTime FECHA_REVISION_DOC { get { return _FECHA_REVISION_DOC; } set { _FECHA_REVISION_DOC = value; } }
        public int ID_PRESENTACIONES_UA { get { return _ID_PRESENTACIONES_UA; } set { _ID_PRESENTACIONES_UA = value; } }
        public int ID_TIPOS_ESTADOS_CARGOS { get { return _ID_TIPOS_ESTADOS_CARGOS; } set { _ID_TIPOS_ESTADOS_CARGOS = value; } }
        public int ID_DOCENTES { get { return _ID_DOCENTES; } set { _ID_DOCENTES = value; } }
        public int ID_TIPOS_CARGOS { get { return _ID_TIPOS_CARGOS; } set { _ID_TIPOS_CARGOS = value; } }
        public int ID_TIPOS_DESIGNACIONES { get { return _ID_TIPOS_DESIGNACIONES; } set { _ID_TIPOS_DESIGNACIONES = value; } }
        public bool PLANTEL_DOCENTE { get { return _PLANTEL_DOCENTE; } set { _PLANTEL_DOCENTE = value; } }
        public int ID_TIPOS_DUR_DED_1 { get { return _ID_TIPOS_DUR_DED_1; } set { _ID_TIPOS_DUR_DED_1 = value; } }
        public int ID_TIPOS_DUR_DED_2 { get { return _ID_TIPOS_DUR_DED_2; } set { _ID_TIPOS_DUR_DED_2 = value; } }
        public int ID_TIPOS_DUR_DED_3 { get { return _ID_TIPOS_DUR_DED_3; } set { _ID_TIPOS_DUR_DED_3 = value; } }
        public int ID_TIPOS_DUR_DED_4 { get { return _ID_TIPOS_DUR_DED_4; } set { _ID_TIPOS_DUR_DED_4 = value; } }
        public int ID_TIPOS_DUR_DED_5 { get { return _ID_TIPOS_DUR_DED_5; } set { _ID_TIPOS_DUR_DED_5 = value; } }
        public int ID_TIPOS_DUR_DED_6 { get { return _ID_TIPOS_DUR_DED_6; } set { _ID_TIPOS_DUR_DED_6 = value; } }
        public int ID_TIPOS_DUR_DED_7 { get { return _ID_TIPOS_DUR_DED_7; } set { _ID_TIPOS_DUR_DED_7 = value; } }
        public bool VINCULO_ESTABLE { get { return _VINCULO_ESTABLE; } set { _VINCULO_ESTABLE = value; } }
        public bool DESCRIPCION_DED { get { return _DESCRIPCION_DED; } set { _DESCRIPCION_DED = value; } }
        public bool DIRECTOR { get { return _DIRECTOR; } set { _DIRECTOR = value; } }
        public int ID_PRESENTACIONES_CARRERAS { get { return _ID_PRESENTACIONES_CARRERAS; } set { _ID_PRESENTACIONES_CARRERAS = value; } }
        public bool MIEMBRO_COMITE { get { return _MIEMBRO_COMITE; } set { _MIEMBRO_COMITE = value; } }
        public bool RESIDENCIA_CARRERA { get { return _RESIDENCIA_CARRERA; } set { _RESIDENCIA_CARRERA = value; } }
        public bool CODIRECTOR { get { return _CODIRECTOR; } set { _CODIRECTOR = value; } }
        public bool COORDINADOR { get { return _COORDINADOR; } set { _COORDINADOR = value; } }
        public bool ELIMINADO { get { return _ELIMINADO; } set { _ELIMINADO = value; } }
        public string FUNCIONES { get { return _FUNCIONES; } set { _FUNCIONES = value; } }

        #endregion
    }

    #endregion


}