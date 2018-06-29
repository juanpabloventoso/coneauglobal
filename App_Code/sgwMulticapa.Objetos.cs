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
using sgwMulticapa.Objetos.Base;

/// <summary>
/// Summary description for ObjetoBase
/// </summary>

namespace sgwMulticapa.Objetos
{


    // Clase base de acceso a datos
    public static class Funciones
    {

        /// <summary>
        /// Asigna una lista de objetos sgwMulticapa.Objetos.Base a una lista desplegable
        /// </summary>
        public static void CompletarListaDesplegable(DropDownList ALista, ArrayList AObjetos, string APropiedadTexto, bool AAbierto, bool ADefecto)
        {
            bool FMostrarClave = sgwNucleo.Usuarios.EsAdministrador();
            ALista.Items.Clear();
            if (AObjetos != null)
            {
                foreach (ObjetoBase FObjeto in AObjetos)
                {
                    ListItem FItem = new ListItem();
                    if (FMostrarClave)
                        FItem.Text = "[" + FObjeto.ID.ToString() + "] " + FObjeto.ObtenerValor(APropiedadTexto);
                    else
                        FItem.Text = FObjeto.ObtenerValor(APropiedadTexto);
                    FItem.Value = FObjeto.ID.ToString();
                    ALista.Items.Add(FItem);
                }
            }
            if (AAbierto)
            {
                ListItem FItem = new ListItem();
                if (FMostrarClave)
                    FItem.Text = "[-1] (Otra opción...)";
                else
                    FItem.Text = "(Otra opción...)";
                FItem.Value = "-1";
                ALista.Items.Add(FItem);
            }
            if (ADefecto)
            {
                ListItem FItem = new ListItem();
                if (FMostrarClave)
                    FItem.Text = "[-2] (Seleccionar)";
                else
                    FItem.Text = "(Seleccionar)";
                FItem.Value = "-2";
                ALista.Items.Insert(0, FItem);
            }
        }
        public static void CompletarListaDesplegable(DropDownList ALista, ArrayList AObjetos, string APropiedadTexto, bool AAbierto)
        {
            bool FMostrarClave = sgwNucleo.Usuarios.EsAdministrador();
            ALista.Items.Clear();
            if (AObjetos != null)
            {
                foreach (ObjetoBase FObjeto in AObjetos)
                {
                    ListItem FItem = new ListItem();
                    if (FMostrarClave)
                        FItem.Text = "[" + FObjeto.ID.ToString() + "] " + FObjeto.ObtenerValor(APropiedadTexto);
                    else
                        FItem.Text = FObjeto.ObtenerValor(APropiedadTexto);
                    FItem.Value = FObjeto.ID.ToString();
                    ALista.Items.Add(FItem);
                }
            }
            if (AAbierto)
            {
                ListItem FItem = new ListItem();
                if (FMostrarClave)
                    FItem.Text = "[-1] (Otra opción...)";
                else
                    FItem.Text = "(Otra opción...)";
                FItem.Value = "-1";
                ALista.Items.Add(FItem);
            }
            ListItem FItemDefecto = new ListItem();
            if (FMostrarClave)
                FItemDefecto.Text = "[-2] (Seleccionar)";
            else
                FItemDefecto.Text = "(Seleccionar)";
            FItemDefecto.Value = "-2";
            ALista.Items.Insert(0, FItemDefecto);
        }

        /* FUNCION PARA LLENAR UN LISTBOX */
        public static void CompletarListaMultiple(ListBox ALista, DataSet ADataSet, bool AAbierto, bool ADefecto)
        {
            bool FMostrarClave = sgwNucleo.Usuarios.EsAdministrador();
            ALista.Items.Clear();
            if (ADataSet != null)
            {
                foreach (DataRow FRow in ADataSet.Tables[0].Rows)
                {
                    ListItem FItem = new ListItem();
                    if (FMostrarClave)
                        FItem.Text = "[" + FRow.ItemArray[0].ToString() + "] " + FRow.ItemArray[1].ToString();
                    else
                        FItem.Text = FRow.ItemArray[1].ToString();
                    FItem.Value = FRow.ItemArray[0].ToString();
                    ALista.Items.Add(FItem);
                }
            }
        }
        /* FIN FUNCION PARA LLENAR UN LISTBOX */

        public static void CompletarListaDesplegable(DropDownList ALista, ArrayList AObjetos, string APropiedadTexto, string APropiedadClave,
            bool AAbierto, bool ADefecto)
        {
            bool FMostrarClave = sgwNucleo.Usuarios.EsAdministrador();
            ALista.Items.Clear();
            if (AObjetos != null)
            {
                foreach (ObjetoBase FObjeto in AObjetos)
                {
                    ListItem FItem = new ListItem();
                    if (FMostrarClave)
                        FItem.Text = "[" + FObjeto.ObtenerValor(APropiedadClave) + "] " + FObjeto.ObtenerValor(APropiedadTexto);
                    else
                        FItem.Text = FObjeto.ObtenerValor(APropiedadTexto);
                    FItem.Value = FObjeto.ObtenerValor(APropiedadClave);
                    ALista.Items.Add(FItem);
                }
            }
            if (AAbierto)
            {
                ListItem FItem = new ListItem();
                if (FMostrarClave)
                    FItem.Text = "[-1] (Otra opción...)";
                else
                    FItem.Text = "[-1] (Otra opción...)";
                FItem.Value = "-1";
                ALista.Items.Add(FItem);
            }
            if (ADefecto)
            {
                ListItem FItemDefecto = new ListItem();
                if (FMostrarClave)
                    FItemDefecto.Text = "[-2] (Seleccionar)";
                else
                    FItemDefecto.Text = "(Seleccionar)";
                FItemDefecto.Value = "-2";
                ALista.Items.Insert(0, FItemDefecto);
            }
        }

