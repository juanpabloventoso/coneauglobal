<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="base.master" CodeFile="configuracion.aspx.cs" Inherits="form_inicio" Title="CONEAU Global | ATENEA - Ficha Institucional" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>





<asp:Content ID="Content4" ContentPlaceHolderID="Cabecera" runat="server">
Configuración de mi currículum
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">


    <asp:Panel ID="pnlCurriculum" runat="server">
        <div class="div-cuadro">
            <h3>Origen de mi currículum</h3>
            <br />
            <b>Desde esta opción podrá modificar el orígen de su currículum</b>. Seleccione <b>CVar</b> si posee previamente una ficha completada en el currículum unificado, o bien piensa completarla a futuro.<br />
            El currículum CVar permite importar información de SIGEVA-CONICET, además de poder utilizar su ficha para CONEAU y para las categorizaciones del programa de Incentivos.<br />
            Si es docente extranjero o desea seguir utilizando su Ficha Docente CONEAU, <b>seleccione CONEAU</b>.
            <br /><br />
            <div style="width: 450px; border: solid 1px #ddd; background: #f1f1f1; padding: 20px">
            Origen de mi currículum:
            <asp:DropDownList runat="server" ID="ddlOrigen" Width="200">
                <asp:ListItem Text="CVar" Value="CVar"></asp:ListItem>
                <asp:ListItem Text="CONEAU" Value="CONEAU"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <span class="axEtiquetaAyuda">Para más información sobre CVar, puede ingresar a la <a href="http://www.mincyt.gob.ar/accion/cvar-6467" target="_blank">siguiente sección</a>.</span>
            </div>
        </div>
    </asp:Panel>


    <asp:Panel ID="pnlCUIT" runat="server">
        <div class="div-cuadro">
            <h3>Mi número de CUIT/CUIL</h3>
            <br />
            <b>Desde esta opción podrá modificar el número de CUIT/CUIL de su cuenta.</b> Tenga en cuenta que esta información lo enlazará a CVar, en caso de utilizar dicho origen.<br />
            Modifique esta información sólamente si aplicará una corrección válida a su número de identificación.
            <br /><br />
            <div style="width: 300px; border: solid 1px #ddd; background: #f1f1f1; padding: 20px">
            CUIT/CUIL:
            <asp:TextBox runat="server" ID="txtCUIT" Width="200">
            </asp:TextBox>
            </div>
        </div>
    </asp:Panel>

    
    <asp:Panel ID="pnlColaborador" runat="server">
        <div class="div-cuadro">
            <h3>Colaborador</h3>
            <br />
            <b>Desde esta opción podrá designar un colaborador para que complete y/o actualice su currículum.</b> Ingrese la dirección de correo electrónico de la persona que lo ayudará a gestionar su currículum personal.<br />
            La persona deberá tener un usuario de CONEAU Global para poder trabajar. Esta persona podrá trabajar con su información curricular pero <b>no podrá aprobar o rechazar vinculaciones</b>.
            <br /><br />
            <div style="width: 300px; border: solid 1px #ddd; background: #f1f1f1; padding: 20px">
            Correo electrónico del colaborador:
            <asp:TextBox runat="server" ID="txtColaborador" Width="300">
            </asp:TextBox>
            </div>
        </div>
    </asp:Panel>

    <br />
    
    <asp:Button ID="btnVolver" runat="server" OnClick="btnAceptar_Click" Text="Aceptar" CssClass="boton boton-verde" />
    <asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" CssClass="boton boton-rojo" />
   

</asp:Content>
