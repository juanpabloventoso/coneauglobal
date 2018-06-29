<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="base.master" CodeFile="colaborador.aspx.cs" Inherits="form_inicio" Title="CONEAU Global | Área del colaborador" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Cabecera" runat="server">
Área del colaborador
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">

<div style="padding: 6px">


    <h2 style="color: #333"><asp:Label ID="lblBienvenido" runat="server" Text="Bienvenido" CssClass="lblTitulo"></asp:Label></h2>
    <br />


        
    <asp:Panel ID="pnlVinculacion" runat="server">
        <div class="div-cuadro">
        <h3>Currículums asignados</h3>
        <br />
        La siguiente lista muestra los docentes que lo han asignado como colaborador.<br />
        Haga clic en <b>Abrir currículum</b> para trabajar con los datos del docente seleccionado.<br />
        <br />
        <b>Nota</b>: Sólamente podrá colaborar con aquellos docentes que trabajen con el currículum CONEAU. Los docentes CVar pueden configurar esta opción desde el mismo sistema CVar.
        <br />
        <br />
        <div class="div-contenedor-grilla">
        <dxwgv:ASPxGridView ID="grdCurriculums" runat="server" AutoGenerateColumns="False" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
            CssPostfix="Glass" Width="100%" KeyFieldName="ID_DOCENTES" SettingsLoadingPanel-Text="Cargando&hellip;" >
            <SettingsBehavior AllowFocusedRow="True" />
            <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                    </Header>
                    <Cell VerticalAlign="Middle" Wrap="False">
                        <Paddings Padding="8px" />
                    </Cell>
            </Styles>
            <SettingsText EmptyDataRow="No hay vinculaciones externas realizadas." CommandCancel="Cancelar"
                CommandClearFilter="Limpiar" CommandDelete="Eliminar" CommandEdit="Modificar"
                CommandNew="Nuevo" CommandSelect="Seleccionar" CommandUpdate="Actualizar" ConfirmDelete="Eliminar"
                CustomizationWindowCaption="Personalizar" EmptyHeaders="Vaciar encabezados" FilterBarClear="Limpiar"
                FilterBarCreateFilter="Crear" FilterControlPopupCaption="Filtros" GroupContinuedOnNextPage="Continúa en la página siguiente"
                GroupPanel="Arrastre una columna para agrupar por ese criterio." HeaderFilterShowAll="Mostrar todo"
                PopupEditFormCaption="Editar" Title="Datos" />
            <Columns>
                <dxwgv:GridViewDataTextColumn Caption="Identificador" Visible="false" FieldName="ID_DOCENTES"></dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Apellido" FieldName="APELLIDO" SortIndex="0" SortOrder="Ascending"></dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Primer nombre" FieldName="PRIMER_NOMBRE"></dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Segundo nombre" FieldName="SEGUNDO_NOMBRE"></dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Correo electrónico" FieldName="CORREO_ELECTRONICO"></dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="CUIT" FieldName="CUIT"></dxwgv:GridViewDataTextColumn>
            </Columns>
                <SettingsPager PageSize="10" SEOFriendly="CrawlerOnly">
                    <AllButton>
                        <Image Height="19px" Width="27px"></Image>
                    </AllButton>
                    <FirstPageButton>
                        <Image Height="19px" Width="23px"></Image>
                    </FirstPageButton>
                    <LastPageButton>
                        <Image Height="19px" Width="23px"></Image>
                    </LastPageButton>
                    <NextPageButton>
                        <Image Height="19px" Width="19px"></Image>
                    </NextPageButton>
                    <PrevPageButton>
                        <Image Height="19px" Width="19px"></Image>
                    </PrevPageButton>
                    <Summary AllPagesText="Páginas: {0} - {1} ({2} items)" Text="Página {0} de {1} ({2} ítems)" />
                </SettingsPager>
            <Images ImageFolder="~/App_Themes/Glass/{0}/">
                <CollapsedButton Height="12px" Width="11px" />
                <DetailCollapsedButton Height="9px" Width="9px" />
                <HeaderFilter Height="18px" Url="~/App_Themes/Glass//GridView/gvHeaderFilter.png"
                    Width="18px" />
                <HeaderActiveFilter Height="18px" Url="~/App_Themes/Glass//GridView/gvHeaderFilterActive.png"
                    Width="18px" />
                <FilterRowButton Height="13px" Width="13px" />
                <CustomizationWindowClose Height="17px" Width="17px" />
                <PopupEditFormWindowClose Height="17px" Width="17px" />
                <FilterBuilderClose Height="17px" Width="17px" />
            </Images>
            <Settings ShowHeaderFilterButton="True" />
        </dxwgv:ASPxGridView>
        <br />
            <asp:Button ID="btnAbrirFicha" runat="server" 
            Text="Abrir currículum" CssClass="boton boton-verde" onclick="btnAbrirFicha_Click" />   
        </div>
        </div>
    </asp:Panel>

    
</div>

</asp:Content>
