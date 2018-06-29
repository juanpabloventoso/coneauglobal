using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using sgwMulticapa.Objetos.CONEAU.Docentes;

    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            sgwNucleo.Usuarios.VerificarUsuarioAutenticado();
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            if (!Page.IsPostBack)
            {
                // Listado de Disciplinas
                DataSet datos = FGestor.LeerSQL("SELECT ID_DISCIPLINAS, DISCIPLINA FROM SIS_CONEAU.Q_DISCIPLINAS");
                sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbDisciplinas, datos, false, false);
                actualizarDatos();
            }
        }

        // Botones General
        protected bool guardar()
        {
            string FEstado = "";
            if ((pnlAreaDesempenioOtraDisciplina.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtOtraDisciplina.Text)))
                FEstado = "la disciplina";
            else
                if ((pnlAreaDesempenioOtraSubdisciplina.Visible) && (!sgwNucleo.Funciones.VerificarRequerido(edtOtraSubdisciplina.Text)))
                    FEstado = "la subdisciplina";
            if (FEstado != "")
            {
                sgwNucleo.Pagina.MostrarEstado("Debe completar " + FEstado + ".", 1);
                return false;
            }
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Docente FDocente = new Docente();
            FGestor.ObtenerObjeto(FDocente, int.Parse(Session["ID_DOCENTES"].ToString()));
            FDocente.ID_SUBDISCIPLINAS = int.Parse(cmbAreaDesempenioSubdisciplina.SelectedValue);
            if (pnlAreaDesempenioOtraDisciplina.Visible)
                FDocente.OTRA_DISCIPLINA = edtOtraDisciplina.Text;
            if (pnlAreaDesempenioOtraSubdisciplina.Visible)
                FDocente.OTRA_SUBDISCIPLINA = edtOtraSubdisciplina.Text;
            FDocente.ESPECIALIDAD = edtAreaDesempenioEspecializacion.Text;
            return FGestor.GuardarObjeto(FDocente); 
        }

        protected void btnGuardarC_Click(object sender, EventArgs e)
        {
            if (guardar())
                Response.Redirect("abm-p4.aspx");
        }

        protected void btnGuardarDatosGenerales_Click(object sender, EventArgs e)
        {
            if (guardar())
                sgwNucleo.Pagina.MostrarEstado("Se han guardado los cambios.", 2);
        }

        protected void btnCancelarDatosGenerales_Click(object sender, EventArgs e)
        {
            Response.Redirect("inicio.aspx");
        }

        protected void actualizarDatos()
        {
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            Docente FDocente = new Docente();
            FGestor.ObtenerObjeto(FDocente, int.Parse(Session["ID_DOCENTES"].ToString()));

            DataSet FData = FGestor.LeerSQL("SELECT ID_DISCIPLINAS FROM SIS_CONEAU.SUBDISCIPLINAS " +
                "WHERE ID_SUBDISCIPLINAS = " + FDocente.ID_SUBDISCIPLINAS.ToString());
            if (FData.Tables[0].Rows.Count < 1)
                cmbDisciplinas.SelectedIndex = 0;
            else
                cmbDisciplinas.SelectedValue = FData.Tables[0].Rows[0].ItemArray[0].ToString();
            cmbDisciplina_SelectedIndexChanged(null, null);
            cmbAreaDesempenioSubdisciplina.SelectedValue = FDocente.ID_SUBDISCIPLINAS.ToString();
            cmbSubdisciplina_SelectedIndexChanged(null, null);
            if (pnlAreaDesempenioOtraDisciplina.Visible)
                edtOtraDisciplina.Text = FDocente.OTRA_DISCIPLINA;
            if (pnlAreaDesempenioOtraSubdisciplina.Visible)
                edtOtraSubdisciplina.Text = FDocente.OTRA_SUBDISCIPLINA;
            edtAreaDesempenioEspecializacion.Text = FDocente.ESPECIALIDAD;
        }

        protected void cmbDisciplina_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlAreaDesempenioOtraDisciplina.Visible = cmbDisciplinas.SelectedValue == "1000";
            // Listado de Disciplinas
            sgwMulticapa.Gestor.Gestor FGestor = sgwMulticapa.Gestor.Gestor.GestorGlobal();
            DataSet datos = FGestor.LeerSQL("SELECT ID_SUBDISCIPLINAS, SUBDISCIPLINA FROM SIS_CONEAU.Q_SUBDISCIPLINAS WHERE ID_DISCIPLINAS = " +
                cmbDisciplinas.SelectedValue);
            sgwMulticapa.Objetos.Funciones.CompletarListaDesplegable(cmbAreaDesempenioSubdisciplina, datos, false, false);
            cmbSubdisciplina_SelectedIndexChanged(sender, e);
        }

        protected void cmbSubdisciplina_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbAreaDesempenioSubdisciplina.SelectedItem == null) return;
            pnlAreaDesempenioOtraSubdisciplina.Visible = cmbAreaDesempenioSubdisciplina.SelectedItem.Text == "(Otra opción...)";
        }

}
