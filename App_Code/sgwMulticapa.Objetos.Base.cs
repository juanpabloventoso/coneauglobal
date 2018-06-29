using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using sgwMulticapa;
using System.Collections;
using System.Reflection;

/// <summary>
/// Summary description for ObjetoBase
/// </summary>

namespace sgwMulticapa.Objetos.Base
{


    // Clase base de acceso a datos
    public class ObjetoBase
    {
        private int _ID;
        const string _ValorError = "No se pudo obtener el valor. Si el problema persiste, contáctese con el administrador.";
        #region Propiedades
        public int ID { get { return _ID; } set { _ID = value; } }
        #endregion

        /// <summary>
        /// Devuelve todas las propiedades (nombres, no valores) del objeto
        /// </summary>
        /// <returns></returns>
        public ArrayList ObtenerPropiedades()
        {
            // Obtener el listado de propiedades del objeto
            ArrayList FListado = new ArrayList();
            PropertyInfo[] FPropiedades = this.GetType().GetProperties();
            foreach (PropertyInfo FPropiedad in FPropiedades)
                if ((FPropiedad.CanRead) && (FPropiedad.CanWrite))
                {
                    // Si la propiedad es la clave, adjuntar la entidad
                    if (FPropiedad.Name == "ID")
                        FListado.Add("ID_" + this.GetType().GetField("Entidad").GetValue(null).ToString());
                    else
                        FListado.Add(FPropiedad.Name);
                }
            return FListado;
        }

        /// <summary>
        /// Devuelve el valor de una propiedad de un objeto
        /// </summary>
        /// <returns></returns>
        public string ObtenerValor(string APropiedad)
        {
            string FPropiedad;
            if (APropiedad == "ID_" + this.GetType().GetField("Entidad").GetValue(this).ToString())
                FPropiedad = "ID";
            else
                FPropiedad = APropiedad;
            PropertyInfo FPropiedadInfo = this.GetType().GetProperty(FPropiedad);
            if ((FPropiedadInfo != null) && (FPropiedadInfo.GetValue(this, null) != null))
                return FPropiedadInfo.GetValue(this, null).ToString();
            else
                return _ValorError;
        }

        /// <summary>
        /// Devuelve el valor de una propiedad de un objeto en formato para ejecutar sentencias SQL
        /// </summary>
        /// <returns></returns>
        public string ObtenerValorSQL(string APropiedad)
        {
            string FPropiedad;
            if (APropiedad == "ID_" + this.GetType().GetField("Entidad").GetValue(this).ToString())
                FPropiedad = "ID";
            else
                FPropiedad = APropiedad;
            PropertyInfo FPropiedadInfo = this.GetType().GetProperty(FPropiedad);
            if ((FPropiedadInfo != null) && (FPropiedadInfo.GetValue(this, null) != null))
            {

                // Guardar un campo entero o de punto flotante
                if ((FPropiedadInfo.PropertyType.ToString() == "decimal") ||
                    (FPropiedadInfo.PropertyType.ToString() == "System.Int32"))
                {
                    if ((APropiedad.Contains("ID_")) && (FPropiedadInfo.GetValue(this, null).ToString() == "0"))
                        return "NULL";
                    else
                        return FPropiedadInfo.GetValue(this, null).ToString();
                }
                else
                {
                    // Guardar un campo de fecha, verificando que puede ser nulo
                    if (FPropiedadInfo.PropertyType.ToString() == "System.DateTime")
                    {
                        if (((DateTime)FPropiedadInfo.GetValue(this, null)).Year == 1)
                            return "NULL";
                        else
                            return "'" + ((DateTime)FPropiedadInfo.GetValue(this, null)).Day +
                            "/" + ((DateTime)FPropiedadInfo.GetValue(this, null)).Month +
                            "/" + ((DateTime)FPropiedadInfo.GetValue(this, null)).Year + "'";
                    }

                    // Guardar un campo booleano
                    else
                    {
                        if (FPropiedadInfo.PropertyType.ToString() == "System.Boolean")
                        {
                            if (FPropiedadInfo.GetValue(this, null).ToString() == "True")
                                return "'S'";
                            else
                                return "'N'";
                        }

                        // Guardar un campo de texto
                        else
                            return "'" + FPropiedadInfo.GetValue(this, null).ToString().Replace("'", "&#39").Trim() + "'";
                    }
                }
            }
            else
                return "NULL";
        }

