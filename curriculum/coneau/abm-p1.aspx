<%@ Page Language="C#" MasterPageFile="../abm.master" AutoEventWireup="true" CodeFile="abm-p1.aspx.cs"
    Inherits="_Default" Title="Datos personales - ATENEA | Currículum Docente" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Central" runat="server">

<h3>1. Datos personales</h3><br />


<span class="lbl-punto">1.1.</span> Información general
<div class="div-punto">

        <div class="div-mitad">
            <span class="etiqueta">Apellido:</span>
            <asp:TextBox ID="edtDocenteApellido" runat="server" Width="250" CssClass="axControl"></asp:TextBox>
            <br />
            <br />
            <span class="etiqueta">Sexo:</span>
            <asp:DropDownList ID="cmbDocenteSexo" runat="server" Width="150" CssClass="axControl">
            </asp:DropDownList>
            <br />
            <br />
            <span class="etiqueta">Documento:</span>
            <asp:DropDownList ID="cmbTipoDocumento" runat="server" Width="120" CssClass="axControl"></asp:DropDownList>
            <asp:TextBox ID="edtDocenteDocumento" runat="server" Width="120" CssClass="axControl" placeholder="Solo números"></asp:TextBox>
            <br />
            <br />
        </div>
        <div class="div-mitad">
            <span class="etiqueta">Nombres:</span>
            <asp:TextBox ID="edtDocenteNombre1" runat="server" Width="120" CssClass="axControl"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="edtDocenteNombre2" runat="server" Width="120" CssClass="axControl"></asp:TextBox>
            <br />
            <br />
            <span class="etiqueta">Fecha de nacimiento:</span>
            <asp:TextBox ID="edtDocenteFechaNacimiento" runat="server" Width="150" CssClass="axControl" placeholder="dd/mm/aaaa"></asp:TextBox>
            <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" TargetControlID="edtDocenteFechaNacimiento">
            </asp:CalendarExtender>
            <br />
            <br />
            <asp:Panel ID="pnlCUIT1" runat="server">
            <asp:Label ID="Label3" runat="server" Text="* CUIT/Pasaporte:" CssClass="axEtiqueta" Width="150"></asp:Label>
            <asp:TextBox ID="edtDocenteCuit" runat="server" Width="120" CssClass="axControl" placeholder="nn-nnnnnnnn-n"></asp:TextBox>
            <br />
            <br />
            </asp:Panel>
        </div>
        <div class="div-clear"></div>
</div>

        
<span class="lbl-punto">1.2.</span> Domicilio
<div class="div-punto">
        <div class="div-mitad">
            <asp:Label ID="Label10" runat="server" Text="* Calle:" CssClass="axEtiqueta" Width="150"></asp:Label>
            <asp:TextBox ID="edtDocenteCalle" runat="server" Width="250" CssClass="axControl"></asp:TextBox>
            <br />
            <br />
            <span class="etiqueta">Piso/departamento:</span>
            <asp:TextBox ID="edtDocentePiso" runat="server" Width="80" CssClass="axControl"></asp:TextBox>
            <asp:TextBox ID="edtDocenteDepartamento" runat="server" Width="80" CssClass="axControl"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblProvincia" runat="server" Text="* Provincia:" CssClass="axEtiqueta" Width="150"></asp:Label>
            <asp:DropDownList ID="cmbDocenteProvincia" runat="server" Width="250" CssClass="axControl" AutoPostBack="true"
            OnSelectedIndexChanged="cmbDocenteProvincia_SelectedIndexChanged">
            </asp:DropDownList>
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
            <asp:DropDownList ID="cmbDocentePais" runat="server" Width="250" CssClass="axControl" AutoPostBack="true"
            OnSelectedIndexChanged="cmbDocentePais_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Panel ID="pnlDepartamento" runat="server">
            <asp:Label ID="Label2" runat="server" Text="* Departamento/Partido:" CssClass="axEtiqueta" Width="150"></asp:Label>
            <asp:DropDownList ID="cmbDepartamento" runat="server" Width="250" CssClass="axControl">
            </asp:DropDownList>
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
            <asp:TextBox ID="edtDocenteTelefono" runat="server" Width="150" CssClass="axControl"></asp:TextBox>
            <br />
            <br />
        </div>
        <div class="div-mitad">
            <asp:Label ID="Label41" runat="server" Text="* Correo electrónico:" CssClass="axEtiqueta"
                Width="150"></asp:Label>
            <asp:TextBox ID="edtDocenteCorreoElectronico" ReadOnly="true" runat="server" Width="250" placeholder="nombre@host.com" CssClass="axControl"></asp:TextBox>
            <br />
            <span class="axEtiquetaAyuda">Puede modificar el correo electrónico desde <a href="/coneauglobal/usuarios/perfil/" target="_blank">su perfil de CONEAU Global</a>.</span><br />
            <br />
        </div>        
 
        <div class="div-clear">
        </div>
</div>



  <!-- BOTONERA GENERAL -->
    <div class="fullform-botonera-inferior">
        <asp:Button ID="btnGuardarDatosGenerales" runat="server" OnClick="btnGuardarDatosGenerales_Click" Text="Guardar" CssClass="boton boton-verde" />
        <img id="img-botonera-cargando" src="/coneauglobal/recursos/imagenes/iconos/cargando.gif" title="Cargando..." />
    </div>
    <!-- FIN BOTONERA GENERAL -->
    <div class="div-clear">
    </div>


</asp:Content>