        public static void CompletarListaDesplegable(DropDownList ALista, ArrayList AObjetos, string APropiedadTexto, string APropiedadClave,
            bool AAbierto)
        {
            bool FMostrarClave = sgwNucleo.Usuarios.EsAdministrador();
            ALista.Items.Clear();
            if (AObjetos != null)
            {
                foreach (ObjetoBase FObjeto in AObjetos)
                {
                    ListItem FItem = new ListItem();
                    if (FMostrarClave)
                        FItem.Text = "[" + FObjeto.ObtenerValor(APropiedadClave) + "] " + FObjeto.ObtenerValor(APropiedadTexto);
                    else
                        FItem.Text = FObjeto.ObtenerValor(APropiedadTexto);
                    FItem.Value = FObjeto.ObtenerValor(APropiedadClave);
                    ALista.Items.Add(FItem);
                }
            }
            if (AAbierto)
            {
                ListItem FItem = new ListItem();
                if (FMostrarClave)
                    FItem.Text = "[-1] (Otra opción...)";
                else
                    FItem.Text = "(Otra opción...)";
                FItem.Value = "-1";
                ALista.Items.Add(FItem);
            }
            ListItem FItemDefecto = new ListItem();
            if (FMostrarClave)
                FItemDefecto.Text = "[-2] (Seleccionar)";
            else
                FItemDefecto.Text = "(Seleccionar)";
            FItemDefecto.Value = "-2";
            ALista.Items.Insert(0, FItemDefecto);
        }

        public static void CompletarListaDesplegable(DropDownList ALista, DataSet ADataSet, bool AAbierto, bool ADefecto)
        {
            bool FMostrarClave = sgwNucleo.Usuarios.EsAdministrador();
            ALista.Items.Clear();
            if (ADataSet != null)
            {
                foreach (DataRow FRow in ADataSet.Tables[0].Rows)
                {
                    ListItem FItem = new ListItem();
                    if (FMostrarClave)
                        FItem.Text = "[" + FRow.ItemArray[0].ToString() + "] " + FRow.ItemArray[1].ToString();
                    else
                        FItem.Text = FRow.ItemArray[1].ToString();
                    FItem.Value = FRow.ItemArray[0].ToString();
                    ALista.Items.Add(FItem);
                }
            }
            if (AAbierto)
            {
                ListItem FItem = new ListItem();
                if (FMostrarClave)
                    FItem.Text = "[-1] (Otra opción...)";
                else
                    FItem.Text = "(Otra opción...)";
                FItem.Value = "-1";
                ALista.Items.Add(FItem);
            }
            if (ADefecto)
            {
                ListItem FItemDefecto = new ListItem();
                if (FMostrarClave)
                    FItemDefecto.Text = "[-2] (Seleccionar)";
                else
                    FItemDefecto.Text = "(Seleccionar)";
                FItemDefecto.Value = "-2";
                ALista.Items.Insert(0, FItemDefecto);
            }
        }

        public static void CompletarListaDesplegable(DropDownList ALista, DataSet ADataSet, bool AAbierto)
        {
            bool FMostrarClave = sgwNucleo.Usuarios.EsAdministrador();
            ALista.Items.Clear();
            if (ADataSet != null)
            {
                foreach (DataRow FRow in ADataSet.Tables[0].Rows)
                {
                    ListItem FItem = new ListItem();
                    if (FMostrarClave)
                        FItem.Text = "[" + FRow.ItemArray[0].ToString() + "] " + FRow.ItemArray[1].ToString();
                    else
                        FItem.Text = FRow.ItemArray[1].ToString();
                    FItem.Value = FRow.ItemArray[0].ToString();
                    ALista.Items.Add(FItem);
                }
            }
            if (AAbierto)
            {
                ListItem FItem = new ListItem();
                if (FMostrarClave)
                    FItem.Text = "[-1] (Otra opción...)";
                else
                    FItem.Text = "(Otra opción...)";
                FItem.Value = "-1";
                ALista.Items.Add(FItem);
            }
            ListItem FItemDefecto = new ListItem();
            if (FMostrarClave)
                FItemDefecto.Text = "[-2] (Seleccionar)";
            else
                FItemDefecto.Text = "(Seleccionar)";
            FItemDefecto.Value = "-2";
            ALista.Items.Insert(0, FItemDefecto);
        }

    }
}