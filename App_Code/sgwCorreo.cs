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
using System.Net.Mail;

namespace sgwCorreo
{

    public static class Funciones
    {

        public static void EnviarCorreo(string ADe, string APara, string AAsunto, string ACuerpo,
            string AUsuario, string APassword, string AHost)
        {
            MailMessage FMensaje = new MailMessage();
            FMensaje.From = new MailAddress(ADe);
            FMensaje.Subject = AAsunto;
            FMensaje.IsBodyHtml = true;
            FMensaje.Priority = System.Net.Mail.MailPriority.Normal;
            SmtpClient FSMTP = new SmtpClient();
            FSMTP.Host = AHost;
            FSMTP.UseDefaultCredentials = false;
            FSMTP.Credentials = new System.Net.NetworkCredential(AUsuario, APassword);
            string[] FPara = APara.Split(';');
            for (int I = 0; I < FPara.Length; I++)
                FMensaje.To.Add(FPara[I]);
            FMensaje.Body = ACuerpo;
            FSMTP.SendAsync(FMensaje, null);
        }

        public static void EnviarCorreo(string ADe, string APara, string AAsunto, string ACuerpo)
        {
            MailMessage FMensaje = new MailMessage();
            FMensaje.From = new MailAddress(ADe);
            FMensaje.Subject = AAsunto;
            FMensaje.IsBodyHtml = true;
            FMensaje.Priority = System.Net.Mail.MailPriority.Normal;
            SmtpClient FSMTP = new SmtpClient();
            FSMTP.Host = "HOST";
            FSMTP.UseDefaultCredentials = false;
            FSMTP.Credentials = new System.Net.NetworkCredential("global", "PASSWORD");
            string[] FPara = APara.Split(';');
            for (int I = 0; I < FPara.Length; I++)
                FMensaje.To.Add(FPara[I]);
            FMensaje.Body = ACuerpo;
            FSMTP.SendAsync(FMensaje, null);
        }

        public static void EnviarCorreoCopiaGlobal(string ADe, string APara, string AAsunto, string ACuerpo)
        {
            MailMessage FMensaje = new MailMessage();
            FMensaje.From = new MailAddress(ADe);
            FMensaje.Subject = AAsunto;
            FMensaje.IsBodyHtml = true;
            FMensaje.Priority = System.Net.Mail.MailPriority.Normal;
            SmtpClient FSMTP = new SmtpClient();
            FSMTP.Host = "HOST";
            FSMTP.UseDefaultCredentials = false;
            FSMTP.Credentials = new System.Net.NetworkCredential("global", "PASSWORD");
            string[] FPara = APara.Split(';');
            for (int I = 0; I < FPara.Length; I++)
                FMensaje.To.Add(FPara[I]);
            FMensaje.CC.Add("global@coneau.gob.ar");
            FMensaje.Body = ACuerpo;
            FSMTP.SendAsync(FMensaje, null);
        }

    }

}