<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/master/sesion-docente.master" CodeFile="default.aspx.cs" Inherits="form_inicio" Title="CONEAU Global - Aplicaciones" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">

    <div class="div-mitad">
        
        <h2>Docentes</h2>

        <asp:Panel ID="pnlDocentes" runat="server" Visible="false">
        
        <!-- CURRICULUM -->
        <div class="appItem">
            <div class="appIcono">
                <a href="/docentes/curriculum/"><img src="<%= "" + sgwNucleo.Funciones.URLBase() %>coneauglobal/imagenes/aplicaciones/iconos/curriculum/icono-32.png" /></a>
            </div>
            <div class="appDesc">
                <a href="/docentes/curriculum/">Currículum docente</a><br />
                <span>Complete y actualice su currículum docente desde la web.</span><br />
                <span>Revise las vinculaciones que le realizan las instituciones.</span>
            </div>
        </div>

        </asp:Panel>

        
        <asp:Panel ID="pnlColaboradores" runat="server" Visible="false">
        
        <!-- COLABORADOR -->
        <div class="appItem">
            <div class="appIcono">
                <a href="/docentes/curriculum/colaborador.aspx"><img src="<%= "" + sgwNucleo.Funciones.URLBase() %>coneauglobal/imagenes/aplicaciones/iconos/cv-colaborador/icono-32.png" /></a>
            </div>
            <div class="appDesc">
                <a href="/docentes/curriculum/colaborador.aspx">Área del colaborador</a><br />
                <span>Complete los currículum de los docentes con los que está colaborando.</span>
            </div>
        </div>

        </asp:Panel>


        <asp:Panel ID="pnlExpertos" runat="server" Visible="false">
        <br /><div class="div-form-tituloCG" style="margin-right: 50px;">Registro de Expertos</div><br />
        
        <!-- EXPERTOS -->
        <div class="appItem">
            <div class="appIcono">
                <a href="/coneauglobal/docentes/expertos/"><img src="<%= "" + sgwNucleo.Funciones.URLBase() %>coneauglobal/imagenes/aplicaciones/iconos/agenda-agregar.png" /></a>
            </div>
            <div class="appDesc">
                <a href="/coneauglobal/docentes/expertos/">Incorporación al Registro de Expertos</a><br />
                <span>Envíe sus datos personales para evaluar su posible incorporación al Registro de Expertos de la CONEAU.</span>
            </div>
        </div>

        </asp:Panel>

    </div>
    

    <div class="div-clear"></div>

    
</asp:Content>
