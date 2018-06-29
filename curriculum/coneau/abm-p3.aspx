<%@ Page Language="C#" MasterPageFile="../abm.master" AutoEventWireup="true" CodeFile="abm-p3.aspx.cs"
    Inherits="_Default" Title="Área de desempeño - ATENEA | Currículum Docente" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Central" runat="server">

<h3>3. Área principal de desempeño profesional</h3><br />


    <!-- AYUDA DEL PUNTO -->
        El área principal de desempeño académico profesional se define a partir de la disciplina,
        subdisciplina y, eventualmente, el área de especialización en la cual el docente
        se ha formado y desarrolla sus actividades académicas y profesionales. La especificación
        del área de especialización tiene carácter opcional.
        <br />
    <!-- FIN AYUDA DEL PUNTO -->
    <!-- INFORMACION GENERAL -->
    <br />
    
<span class="lbl-punto">3.1.</span> Disciplina.
<div class="div-punto">
        <asp:DropDownList ID="cmbDisciplinas" runat="server" Width="350" CssClass="axControl" AutoPostBack="True" OnSelectedIndexChanged="cmbDisciplina_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Panel ID="pnlAreaDesempenioOtraDisciplina" runat="server">
            <asp:Label ID="Label11" runat="server" Text="* Otra disciplina: "
                CssClass="axEtiqueta" Width="120"></asp:Label>
            <asp:TextBox ID="edtOtraDisciplina" runat="server" Width="300" CssClass="axControl"></asp:TextBox>
            <br />
            <br />
        </asp:Panel>
</div>


<span class="lbl-punto">3.2.</span> Subdisciplina.
<div class="div-punto">
        <asp:DropDownList ID="cmbAreaDesempenioSubdisciplina" runat="server" Width="350" AutoPostBack="True" OnSelectedIndexChanged="cmbSubdisciplina_SelectedIndexChanged"
            CssClass="axControl">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Panel ID="pnlAreaDesempenioOtraSubdisciplina" runat="server">
            <asp:Label ID="Label1" runat="server" Text="* Otra subdisciplina: "
                CssClass="axEtiqueta" Width="120"></asp:Label>
            <asp:TextBox ID="edtOtraSubdisciplina" runat="server" Width="300" CssClass="axControl"></asp:TextBox>
            <br />
            <br />
        </asp:Panel>
</div>


<span class="lbl-punto">3.3.</span> Área de especialización.
<div class="div-punto">
        <asp:TextBox ID="edtAreaDesempenioEspecializacion" runat="server" Width="350" CssClass="axControl"></asp:TextBox>
        <br />
        <br />
</div>

    <!-- INFORMACION GENERAL -->
    <!-- BOTONERA GENERAL -->
    <div class="fullform-botonera-inferior">
        <asp:Button ID="btnGuardarDatosGenerales" runat="server" OnClick="btnGuardarDatosGenerales_Click" Text="Guardar" CssClass="boton boton-verde" />
        <img id="img-botonera-cargando" src="/coneauglobal/recursos/imagenes/iconos/cargando.gif" title="Cargando..." />
    </div>
    <!-- FIN BOTONERA GENERAL -->
    <div class="div-clear">
    </div>
</asp:Content>
