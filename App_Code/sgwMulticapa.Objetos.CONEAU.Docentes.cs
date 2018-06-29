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
/// sgwMulticapa.Objetos.CONEAU.Docentes
/// 
/// Objetos del motor multicapa para
/// SIS_DOCENTES
/// </summary>

namespace sgwMulticapa.Objetos.CONEAU.Docentes
{

    public class Docente : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "DOCENTES";
        public static string Espacio = "DOCENTES";
        private string _APELLIDO;
        private string _CALLE;
        private bool _CARRERA_DOCENTE;
        private string _CUIT;
        private bool _CVAR;
        private string _CVAR_URL;
        private string _DEPARTAMENTO;
        private bool _DESEMPENIO_NO_ACADEMICO;
        private string _ESPECIALIDAD;
        private string _EXPERIENCIA_DISTANCIA;
        private string _FAX;
        private DateTime _FECHA_NACIMIENTO;
        private int _ID_TIPOS_INCENTIVOS_INV;
        private int _ID_TIPOS_CONICET_INV;
        private int _ID_DEPARTAMENTOS;
        private int _ID_ESTADOS;
        private int _ID_PAISES;
        private int _ID_PAISES_ORIGEN;
        private int _ID_PAISES_PASAPORTE;
        private int _ID_SUBDISCIPLINAS;
        private int _ID_TIPOS_DOCUMENTO;
        private int _ID_USUARIOS;
        private bool _INVESTIGADOR_CONICET;
        private bool _INVESTIGADOR_INCENTIVOS;
        private bool _INVESTIGADOR_OTRO;
        private float _LATITUD;
        private float _LONGITUD;
        private string _NUMERO;
        private string _NUMERO_DOCUMENTO;
        private string _OTRA_DISCIPLINA;
        private string _OTRA_INFORMACION;
        private string _OTRA_SUBDISCIPLINA;
        private string _PISO;
        private string _PRIMER_NOMBRE;
        private string _SEGUNDO_NOMBRE;
        private string _SEXO;
        private string _TELEFONO;
        private int _TESINAS_TP_ACTUALES;
        private int _TESINAS_TP_CONCLUIDAS;
        private int _TESIS_DOCTS_ACTUALES;
        private int _TESIS_DOCTS_CONCLUIDAS;
        private int _TESIS_MASTER_ACTUALES;
        private int _TESIS_MASTER_CONCLUIDAS;
        private string _LOCALIDAD;
        private string _CODIGO_POSTAL;
        #region Propiedades
        public string APELLIDO { get { return _APELLIDO; } set { _APELLIDO = value; } }
        public string CALLE { get { return _CALLE; } set { _CALLE = value; } }
        public bool CARRERA_DOCENTE { get { return _CARRERA_DOCENTE; } set { _CARRERA_DOCENTE = value; } }
        public string CUIT { get { return _CUIT; } set { _CUIT = value; } }
        public bool CVAR { get { return _CVAR; } set { _CVAR = value; } }
        public string CVAR_URL { get { return _CVAR_URL; } set { _CVAR_URL = value; } }
        public string DEPARTAMENTO { get { return _DEPARTAMENTO; } set { _DEPARTAMENTO = value; } }
        public bool DESEMPENIO_NO_ACADEMICO { get { return _DESEMPENIO_NO_ACADEMICO; } set { _DESEMPENIO_NO_ACADEMICO = value; } }
        public string ESPECIALIDAD { get { return _ESPECIALIDAD; } set { _ESPECIALIDAD = value; } }
        public string EXPERIENCIA_DISTANCIA { get { return _EXPERIENCIA_DISTANCIA; } set { _EXPERIENCIA_DISTANCIA = value; } }
        public string FAX { get { return _FAX; } set { _FAX = value; } }
        public DateTime FECHA_NACIMIENTO { get { return _FECHA_NACIMIENTO; } set { _FECHA_NACIMIENTO = value; } }
        public int ID_TIPOS_INCENTIVOS_INV { get { return _ID_TIPOS_INCENTIVOS_INV; } set { _ID_TIPOS_INCENTIVOS_INV = value; } }
        public int ID_TIPOS_CONICET_INV { get { return _ID_TIPOS_CONICET_INV; } set { _ID_TIPOS_CONICET_INV = value; } }
        public int ID_DEPARTAMENTOS { get { return _ID_DEPARTAMENTOS; } set { _ID_DEPARTAMENTOS = value; } }
        public int ID_ESTADOS { get { return _ID_ESTADOS; } set { _ID_ESTADOS = value; } }
        public int ID_PAISES { get { return _ID_PAISES; } set { _ID_PAISES = value; } }
        public int ID_PAISES_ORIGEN { get { return _ID_PAISES_ORIGEN; } set { _ID_PAISES_ORIGEN = value; } }
        public int ID_PAISES_PASAPORTE { get { return _ID_PAISES_PASAPORTE; } set { _ID_PAISES_PASAPORTE = value; } }
        public int ID_SUBDISCIPLINAS { get { return _ID_SUBDISCIPLINAS; } set { _ID_SUBDISCIPLINAS = value; } }
        public int ID_TIPOS_DOCUMENTO { get { return _ID_TIPOS_DOCUMENTO; } set { _ID_TIPOS_DOCUMENTO = value; } }
        public int ID_USUARIOS { get { return _ID_USUARIOS; } set { _ID_USUARIOS = value; } }
        public bool INVESTIGADOR_CONICET { get { return _INVESTIGADOR_CONICET; } set { _INVESTIGADOR_CONICET = value; } }
        public bool INVESTIGADOR_INCENTIVOS { get { return _INVESTIGADOR_INCENTIVOS; } set { _INVESTIGADOR_INCENTIVOS = value; } }
        public bool INVESTIGADOR_OTRO { get { return _INVESTIGADOR_OTRO; } set { _INVESTIGADOR_OTRO = value; } }
        public float LATITUD { get { return _LATITUD; } set { _LATITUD = value; } }
        public float LONGITUD { get { return _LONGITUD; } set { _LONGITUD = value; } }
        public string NUMERO { get { return _NUMERO; } set { _NUMERO = value; } }
        public string NUMERO_DOCUMENTO { get { return _NUMERO_DOCUMENTO; } set { _NUMERO_DOCUMENTO = value; } }
        public string OTRA_DISCIPLINA { get { return _OTRA_DISCIPLINA; } set { _OTRA_DISCIPLINA = value; } }
        public string OTRA_INFORMACION { get { return _OTRA_INFORMACION; } set { _OTRA_INFORMACION = value; } }
        public string OTRA_SUBDISCIPLINA { get { return _OTRA_SUBDISCIPLINA; } set { _OTRA_SUBDISCIPLINA = value; } }
        public string PISO { get { return _PISO; } set { _PISO = value; } }
        public string PRIMER_NOMBRE { get { return _PRIMER_NOMBRE; } set { _PRIMER_NOMBRE = value; } }
        public string SEGUNDO_NOMBRE { get { return _SEGUNDO_NOMBRE; } set { _SEGUNDO_NOMBRE = value; } }
        public string SEXO { get { return _SEXO; } set { _SEXO = value; } }
        public string TELEFONO { get { return _TELEFONO; } set { _TELEFONO = value; } }
        public int TESINAS_TP_ACTUALES { get { return _TESINAS_TP_ACTUALES; } set { _TESINAS_TP_ACTUALES = value; } }
        public int TESINAS_TP_CONCLUIDAS { get { return _TESINAS_TP_CONCLUIDAS; } set { _TESINAS_TP_CONCLUIDAS = value; } }
        public int TESIS_DOCTS_ACTUALES { get { return _TESIS_DOCTS_ACTUALES; } set { _TESIS_DOCTS_ACTUALES = value; } }
        public int TESIS_DOCTS_CONCLUIDAS { get { return _TESIS_DOCTS_CONCLUIDAS; } set { _TESIS_DOCTS_CONCLUIDAS = value; } }
        public int TESIS_MASTER_ACTUALES { get { return _TESIS_MASTER_ACTUALES; } set { _TESIS_MASTER_ACTUALES = value; } }
        public int TESIS_MASTER_CONCLUIDAS { get { return _TESIS_MASTER_CONCLUIDAS; } set { _TESIS_MASTER_CONCLUIDAS = value; } }
        public string LOCALIDAD { get { return _LOCALIDAD; } set { _LOCALIDAD = value; } }
        public string CODIGO_POSTAL { get { return _CODIGO_POSTAL; } set { _CODIGO_POSTAL = value; } }
        #endregion
    }

    public class OtraCategoriaInv : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "OTRAS_CATEGORIAS_INV";
        public static string Espacio = "DOCENTES";
        private string _CATEGORIA;
        private DateTime _FECHA_FINALIZACION;
        private DateTime _FECHA_INICIO;
        private int _ID_DOCENTES;
        private int _ID_INSTITUCIONES;
        private bool _INSTITUCION_UNIV;
        private string _OTRA_INSTITUCION;
        #region Propiedades
        public string CATEGORIA { get { return _CATEGORIA; } set { _CATEGORIA = value; } }
        public DateTime FECHA_FINALIZACION { get { return _FECHA_FINALIZACION; } set { _FECHA_FINALIZACION = value; } }
        public DateTime FECHA_INICIO { get { return _FECHA_INICIO; } set { _FECHA_INICIO = value; } }
        public int ID_DOCENTES { get { return _ID_DOCENTES; } set { _ID_DOCENTES = value; } }
        public int ID_INSTITUCIONES { get { return _ID_INSTITUCIONES; } set { _ID_INSTITUCIONES = value; } }
        public bool INSTITUCION_UNIV { get { return _INSTITUCION_UNIV; } set { _INSTITUCION_UNIV = value; } }
        public string OTRA_INSTITUCION { get { return _OTRA_INSTITUCION; } set { _OTRA_INSTITUCION = value; } }
        #endregion
    }

    public class CargoNoDocente : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "CARGOS_NO_DOCENTES";
        public static string Espacio = "DOCENTES";
        private int _CANTIDAD_SEMANAS;
        private string _CARGO;
        private int _DEDICACION_SEMANAL;
        private DateTime _FECHA_FINALIZACION;
        private DateTime _FECHA_INICIO;
        private string _FUNCIONES;
        private int _ID_DOCENTES;
        private int _ID_INSTITUCIONES;
        private int _ID_SUBDISCIPLINAS;
        private int _ID_TIPOS_DURACIONES_DED;
        private bool _INSTITUCION_UNIV;
        private string _OTRA_INSTITUCION;
        private string _OTRA_DISCIPLINA;
        private string _OTRA_SUBDISCIPLINA;

        #region Propiedades
        public int CANTIDAD_SEMANAS { get { return _CANTIDAD_SEMANAS; } set { _CANTIDAD_SEMANAS = value; } }
        public string CARGO { get { return _CARGO; } set { _CARGO = value; } }
        public int DEDICACION_SEMANAL { get { return _DEDICACION_SEMANAL; } set { _DEDICACION_SEMANAL = value; } }
        public DateTime FECHA_FINALIZACION { get { return _FECHA_FINALIZACION; } set { _FECHA_FINALIZACION = value; } }
        public DateTime FECHA_INICIO { get { return _FECHA_INICIO; } set { _FECHA_INICIO = value; } }
        public string FUNCIONES { get { return _FUNCIONES; } set { _FUNCIONES = value; } }
        public int ID_DOCENTES { get { return _ID_DOCENTES; } set { _ID_DOCENTES = value; } }
        public int ID_INSTITUCIONES { get { return _ID_INSTITUCIONES; } set { _ID_INSTITUCIONES = value; } }
        public int ID_SUBDISCIPLINAS { get { return _ID_SUBDISCIPLINAS; } set { _ID_SUBDISCIPLINAS = value; } }
        public int ID_TIPOS_DURACIONES_DED { get { return _ID_TIPOS_DURACIONES_DED; } set { _ID_TIPOS_DURACIONES_DED = value; } }
        public bool INSTITUCION_UNIV { get { return _INSTITUCION_UNIV; } set { _INSTITUCION_UNIV = value; } }
        public string OTRA_INSTITUCION { get { return _OTRA_INSTITUCION; } set { _OTRA_INSTITUCION = value; } }
        public string OTRA_DISCIPLINA { get { return _OTRA_DISCIPLINA; } set { _OTRA_DISCIPLINA = value; } }
        public string OTRA_SUBDISCIPLINA { get { return _OTRA_SUBDISCIPLINA; } set { _OTRA_SUBDISCIPLINA = value; } }
        #endregion
    }

    public class Publicacion : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "PUBLICACIONES";
        public static string Espacio = "DOCENTES";
        private int _ANIO;
        private string _AUTORES;
        private string _CONTENEDOR;
        private string _EDITORES;
        private string _EDITORIAL;
        private int _ID_DOCENTES;
        private int _ID_TIPOS_PUBLICACIONES;
        private string _LUGAR_IMPRESION;
        private string _LUGAR_REALIZACION;
        private string _PAGINAS;
        private string _PALABRAS_CLAVE;
        private string _PUBLICACION;
        private string _URL;
        private string _VOLUMEN;
        #region Propiedades
        public int ANIO { get { return _ANIO; } set { _ANIO = value; } }
        public string AUTORES { get { return _AUTORES; } set { _AUTORES = value; } }
        public string CONTENEDOR { get { return _CONTENEDOR; } set { _CONTENEDOR = value; } }
        public string EDITORES { get { return _EDITORES; } set { _EDITORES = value; } }
        public string EDITORIAL { get { return _EDITORIAL; } set { _EDITORIAL = value; } }
        public int ID_DOCENTES { get { return _ID_DOCENTES; } set { _ID_DOCENTES = value; } }
        public int ID_TIPOS_PUBLICACIONES { get { return _ID_TIPOS_PUBLICACIONES; } set { _ID_TIPOS_PUBLICACIONES = value; } }
        public string LUGAR_IMPRESION { get { return _LUGAR_IMPRESION; } set { _LUGAR_IMPRESION = value; } }
        public string LUGAR_REALIZACION { get { return _LUGAR_REALIZACION; } set { _LUGAR_REALIZACION = value; } }
        public string PAGINAS { get { return _PAGINAS; } set { _PAGINAS = value; } }
        public string PALABRAS_CLAVE { get { return _PALABRAS_CLAVE; } set { _PALABRAS_CLAVE = value; } }
        public string PUBLICACION { get { return _PUBLICACION; } set { _PUBLICACION = value; } }
        public string URL { get { return _URL; } set { _URL = value; } }
        public string VOLUMEN { get { return _VOLUMEN; } set { _VOLUMEN = value; } }
        #endregion
    }

    public class Evaluacion : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "EVALUACIONES";
        public static string Espacio = "DOCENTES";
        private DateTime _FECHA;
        private int _ID_DOCENTES;
        private int _ID_INSTITUCIONES;
        private int _ID_TIPOS_EVALUACIONES;
        private bool _INSTITUCION_UNIV;
        private string _LUGAR;
        private string _OTRA_INSTITUCION;
        private string _OTRO_TIPO_EVALUACION;
        #region Propiedades
        public DateTime FECHA { get { return _FECHA; } set { _FECHA = value; } }
        public int ID_DOCENTES { get { return _ID_DOCENTES; } set { _ID_DOCENTES = value; } }
        public int ID_INSTITUCIONES { get { return _ID_INSTITUCIONES; } set { _ID_INSTITUCIONES = value; } }
        public int ID_TIPOS_EVALUACIONES { get { return _ID_TIPOS_EVALUACIONES; } set { _ID_TIPOS_EVALUACIONES = value; } }
        public bool INSTITUCION_UNIV { get { return _INSTITUCION_UNIV; } set { _INSTITUCION_UNIV = value; } }
        public string LUGAR { get { return _LUGAR; } set { _LUGAR = value; } }
        public string OTRA_INSTITUCION { get { return _OTRA_INSTITUCION; } set { _OTRA_INSTITUCION = value; } }
        public string OTRO_TIPO_EVALUACION { get { return _OTRO_TIPO_EVALUACION; } set { _OTRO_TIPO_EVALUACION = value; } }
        #endregion
    }

    public class Reunion : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "REUNIONES";
        public static string Espacio = "DOCENTES";
        private string _EVENTO;
        private DateTime _FECHA;
        private int _ID_DOCENTES;
        private int _ID_TIPOS_REUNIONES;
        private string _LUGAR;
        private string _OTRO_TIPO_REUNION;
        private string _REUNION;
        #region Propiedades
        public string EVENTO { get { return _EVENTO; } set { _EVENTO = value; } }
        public DateTime FECHA { get { return _FECHA; } set { _FECHA = value; } }
        public int ID_DOCENTES { get { return _ID_DOCENTES; } set { _ID_DOCENTES = value; } }
        public int ID_TIPOS_REUNIONES { get { return _ID_TIPOS_REUNIONES; } set { _ID_TIPOS_REUNIONES = value; } }
        public string LUGAR { get { return _LUGAR; } set { _LUGAR = value; } }
        public string OTRO_TIPO_REUNION { get { return _OTRO_TIPO_REUNION; } set { _OTRO_TIPO_REUNION = value; } }
        public string REUNION { get { return _REUNION; } set { _REUNION = value; } }
        #endregion
    }

    public class CargoActCurric : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "CARGOS_ACT_CURRIC";
        public static string Espacio = "DOCENTES";
        private string _ACTIVIDAD_CURRICULAR;
        private int _ANIO_FINALIZACION;
        private int _ANIO_INICIO;
        private bool _CARRERA_UNIV;
        private int _ID_CARGOS_DOCENTES;
        private int _ID_CARRERAS;
        private int _ID_TIPOS_CARRERAS;
        private string _OTRA_CARRERA;
        private int _PLAN_ESTUDIOS;
        #region Propiedades
        public string ACTIVIDAD_CURRICULAR { get { return _ACTIVIDAD_CURRICULAR; } set { _ACTIVIDAD_CURRICULAR = value; } }
        public int ANIO_FINALIZACION { get { return _ANIO_FINALIZACION; } set { _ANIO_FINALIZACION = value; } }
        public int ANIO_INICIO { get { return _ANIO_INICIO; } set { _ANIO_INICIO = value; } }
        public bool CARRERA_UNIV { get { return _CARRERA_UNIV; } set { _CARRERA_UNIV = value; } }
        public int ID_CARGOS_DOCENTES { get { return _ID_CARGOS_DOCENTES; } set { _ID_CARGOS_DOCENTES = value; } }
        public int ID_CARRERAS { get { return _ID_CARRERAS; } set { _ID_CARRERAS = value; } }
        public int ID_TIPOS_CARRERAS { get { return _ID_TIPOS_CARRERAS; } set { _ID_TIPOS_CARRERAS = value; } }
        public string OTRA_CARRERA { get { return _OTRA_CARRERA; } set { _OTRA_CARRERA = value; } }
        public int PLAN_ESTUDIOS { get { return _PLAN_ESTUDIOS; } set { _PLAN_ESTUDIOS = value; } }
        #endregion
    }

    public class CargoGestion : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "CARGOS_GESTION";
        public static string Espacio = "DOCENTES";
        private int _CANTIDAD_SEMANAS;
        private string _CARGO;
        private int _DEDICACION_SEMANAL;
        private DateTime _FECHA_FINALIZACION;
        private DateTime _FECHA_INICIO;
        private int _ID_DOCENTES;
        private int _ID_TIPOS_DURACIONES_DED;
        private int _ID_INSTITUCIONES;
        private bool _INSTITUCION_UNIV;
        private string _OTRA_INSTITUCION;
        #region Propiedades
        public int CANTIDAD_SEMANAS { get { return _CANTIDAD_SEMANAS; } set { _CANTIDAD_SEMANAS = value; } }
        public string CARGO { get { return _CARGO; } set { _CARGO = value; } }
        public int DEDICACION_SEMANAL { get { return _DEDICACION_SEMANAL; } set { _DEDICACION_SEMANAL = value; } }
        public DateTime FECHA_FINALIZACION { get { return _FECHA_FINALIZACION; } set { _FECHA_FINALIZACION = value; } }
        public DateTime FECHA_INICIO { get { return _FECHA_INICIO; } set { _FECHA_INICIO = value; } }
        public int ID_DOCENTES { get { return _ID_DOCENTES; } set { _ID_DOCENTES = value; } }
        public int ID_TIPOS_DURACIONES_DED { get { return _ID_TIPOS_DURACIONES_DED; } set { _ID_TIPOS_DURACIONES_DED = value; } }
        public int ID_INSTITUCIONES { get { return _ID_INSTITUCIONES; } set { _ID_INSTITUCIONES = value; } }
        public string OTRA_INSTITUCION { get { return _OTRA_INSTITUCION; } set { _OTRA_INSTITUCION = value; } }
        public bool INSTITUCION_UNIV { get { return _INSTITUCION_UNIV; } set { _INSTITUCION_UNIV = value; } }
        #endregion
    }

    public class Titulo : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "TITULOS";
        public static string Espacio = "DOCENTES";
        private int _ANIO_OBTENCION;
        private int _ID_DOCENTES;
        private int _ID_INSTITUCIONES;
        private int _ID_PAISES;
        private int _ID_TIPOS_TITULOS;
        private string _OTRA_INSTITUCION;
        private string _TITULO;
        #region Propiedades
        public int ANIO_OBTENCION { get { return _ANIO_OBTENCION; } set { _ANIO_OBTENCION = value; } }
        public int ID_DOCENTES { get { return _ID_DOCENTES; } set { _ID_DOCENTES = value; } }
        public int ID_INSTITUCIONES { get { return _ID_INSTITUCIONES; } set { _ID_INSTITUCIONES = value; } }
        public int ID_PAISES { get { return _ID_PAISES; } set { _ID_PAISES = value; } }
        public int ID_TIPOS_TITULOS { get { return _ID_TIPOS_TITULOS; } set { _ID_TIPOS_TITULOS = value; } }
        public string OTRA_INSTITUCION { get { return _OTRA_INSTITUCION; } set { _OTRA_INSTITUCION = value; } }
        public string TITULO { get { return _TITULO; } set { _TITULO = value; } }
        #endregion
    }

    public class CarreraDocente : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "CARRERAS_DOCENTES";
        public static string Espacio = "DOCENTES";
        private int _ANIO_OBTENCION;
        private int _DURACION_CARRERA;
        private int _ID_DOCENTES;
        private int _ID_INSTITUCIONES;
        private int _ID_UNIDADES_ACADEMICAS;
        private string _OTRA_INSTITUCION;
        private bool _INSTITUCION_UNIV;
        private string _OTRA_UNIDAD_ACADEMICA;
        private string _TITULO;
        private bool _UA_UNIV;
        #region Propiedades
        public int ANIO_OBTENCION { get { return _ANIO_OBTENCION; } set { _ANIO_OBTENCION = value; } }
        public int DURACION_CARRERA { get { return _DURACION_CARRERA; } set { _DURACION_CARRERA = value; } }
        public int ID_DOCENTES { get { return _ID_DOCENTES; } set { _ID_DOCENTES = value; } }
        public int ID_INSTITUCIONES { get { return _ID_INSTITUCIONES; } set { _ID_INSTITUCIONES = value; } }
        public int ID_UNIDADES_ACADEMICAS { get { return _ID_UNIDADES_ACADEMICAS; } set { _ID_UNIDADES_ACADEMICAS = value; } }
        public string OTRA_INSTITUCION { get { return _OTRA_INSTITUCION; } set { _OTRA_INSTITUCION = value; } }
        public bool INSTITUCION_UNIV { get { return _INSTITUCION_UNIV; } set { _INSTITUCION_UNIV = value; } }
        public string OTRA_UNIDAD_ACADEMICA { get { return _OTRA_UNIDAD_ACADEMICA; } set { _OTRA_UNIDAD_ACADEMICA = value; } }
        public string TITULO { get { return _TITULO; } set { _TITULO = value; } }
        public bool UA_UNIV { get { return _UA_UNIV; } set { _UA_UNIV = value; } }
        #endregion
    }

    public class ActividadInvestigacion : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "ACTIVIDADES_INVESTIGACION";
        public static string Espacio = "DOCENTES";
        private bool _DIRECTOR_CODIRECTOR;
        private DateTime _FECHA_FINALIZACION;
        private DateTime _FECHA_INICIO;
        private int _ID_DOCENTES;
        private int _ID_INSTITUCIONES;
        private int _ID_INSTITUCIONES_EVAL;
        private int _ID_INSTITUCIONES_FINAN;
        private bool _INST_EVAL_UNIV;
        private bool _INST_FINAN_UNIV;
        private bool _INSTITUCION_UNIV;
        private string _OTRA_INST_EVAL;
        private string _OTRA_INST_FINAN;
        private string _OTRA_INSTITUCION;
        private string _RESULTADOS;
        private string _ACTIVIDAD_INVESTIGACION;
        #region Propiedades
        public bool DIRECTOR_CODIRECTOR { get { return _DIRECTOR_CODIRECTOR; } set { _DIRECTOR_CODIRECTOR = value; } }
        public DateTime FECHA_FINALIZACION { get { return _FECHA_FINALIZACION; } set { _FECHA_FINALIZACION = value; } }
        public DateTime FECHA_INICIO { get { return _FECHA_INICIO; } set { _FECHA_INICIO = value; } }
        public int ID_DOCENTES { get { return _ID_DOCENTES; } set { _ID_DOCENTES = value; } }
        public int ID_INSTITUCIONES { get { return _ID_INSTITUCIONES; } set { _ID_INSTITUCIONES = value; } }
        public int ID_INSTITUCIONES_EVAL { get { return _ID_INSTITUCIONES_EVAL; } set { _ID_INSTITUCIONES_EVAL = value; } }
        public int ID_INSTITUCIONES_FINAN { get { return _ID_INSTITUCIONES_FINAN; } set { _ID_INSTITUCIONES_FINAN = value; } }
        public bool INST_EVAL_UNIV { get { return _INST_EVAL_UNIV; } set { _INST_EVAL_UNIV = value; } }
        public bool INST_FINAN_UNIV { get { return _INST_FINAN_UNIV; } set { _INST_FINAN_UNIV = value; } }
        public bool INSTITUCION_UNIV { get { return _INSTITUCION_UNIV; } set { _INSTITUCION_UNIV = value; } }
        public string OTRA_INST_EVAL { get { return _OTRA_INST_EVAL; } set { _OTRA_INST_EVAL = value; } }
        public string OTRA_INST_FINAN { get { return _OTRA_INST_FINAN; } set { _OTRA_INST_FINAN = value; } }
        public string OTRA_INSTITUCION { get { return _OTRA_INSTITUCION; } set { _OTRA_INSTITUCION = value; } }
        public string RESULTADOS { get { return _RESULTADOS; } set { _RESULTADOS = value; } }
        public string ACTIVIDAD_INVESTIGACION { get { return _ACTIVIDAD_INVESTIGACION; } set { _ACTIVIDAD_INVESTIGACION = value; } }
        #endregion
    }

    public class TipoEvaluacion : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "TIPOS_EVALUACIONES";
        public static string Espacio = "DOCENTES";
        private string _TIPO_EVALUACION;
        #region Propiedades
        public string TIPO_EVALUACION { get { return _TIPO_EVALUACION; } set { _TIPO_EVALUACION = value; } }
        #endregion
    }

    public class CargoDocente : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "CARGOS_DOCENTES";
        public static string Espacio = "DOCENTES";
        private int _CANTIDAD_SEMANAS;
        private int _DEDICACION_SEMANAL;
        private DateTime _FECHA_FINALIZACION;
        private DateTime _FECHA_INICIO;
        private int _ID_DOCENTES;
        private int _ID_INSTITUCIONES;
        private int _ID_SUBDISCIPLINAS;
        private int _ID_TIPOS_CARGOS;
        private int _ID_TIPOS_DESIGNACIONES;
        private int _ID_TIPOS_DURACIONES_DED;
        private int _ID_UNIDADES_ACADEMICAS;
        private string _OTRA_INSTITUCION;
        private bool _INSTITUCION_UNIV;
        private string _OTRA_UNIDAD_ACADEMICA;
        private string _OTRA_DISCIPLINA;
        private string _OTRA_SUBDISCIPLINA;
        private string _OTRO_TIPO_DESIGNACION;
        private string _OTRO_TIPO_CARGO;
        private bool _UA_UNIV;
        #region Propiedades
        public int CANTIDAD_SEMANAS { get { return _CANTIDAD_SEMANAS; } set { _CANTIDAD_SEMANAS = value; } }
        public int DEDICACION_SEMANAL { get { return _DEDICACION_SEMANAL; } set { _DEDICACION_SEMANAL = value; } }
        public DateTime FECHA_FINALIZACION { get { return _FECHA_FINALIZACION; } set { _FECHA_FINALIZACION = value; } }
        public DateTime FECHA_INICIO { get { return _FECHA_INICIO; } set { _FECHA_INICIO = value; } }
        public int ID_DOCENTES { get { return _ID_DOCENTES; } set { _ID_DOCENTES = value; } }
        public int ID_INSTITUCIONES { get { return _ID_INSTITUCIONES; } set { _ID_INSTITUCIONES = value; } }
        public int ID_SUBDISCIPLINAS { get { return _ID_SUBDISCIPLINAS; } set { _ID_SUBDISCIPLINAS = value; } }
        public int ID_TIPOS_CARGOS { get { return _ID_TIPOS_CARGOS; } set { _ID_TIPOS_CARGOS = value; } }
        public int ID_TIPOS_DESIGNACIONES { get { return _ID_TIPOS_DESIGNACIONES; } set { _ID_TIPOS_DESIGNACIONES = value; } }
        public int ID_TIPOS_DURACIONES_DED { get { return _ID_TIPOS_DURACIONES_DED; } set { _ID_TIPOS_DURACIONES_DED = value; } }
        public int ID_UNIDADES_ACADEMICAS { get { return _ID_UNIDADES_ACADEMICAS; } set { _ID_UNIDADES_ACADEMICAS = value; } }
        public string OTRA_INSTITUCION { get { return _OTRA_INSTITUCION; } set { _OTRA_INSTITUCION = value; } }
        public bool INSTITUCION_UNIV { get { return _INSTITUCION_UNIV; } set { _INSTITUCION_UNIV = value; } }
        public string OTRA_UNIDAD_ACADEMICA { get { return _OTRA_UNIDAD_ACADEMICA; } set { _OTRA_UNIDAD_ACADEMICA = value; } }
        public string OTRA_DISCIPLINA { get { return _OTRA_DISCIPLINA; } set { _OTRA_DISCIPLINA = value; } }
        public string OTRA_SUBDISCIPLINA { get { return _OTRA_SUBDISCIPLINA; } set { _OTRA_SUBDISCIPLINA = value; } }
        public string OTRO_TIPO_DESIGNACION { get { return _OTRO_TIPO_DESIGNACION; } set { _OTRO_TIPO_DESIGNACION = value; } }
        public string OTRO_TIPO_CARGO { get { return _OTRO_TIPO_CARGO; } set { _OTRO_TIPO_CARGO = value; } }
        public bool UA_UNIV { get { return _UA_UNIV; } set { _UA_UNIV = value; } }
        #endregion
    }

    public class Producto : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "PRODUCTOS";
        public static string Espacio = "DOCENTES";
        private string _DESCRIPCION;
        private DateTime _FECHA_OTORGAMIENTO;
        private DateTime _FECHA_SOLICITUD;
        private int _ID_DOCENTES;
        private string _PRODUCTO;
        private bool _PROTEGIDO;
        private string _TITULAR;
        private string _URL;
        #region Propiedades
        public string DESCRIPCION { get { return _DESCRIPCION; } set { _DESCRIPCION = value; } }
        public DateTime FECHA_OTORGAMIENTO { get { return _FECHA_OTORGAMIENTO; } set { _FECHA_OTORGAMIENTO = value; } }
        public DateTime FECHA_SOLICITUD { get { return _FECHA_SOLICITUD; } set { _FECHA_SOLICITUD = value; } }
        public int ID_DOCENTES { get { return _ID_DOCENTES; } set { _ID_DOCENTES = value; } }
        public string PRODUCTO { get { return _PRODUCTO; } set { _PRODUCTO = value; } }
        public bool PROTEGIDO { get { return _PROTEGIDO; } set { _PROTEGIDO = value; } }
        public string TITULAR { get { return _TITULAR; } set { _TITULAR = value; } }
        public string URL { get { return _URL; } set { _URL = value; } }
        #endregion
    }

    public class CargoHospitalario : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "CARGOS_HOSPITALARIOS";
        public static string Espacio = "DOCENTES";
        private string _AMBITO_HOSPITALARIO;
        private string _CARGO;
        private DateTime _FECHA_FINALIZACION;
        private DateTime _FECHA_INICIO;
        private int _ID_DOCENTES;
        private int _ID_INSTITUCIONES;
        private bool _INSTITUCION_UNIV;
        private string _OTRA_INSTITUCION;
       
        #region Propiedades
        public string AMBITO_HOSPITALARIO { get { return _AMBITO_HOSPITALARIO; } set { _AMBITO_HOSPITALARIO = value; } }
        public string CARGO { get { return _CARGO; } set { _CARGO = value; } }
        public DateTime FECHA_FINALIZACION { get { return _FECHA_FINALIZACION; } set { _FECHA_FINALIZACION = value; } }
        public DateTime FECHA_INICIO { get { return _FECHA_INICIO; } set { _FECHA_INICIO = value; } }
        public int ID_DOCENTES { get { return _ID_DOCENTES; } set { _ID_DOCENTES = value; } }
        public int ID_INSTITUCIONES { get { return _ID_INSTITUCIONES; } set { _ID_INSTITUCIONES = value; } }
        public bool INSTITUCION_UNIV { get { return _INSTITUCION_UNIV; } set { _INSTITUCION_UNIV = value; } }
        public string OTRA_INSTITUCION { get { return _OTRA_INSTITUCION; } set { _OTRA_INSTITUCION = value; } }
        #endregion
    }

}