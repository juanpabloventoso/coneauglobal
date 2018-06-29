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

namespace sgwMulticapa.Objetos.CONEAU
{
    public class Provincia : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "Q_PROVINCIAS";
        public static string Espacio = "CONEAU";
        private string _PROVINCIA;
        #region Propiedades
        public string PROVINCIA { get { return _PROVINCIA; } set { _PROVINCIA = value; } }
        #endregion
    }

    public class AreaDisciplinaria : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "AREAS_DISCIPLINARIAS";
        public static string Espacio = "CONEAU";
        private string _AREA_DISCIPLINARIA;

        #region Propiedades

        public string AREA_DISCIPLINARIA { get { return _AREA_DISCIPLINARIA; } set { _AREA_DISCIPLINARIA = value; } }

        #endregion
    }

    public class Disciplina : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "DISCIPLINAS";
        public static string Espacio = "CONEAU";
        private int _ID_AREAS_DISCIPLINARIAS;
        private string _DISCIPLINA;

        #region Propiedades

        public int ID_AREAS_DISCIPLINARIAS { get { return _ID_AREAS_DISCIPLINARIAS; } set { _ID_AREAS_DISCIPLINARIAS = value; } }
        public string DISCIPLINA { get { return _DISCIPLINA; } set { _DISCIPLINA = value; } }

        #endregion
    }

    public class Subdisciplina : sgwMulticapa.Objetos.Base.ObjetoBase
    {
        public static string Entidad = "SUBDISCIPLINAS";
        public static string Espacio = "CONEAU";
        private int _ID_DISCIPLINAS;
        private string _SUBDISCIPLINA;

        #region Propiedades

        public int ID_DISCIPLINAS { get { return _ID_DISCIPLINAS; } set { _ID_DISCIPLINAS = value; } }
        public string SUBDISCIPLINA { get { return _SUBDISCIPLINA; } set { _SUBDISCIPLINA = value; } }

        #endregion
    }

}