        /// <summary>
        /// Lee un valor de las propiedades de un Row
        /// </summary>
        /// <returns></returns>
        public int LeerValor(DataRow ARow, string ACampo, string APropiedad)
        {
            int FIndice = ARow.Table.Columns.IndexOf(ACampo);
            if (FIndice < 0)
                return 1;
            PropertyInfo FPropiedad = this.GetType().GetProperty(APropiedad);
            if (FPropiedad == null)
                return 2;
            if (ARow[FIndice].ToString() == "")
                return 3;
            if ((FPropiedad.PropertyType.ToString() == "decimal") ||
                (FPropiedad.PropertyType.ToString() == "System.Int32"))
                FPropiedad.SetValue(this, int.Parse(ARow[FIndice].ToString()), null);
            else
            {
                if (FPropiedad.PropertyType.ToString() == "System.DateTime")
                {
                    FPropiedad.SetValue(this, ARow[FIndice], null);
                }
                else
                {
                    if (FPropiedad.PropertyType.ToString() == "System.Boolean")
                    {
                        if (ARow[FIndice].ToString() == "S")
                            FPropiedad.SetValue(this, true, null);
                        else
                            FPropiedad.SetValue(this, false, null);
                    }
                    else
                    {
                        if (FPropiedad.PropertyType.ToString() == "System.Single")
                        {
                            FPropiedad.SetValue(this, float.Parse(ARow[FIndice].ToString()), null);
                        }
                        else
                            FPropiedad.SetValue(this, ARow[FIndice].ToString().Replace("&#39", "'"), null);
                    }
                }
            }
            return 0;
        }

        /// <summary>
        /// Lee todos los valores de las propiedades de un Row
        /// </summary>
        /// <returns></returns>
        virtual public int LeerValores(DataRow ARow)
        {
            PropertyInfo[] FPropiedades = this.GetType().GetProperties();
            foreach (PropertyInfo FPropiedad in FPropiedades)
                if ((FPropiedad.CanRead) && (FPropiedad.CanWrite))
                {
                    if (FPropiedad.Name == "ID")
                        LeerValor(ARow, "ID_" + this.GetType().GetField("Entidad").GetValue(this).ToString(), FPropiedad.Name);
                    else
                        LeerValor(ARow, FPropiedad.Name, FPropiedad.Name);
                }
            return 0;
        }

        public bool GuardarFecha(string APropiedad, string ATexto)
        {
            DateTime FDate;
            PropertyInfo FPropiedad = this.GetType().GetProperty(APropiedad);
            if ((ATexto.Trim() == "") || (!DateTime.TryParse(ATexto, out FDate)))
            {
                FPropiedad.SetValue(this, DateTime.ParseExact("01/01/0001", "dd/MM/yyyy", null), null);
                return false;
            }
            FPropiedad.SetValue(this, DateTime.ParseExact(ATexto, "dd/MM/yyyy", null), null);
            return true;
        }

        public bool GuardarFechaHora(string APropiedad, string ATexto)
        {
            DateTime FDateTime;
            PropertyInfo FPropiedad = this.GetType().GetProperty(APropiedad);
            if ((ATexto.Trim() == "") || (!DateTime.TryParse(ATexto, out FDateTime)))
            {
                FPropiedad.SetValue(this, DateTime.ParseExact("01/01/0001 00:00:00", "dd/MM/yyyy HH:mm:ss", null), null);
                return false;
            }
            FPropiedad.SetValue(this, DateTime.ParseExact(ATexto, "dd/MM/yyyy HH:mm:ss", null), null);
            return true;
        }

        public string LeerFecha(string APropiedad)
        {
            PropertyInfo FPropiedad = this.GetType().GetProperty(APropiedad);
            if (((DateTime)FPropiedad.GetValue(this, null)).Year == 1)
                return "";
            else
                return ((DateTime)FPropiedad.GetValue(this, null)).ToShortDateString() ;
        }

        public string LeerFechaHora(string APropiedad)
        {
            PropertyInfo FPropiedad = this.GetType().GetProperty(APropiedad);
            if (((DateTime)FPropiedad.GetValue(this, null)).Year == 1)
                return "";
            else
                return ((DateTime)FPropiedad.GetValue(this, null)).ToString();
        }

    }
}