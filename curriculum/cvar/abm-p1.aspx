<%@ Page Language="C#" MasterPageFile="../abm.master" AutoEventWireup="true" CodeFile="abm-p1.aspx.cs"
    Inherits="_Default" Title="Datos personales - ATENEA | Currículum Docente" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Central" runat="server">

<asp:Panel ID="pnlNoAnda" runat="server">
    <div style="padding: 10px; background: #fdd; border: solid 1px #ccc; text-align: center">
       <br />
        Por problemas ajenos a CONEAU, el currículum CVar no se puede mostrar en este momento. Reintente la operación en unos instantes.
        <br /><br />
        Ante cualquier duda consulte a consultacvar@mincyt.gob.ar.
        <br /><br />
        </div>
</asp:Panel>

<asp:Panel ID="pnlAnda" runat="server">

<h3>1. Datos personales</h3><br />

Esta ficha es una adaptación del currículum CVar a la información requerida por CONEAU de los docentes vinculados a las carreras que se presentan a acreditación.

<br /><br />

<span class="lbl-punto">1.1.</span> Información general
<% if (sgwNucleo.Usuarios.EsDocente()) { %><br /><br /><div class="div-titulo-popup-violeta" style="font-weight: normal"><b>Origen CVar</b>: Datos personales > Identificación</div><br /><% } %>
<div class="div-punto">

        <div class="div-mitad">
            <asp:Label ID="Label11" runat="server" Text="* Apellido:" CssClass="axEtiqueta" Width="150"></asp:Label>
            <asp:TextBox ID="edtDocenteApellido" runat="server" Width="250" CssClass="axControl"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="* Sexo:" CssClass="axEtiqueta" Width="150"></asp:Label>
            <asp:TextBox ID="txtDocenteSexo" runat="server" Width="150" CssClass="axControl">
            </asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="* Documento:" CssClass="axEtiqueta" Width="150"></asp:Label>
            <asp:TextBox ID="edtDocenteDocumento" runat="server" Width="150" CssClass="axControl"></asp:TextBox>
            <br />
            <br />
        </div>
        <div class="div-mitad">
            <asp:Label ID="Label33" runat="server" Text="* Nombre(s):" CssClass="axEtiqueta" Width="150"></asp:Label>
            <asp:TextBox ID="edtDocenteNombre1" runat="server" Width="250" CssClass="axControl"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label42" runat="server" Text="* Fecha de nacimiento:" CssClass="axEtiqueta"
                Width="150"></asp:Label>
            <asp:TextBox ID="edtDocenteFechaNacimiento" runat="server" Width="150" CssClass="axControl"></asp:TextBox>
            <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" TargetControlID="edtDocenteFechaNacimiento">
            </asp:CalendarExtender>
            <br />
            <br />
            <asp:Panel ID="pnlCUIT1" runat="server">
            <asp:Label ID="Label3" runat="server" Text="* CUIT/Pasaporte:" CssClass="axEtiqueta" Width="150"></asp:Label>
            <!-- Falta la ayuda del CUIT - CUIL -->
            <asp:TextBox ID="edtDocenteCuit" runat="server" Width="150" CssClass="axControl"></asp:TextBox>
            <br />
            <br />
            </asp:Panel>
        </div>
        <div class="div-clear"></div>
</div>

        
<span class="lbl-punto">1.2.</span> Domicilio
<% if (sgwNucleo.Usuarios.EsDocente()) { %><br /><br /><div class="div-titulo-popup-violeta" style="font-weight: normal"><b>Origen CVar</b>: Datos personales > Dirección residencial</div><br /><% } %>
<div class="div-punto">
        <div class="div-mitad">
            <asp:Label ID="Label10" runat="server" Text="* Calle:" CssClass="axEtiqueta" Width="150"></asp:Label>
            <asp:TextBox ID="edtDocenteCalle" runat="server" Width="250" CssClass="axControl"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Piso:" CssClass="axEtiqueta" Width="150"></asp:Label>
            <asp:TextBox ID="edtDocentePiso" runat="server" Width="80" CssClass="axControl"></asp:TextBox>
            <asp:Label ID="Label5" runat="server" Text="Departamento:" CssClass="axEtiqueta" Width="100">  </asp:Label>
            <asp:TextBox ID="edtDocenteDepartamento" runat="server" Width="80" CssClass="axControl"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblProvincia" runat="server" Text="* Provincia:" CssClass="axEtiqueta" Width="150"></asp:Label>
            <asp:TextBox ID="edtDocenteProvincia" runat="server" Width="250" CssClass="axControl">
            </asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label32" runat="server" Text="* Código Postal:" CssClass="axEtiqueta"
                Width="150"></asp:Label>
            <!-- Falta la ayuda del código postal -->
            <asp:TextBox ID="edtDocenteCodigoPostal" runat="server" Width="150" CssClass="axControl"></asp:TextBox>
            <br />
            <br />
        </div>
        <div class="div-mitad">
            <asp:Label ID="Label40" runat="server" Text="* Número:" CssClass="axEtiqueta" Width="150">  </asp:Label>
            <asp:TextBox ID="edtDocenteNumero" runat="server" Width="80" CssClass="axControl"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label37" runat="server" Text="* País de Residencia:" CssClass="axEtiqueta" Width="150">  </asp:Label>
            <asp:TextBox ID="edtDocentePais" runat="server" Width="250" CssClass="axControl">
            </asp:TextBox>
            <br />
            <br />
            <asp:Panel ID="pnlDepartamento" runat="server">
            <asp:Label ID="Label2" runat="server" Text="* Departamento/Partido:" CssClass="axEtiqueta" Width="150"></asp:Label>
            <asp:TextBox ID="edtDocentePartido" runat="server" Width="250" CssClass="axControl"></asp:TextBox>
            <br />
            <br />
            </asp:Panel>
            <asp:Label ID="Label8" runat="server" Text="* Localidad:" CssClass="axEtiqueta" Width="150"></asp:Label>
            <asp:TextBox ID="edtDocenteLocalidad" runat="server" Width="250" CssClass="axControl"></asp:TextBox>
            <br />
            <br />
        </div>        
        <div class="div-clear"></div>
</div>

        
<span class="lbl-punto">1.3.</span> Contacto
<div class="div-punto">
        <div class="div-mitad">
            <asp:Label ID="Label38" runat="server" Text="* Teléfono:" CssClass="axEtiqueta" Width="150"></asp:Label>
            <asp:TextBox ID="edtDocenteTelefono" runat="server" Width="250" CssClass="axControl"></asp:TextBox>
            <br />
            <br />
        </div>
        <div class="div-mitad">
            <asp:Label ID="Label41" runat="server" Text="* Correo electrónico:" CssClass="axEtiqueta"
                Width="150"></asp:Label>
            <asp:TextBox ID="edtDocenteCorreoElectronico" ReadOnly="true" runat="server" Width="250" CssClass="axControl"></asp:TextBox>
            <br />
            <br />
        </div>        
 
        <div class="div-clear">
        </div>
</div>

</asp:Panel>

</asp:Content>
