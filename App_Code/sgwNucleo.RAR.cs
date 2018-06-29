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
using System.Runtime.InteropServices;
using Microsoft.Win32;
using System.Diagnostics;

namespace sgwNucleo.RAR
{
    public static class Funciones
    {

        public static void Comprimir(string ARuta, string ARAR, string ARutaInterna)
        {
            //Compression
            int TimeOut = 120000;
            String the_rar = "";
            RegistryKey the_Reg;
            Object the_Obj;
            String the_Info;
            ProcessStartInfo the_StartInfo;
            Process the_Process;
            the_Reg = Registry.ClassesRoot.OpenSubKey("Applications\\WinRAR.exe\\shell\\open\\command");
            if (the_Reg != null)
            {
                the_Obj = the_Reg.GetValue("");
                the_rar = the_Obj.ToString();
                the_Reg.Close();
                the_rar = the_rar.Substring(1, the_rar.Length - 7);
            }
            if (the_rar == "")
                the_rar = "{PROGRAMFILES}\\WinRAR\\WinRAR.exe";
            if (ARutaInterna != "")
                the_Info = " a -ed -ep1 -ap" + ARutaInterna + " " + " \"" + ARAR + "\" " + " \"" + ARuta + "\"";
            else
                the_Info = " a -ed -ep1 " + " " + ARAR + " " + " " + ARuta;
            the_StartInfo = new ProcessStartInfo();
            the_StartInfo.FileName = the_rar;
            the_StartInfo.Arguments = the_Info;
            the_StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
            the_StartInfo.WorkingDirectory = "C:\\";
            the_Process = new Process();
            the_Process.StartInfo = the_StartInfo;
            the_Process.Start();
            the_Process.WaitForInputIdle();
            the_Process.WaitForExit(TimeOut);
            if (!the_Process.HasExited)
                the_Process.Kill();
        }

        public static void Descomprimir(string ARAR, string ARuta)
        {
            int TimeOut = 30000;
            String the_rar = "";
            RegistryKey the_Reg;
            Object the_Obj;
            String the_Info;
            ProcessStartInfo the_StartInfo;
            Process the_Process;
            the_Reg = Registry.ClassesRoot.OpenSubKey("Applications\\WinRar.exe\\shell\\open\\command");
            if (the_Reg != null)
            {
                the_Obj = the_Reg.GetValue("");
                the_rar = the_Obj.ToString();
                the_Reg.Close();
                the_rar = the_rar.Substring(1, the_rar.Length - 7);
            }
            if (the_rar == "")
                the_rar = "C:\\Program Files (x86)\\WinRAR\\WinRAR.exe";
            the_Info = " X " + " \"" + ARAR + "\" " + " \"" + ARuta + "\"";
            the_StartInfo = new ProcessStartInfo();
            the_StartInfo.FileName = the_rar;
            the_StartInfo.Arguments = the_Info;
            the_StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
            the_Process = new Process();
            the_Process.StartInfo = the_StartInfo;
            the_Process.Start();
            the_Process.WaitForInputIdle();
            the_Process.WaitForExit(TimeOut);
            if (!the_Process.HasExited)
                the_Process.Kill();
        }

    }
}