<%@ Page Language="C#" MasterPageFile="../abm.master" AutoEventWireup="true" CodeFile="abm-p7.aspx.cs"
    Inherits="_Default" Title="Investigación - ATENEA | Currículum Docente" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Central" runat="server">

<h3>7. Antecedentes en investigación científico-tecnológica</h3><br />


<span class="lbl-punto">7.1.</span> Indicar su pertenencia a sistemas de promoción de la investigación científico-tecnológica.
<% if (sgwNucleo.Usuarios.EsDocente()) { %><br /><br /><div class="div-titulo-popup-violeta" style="font-weight: normal"><b>Origen CVar</b>: Cargos > Docencia > Categorización en organismos científico-tecnológicos / del programa de incentivos</div><br /><% } %>
<div class="div-punto">


    <table class="tabla-color">
        <tr>
            <td><b>CONICET</b></td>
            <td><asp:CheckBox ID="chkCONICET" runat="server" /></td>
            <asp:Panel ID="pnlCONICET" runat="server" Style="margin-top: 2px">
            <td>
                <asp:Label ID="Label50" runat="server" Text="* Categoría: " CssClass="axEtiqueta" Width="100"></asp:Label>
                <asp:TextBox ID="ddlCONICET" runat="server" Width="200px" CssClass="axControl">
                </asp:TextBox>
            </td>
            </asp:Panel>
        </tr>

        <tr>
            <td><b>Programa de Incentivos</b></td>
            <td><asp:CheckBox ID="chkIncentivos" runat="server" /></td>
            <asp:Panel ID="pnlIncentivos" runat="server" Style="margin-top: 2px">
            <td>
                <asp:Label ID="Label58" runat="server" Text="* Categoría: " CssClass="axEtiqueta" Width="100"></asp:Label>
                <asp:TextBox ID="ddlIncentivos" runat="server" Width="200px" CssClass="axControl">
                </asp:TextBox>
            </td>
            </asp:Panel>
        </tr>
    </table>

        <!-- FIN PANEL IZQUIERO -->
        <!-- PANEL DERECHO -->
        <asp:Panel ID="pnlOtros" runat="server">
            <br />
            Otras categorizaciones obtenidas.<br />
            <% if (sgwNucleo.Usuarios.EsDocente()) { %><br /><div class="div-titulo-popup-violeta" style="font-weight: normal"><b>Origen CVar</b>: Cargos > Docencia > Cargos de I+D en otro tipo de instituciones</div><% } %>
            <br />
            <!-- GRILLA ABM SISTEMAS PROMOCION OTROS -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
                <dxwgv:ASPxGridView ID="grdSistemasPromocionOtrosABM" runat="server" AutoGenerateColumns="False"
                    CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass">
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Styles CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass">
                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                        </Header>
                        <Cell VerticalAlign="Middle" Wrap="False"><Paddings Padding="8px" /></Cell>
                    </Styles>
                    <SettingsText EmptyDataRow="No hay información disponible." CommandCancel="Cancelar"
                        CommandClearFilter="Limpiar" CommandDelete="Eliminar" CommandEdit="Modificar"
                        CommandNew="Nuevo" CommandSelect="Seleccionar" CommandUpdate="Actualizar" ConfirmDelete="Eliminar"
                        CustomizationWindowCaption="Personalizar" EmptyHeaders="Vaciar encabezados" FilterBarClear="Limpiar"
                        FilterBarCreateFilter="Crear" FilterControlPopupCaption="Filtros" GroupContinuedOnNextPage="Continúa en la página siguiente"
                        GroupPanel="Arrastre una columna para agrupar por ese criterio." HeaderFilterShowAll="Mostrar todo"
                        PopupEditFormCaption="Editar" Title="Datos" />
                    <Columns>
                        <dxwgv:GridViewDataTextColumn Caption="Institución ú organismo" FieldName="organismo"></dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Categoría" FieldName="cargo"></dxwgv:GridViewDataTextColumn>
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
                    <Images ImageFolder="~/App_Themes/Glass//{0}/">
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
                    <SettingsPager>
                        <AllButton>
                            <Image Height="19px" Width="27px" />
                        </AllButton>
                        <FirstPageButton>
                            <Image Height="19px" Width="23px" />
                        </FirstPageButton>
                        <LastPageButton>
                            <Image Height="19px" Width="23px" />
                        </LastPageButton>
                        <NextPageButton>
                            <Image Height="19px" Width="19px" />
                        </NextPageButton>
                        <PrevPageButton>
                            <Image Height="19px" Width="19px" />
                        </PrevPageButton>
                    </SettingsPager>
                    <Settings ShowHeaderFilterButton="True" />
                </dxwgv:ASPxGridView>
            </div>
            <div class="div-abm-botonera-derecha">
                <asp:Button ID="btnModificarSistemaPromocionOtro" runat="server" Text="Modificar"
                    CssClass="boton boton-azul" Width="80" Height="25" OnClick="btnModificarSistemaPromocionOtro_Click" />
                <br />
                <br />
            </div>
            <!-- FIN GRILLA ABM GESTION ACADEMICA -->
            <div class="div-clear">
            </div>
        </div>
        </asp:Panel>
    </div>


<span class="lbl-punto">7.2.</span> Proyectos de investigación.
<% if (sgwNucleo.Usuarios.EsDocente()) { %><br /><br /><div class="div-titulo-popup-violeta" style="font-weight: normal"><b>Origen CVar</b>: Antecedentes > Financiamiento científico y tecnológico</div><br /><% } %>
<div class="div-punto">
        Proyectos de investigación en los que ha participado.<br />
        <!-- GRILLA ABM PROYECTOS INVESTIGACION -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
            <dxwgv:ASPxGridView ID="grdProyectosInvestigacion" runat="server" AutoGenerateColumns="False"
                CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="800px">
                <SettingsBehavior AllowFocusedRow="True" />
                <Styles CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass">
                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                    </Header>
                        <Cell VerticalAlign="Middle" Wrap="False"><Paddings Padding="8px" /></Cell>
                </Styles>
                <SettingsText EmptyDataRow="No hay información disponible." CommandCancel="Cancelar"
                    CommandClearFilter="Limpiar" CommandDelete="Eliminar" CommandEdit="Modificar"
                    CommandNew="Nuevo" CommandSelect="Seleccionar" CommandUpdate="Actualizar" ConfirmDelete="Eliminar"
                    CustomizationWindowCaption="Personalizar" EmptyHeaders="Vaciar encabezados" FilterBarClear="Limpiar"
                    FilterBarCreateFilter="Crear" FilterControlPopupCaption="Filtros" GroupContinuedOnNextPage="Continúa en la página siguiente"
                    GroupPanel="Arrastre una columna para agrupar por ese criterio." HeaderFilterShowAll="Mostrar todo"
                    PopupEditFormCaption="Editar" Title="Datos" />
                <Columns>
                    <dxwgv:GridViewCommandColumn Caption="Acciones" ButtonType="Image"><CustomButtons>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarProyectoInvestigacion"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Fecha de inicio" FieldName="fechaDesde" SortOrder="Descending"></dxwgv:GridViewDataTextColumn>                    
                    <dxwgv:GridViewDataTextColumn Caption="Fecha de finalización" FieldName="fechaHasta" ></dxwgv:GridViewDataTextColumn>                    
                    <dxwgv:GridViewDataTextColumn Caption="Título del proyecto" FieldName="titulo"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Carácter de la participación" FieldName="funcion"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Carácter de la participación" Visible="false" FieldName="descripcion"></dxwgv:GridViewDataTextColumn>
                </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarProyectoInvestigacion') { btnModificarProyectoInvestigacion_Click(); }
                }" />
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
                <Images ImageFolder="~/App_Themes/Glass//{0}/">
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
                <SettingsPager>
                    <AllButton>
                        <Image Height="19px" Width="27px" />
                    </AllButton>
                    <FirstPageButton>
                        <Image Height="19px" Width="23px" />
                    </FirstPageButton>
                    <LastPageButton>
                        <Image Height="19px" Width="23px" />
                    </LastPageButton>
                    <NextPageButton>
                        <Image Height="19px" Width="19px" />
                    </NextPageButton>
                    <PrevPageButton>
                        <Image Height="19px" Width="19px" />
                    </PrevPageButton>
                </SettingsPager>
                <Settings ShowHeaderFilterButton="True" />
            </dxwgv:ASPxGridView>
        </div>
        <script type="text/javascript">
            function btnModificarProyectoInvestigacion_Click() { $('#<%= btnModificarProyectoInvestigacion.ClientID %>')[0].click(); }
        </script>
        <div class="div-abm-botonera-derecha">
            <asp:Button ID="btnModificarProyectoInvestigacion" runat="server" Text="Modificar"
                CssClass="boton boton-azul" Width="80" Height="25" OnClick="btnModificarProyectoInvestigacion_Click" />
        </div>
        <!-- FIN GRILLA ABM PROYECTOS INVESTIGACION -->
        <div class="div-clear">
        </div>
    </div>
</div>


<span class="lbl-punto">7.3.</span> Principales productos de los últimos 5 años.
<div class="div-punto">
    <span class="lbl-punto">7.3.1.</span> Principales productos obtenidos en los siguientes tipos.
<% if (sgwNucleo.Usuarios.EsDocente()) { %><br /><br /><div class="div-titulo-popup-violeta" style="font-weight: normal"><b>Origen CVar</b>: Producción > Producción científica</div><br /><% } %>
    <div class="div-punto">
        a) Publicaciones en revistas.<br />
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
                <dxwgv:ASPxGridView ID="grdPublicacionesRevistasConArbitraje" runat="server"
                    AutoGenerateColumns="False" CssFilePath="~/App_Themes/Glass/GridView/styles.css"
                    CssPostfix="Glass" Width="800px">
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Styles CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass">
                    <Header ImageSpacing="5px" SortingImageSpacing="5px"></Header>
                        <Cell VerticalAlign="Middle" Wrap="False"><Paddings Padding="8px" /></Cell>
                    </Styles>
                    <SettingsText EmptyDataRow="No hay información disponible." CommandCancel="Cancelar"
                        CommandClearFilter="Limpiar" CommandDelete="Eliminar" CommandEdit="Modificar"
                        CommandNew="Nuevo" CommandSelect="Seleccionar" CommandUpdate="Actualizar" ConfirmDelete="Eliminar"
                        CustomizationWindowCaption="Personalizar" EmptyHeaders="Vaciar encabezados" FilterBarClear="Limpiar"
                        FilterBarCreateFilter="Crear" FilterControlPopupCaption="Filtros" GroupContinuedOnNextPage="Continúa en la página siguiente"
                        GroupPanel="Arrastre una columna para agrupar por ese criterio." HeaderFilterShowAll="Mostrar todo"
                        PopupEditFormCaption="Editar" Title="Datos" />
                    <Columns>
                    <dxwgv:GridViewCommandColumn Caption="Acciones" ButtonType="Image"><CustomButtons>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarPublicacionRevistaConArbitraje"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Tipo" FieldName="referato">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Año" FieldName="Nanio" SortOrder="Descending">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Título" VisibleIndex="2" FieldName="titulo">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Revista" VisibleIndex="3" FieldName="Nrevista">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Volumen" VisibleIndex="5" FieldName="volumen">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Página inicial" VisibleIndex="6" FieldName="paginaInicial">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Página final" VisibleIndex="6" FieldName="paginaFinal">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Resumen" VisibleIndex="6" Visible="false" FieldName="resumenOAbstract">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarPublicacionRevistaConArbitraje') { btnModificarPublicacionRevistaConArbitraje_Click(); }
                }" />
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
                    <Images ImageFolder="~/App_Themes/Glass//{0}/">
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
                    <SettingsPager>
                        <AllButton>
                            <Image Height="19px" Width="27px" />
                        </AllButton>
                        <FirstPageButton>
                            <Image Height="19px" Width="23px" />
                        </FirstPageButton>
                        <LastPageButton>
                            <Image Height="19px" Width="23px" />
                        </LastPageButton>
                        <NextPageButton>
                            <Image Height="19px" Width="19px" />
                        </NextPageButton>
                        <PrevPageButton>
                            <Image Height="19px" Width="19px" />
                        </PrevPageButton>
                    </SettingsPager>
                    <Settings ShowHeaderFilterButton="True" />
                </dxwgv:ASPxGridView>
            </div>
        <script type="text/javascript">
            function btnModificarPublicacionRevistaConArbitraje_Click() { $('#<%= btnModificarPublicacionRevistaConArbitraje.ClientID %>')[0].click(); }
        </script>
        <div class="div-abm-botonera-derecha">
                <asp:Button ID="btnModificarPublicacionRevistaConArbitraje" runat="server" Text="Modificar"
                    CssClass="boton boton-azul" Width="80" Height="25" OnClick="btnModificarPublicacionRevistaConArbitraje_Click" />
            </div>
            <!-- FIN GRILLA ABM PUBLICACIONES REVISTAS CON ARBITRAJE -->
            <div class="div-clear">
            </div>
        </div>    
            <br />
        b) Partes de libros.<br />
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
                <dxwgv:ASPxGridView ID="grdPublicacionesCapitulosLibros" runat="server" AutoGenerateColumns="False"
                    CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="800px">
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Styles CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass">
                    <Header ImageSpacing="5px" SortingImageSpacing="5px"></Header>
                        <Cell VerticalAlign="Middle" Wrap="False"><Paddings Padding="8px" /></Cell>
                    </Styles>
                    <SettingsText EmptyDataRow="No hay información disponible." CommandCancel="Cancelar"
                        CommandClearFilter="Limpiar" CommandDelete="Eliminar" CommandEdit="Modificar"
                        CommandNew="Nuevo" CommandSelect="Seleccionar" CommandUpdate="Actualizar" ConfirmDelete="Eliminar"
                        CustomizationWindowCaption="Personalizar" EmptyHeaders="Vaciar encabezados" FilterBarClear="Limpiar"
                        FilterBarCreateFilter="Crear" FilterControlPopupCaption="Filtros" GroupContinuedOnNextPage="Continúa en la página siguiente"
                        GroupPanel="Arrastre una columna para agrupar por ese criterio." HeaderFilterShowAll="Mostrar todo"
                        PopupEditFormCaption="Editar" Title="Datos" />
                    <Columns>
                    <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;Acciones&nbsp;&nbsp;" ButtonType="Image"><CustomButtons>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarPublicacionCapituloLibro"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Año" VisibleIndex="4" FieldName="anioPublicacion" SortOrder="Descending">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Tipo de parte" FieldName="tipoParteLibro">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Título de la parte" FieldName="tituloParte">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Título del libro" FieldName="tituloLibro">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Editorial" FieldName="editorial">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Lugar de impresión" FieldName="ciudadDeLaEditorial">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Páginas" FieldName="cantidadDePaginas">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Página inicial" FieldName="paginaInicial">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Página final" FieldName="paginaFinal">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Resumen" VisibleIndex="6" Visible="false" FieldName="resumen">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarPublicacionCapituloLibro') { btnModificarPublicacionCapituloLibro_Click(); }
                }" />
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
                    <Images ImageFolder="~/App_Themes/Glass//{0}/">
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
                    <SettingsPager>
                        <AllButton>
                            <Image Height="19px" Width="27px" />
                        </AllButton>
                        <FirstPageButton>
                            <Image Height="19px" Width="23px" />
                        </FirstPageButton>
                        <LastPageButton>
                            <Image Height="19px" Width="23px" />
                        </LastPageButton>
                        <NextPageButton>
                            <Image Height="19px" Width="19px" />
                        </NextPageButton>
                        <PrevPageButton>
                            <Image Height="19px" Width="19px" />
                        </PrevPageButton>
                    </SettingsPager>
                    <Settings ShowHeaderFilterButton="True" />
                </dxwgv:ASPxGridView>
            </div>
        <script type="text/javascript">
            function btnModificarPublicacionCapituloLibro_Click() { $('#<%= btnModificarPublicacionCapituloLibro.ClientID %>')[0].click(); }
        </script>
        <div class="div-abm-botonera-derecha">
                <asp:Button ID="btnModificarPublicacionCapituloLibro" runat="server" Text="Modificar"
                    CssClass="boton boton-azul" Width="80" Height="25" OnClick="btnModificarPublicacionCapituloLibro_Click" />
            </div>
            <!-- FIN GRILLA ABM PUBLICACIONES CAPITULOS LIBROS -->
            <div class="div-clear">
            </div>
        </div>    
            <br />
        c) Libros.<br />
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
                <dxwgv:ASPxGridView ID="grdPublicacionesLibros" runat="server" AutoGenerateColumns="False"
                    CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="800px">
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Styles CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass">
                    <Header ImageSpacing="5px" SortingImageSpacing="5px"></Header>
                        <Cell VerticalAlign="Middle" Wrap="False"><Paddings Padding="8px" /></Cell>
                    </Styles>
                    <SettingsText EmptyDataRow="No hay información disponible." CommandCancel="Cancelar"
                        CommandClearFilter="Limpiar" CommandDelete="Eliminar" CommandEdit="Modificar"
                        CommandNew="Nuevo" CommandSelect="Seleccionar" CommandUpdate="Actualizar" ConfirmDelete="Eliminar"
                        CustomizationWindowCaption="Personalizar" EmptyHeaders="Vaciar encabezados" FilterBarClear="Limpiar"
                        FilterBarCreateFilter="Crear" FilterControlPopupCaption="Filtros" GroupContinuedOnNextPage="Continúa en la página siguiente"
                        GroupPanel="Arrastre una columna para agrupar por ese criterio." HeaderFilterShowAll="Mostrar todo"
                        PopupEditFormCaption="Editar" Title="Datos" />
                    <Columns>
                    <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;Acciones&nbsp;&nbsp;" ButtonType="Image"><CustomButtons>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarPublicacionLibro"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Año" VisibleIndex="4" FieldName="anioPublicacion" SortOrder="Descending">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Título del libro" FieldName="titulo">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Editorial" FieldName="editorial">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Lugar de impresión" FieldName="ciudadDeLaEditorial">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Páginas" FieldName="cantidadPaginas">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Resumen" VisibleIndex="6" Visible="false" FieldName="resumen">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarPublicacionLibro') { btnModificarPublicacionLibro_Click(); }
                }" />
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
                    <Images ImageFolder="~/App_Themes/Glass//{0}/">
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
                    <SettingsPager>
                        <AllButton>
                            <Image Height="19px" Width="27px" />
                        </AllButton>
                        <FirstPageButton>
                            <Image Height="19px" Width="23px" />
                        </FirstPageButton>
                        <LastPageButton>
                            <Image Height="19px" Width="23px" />
                        </LastPageButton>
                        <NextPageButton>
                            <Image Height="19px" Width="19px" />
                        </NextPageButton>
                        <PrevPageButton>
                            <Image Height="19px" Width="19px" />
                        </PrevPageButton>
                    </SettingsPager>
                    <Settings ShowHeaderFilterButton="True" />
                </dxwgv:ASPxGridView>
            </div>
        <script type="text/javascript">
            function btnModificarPublicacionLibro_Click() { $('#<%= btnModificarPublicacionLibro.ClientID %>')[0].click(); }
        </script>
        <div class="div-abm-botonera-derecha">
                <asp:Button ID="btnModificarPublicacionLibro" runat="server" Text="Modificar" CssClass="boton boton-azul"
                    Width="80" Height="25" OnClick="btnModificarPublicacionLibro_Click" />
            </div>
            <!-- FIN GRILLA ABM PUBLICACIONES LIBROS -->
            <div class="div-clear">
            </div>
        </div>    
            <br />
        
    </div>    

    <span class="lbl-punto">7.3.2.</span> Resultados pasibles de ser protegidos a través de instrumentos de propiedad
            intelectual como patentes, derechos de autor, etc., y desarrollos que no pueden
            ser protegidos por instrumentos de propiedad intelectual como las tecnologías organizacionales
            u otros.
    <% if (sgwNucleo.Usuarios.EsDocente()) { %><br /><br /><div class="div-titulo-popup-violeta" style="font-weight: normal"><b>Origen CVar</b>: Producción > Producción tecnológica</div><br /><% } %>
    <div class="div-punto">
            a) Títulos de propiedad intelectual.<br />
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
                <dxwgv:ASPxGridView ID="grdProductosProtegidos" runat="server" AutoGenerateColumns="False"
                    CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="800px">
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Styles CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass">
                    <Header ImageSpacing="5px" SortingImageSpacing="5px"></Header>
                        <Cell VerticalAlign="Middle" Wrap="False"><Paddings Padding="8px" /></Cell>
                    </Styles>
                    <SettingsText EmptyDataRow="No hay información disponible." CommandCancel="Cancelar"
                        CommandClearFilter="Limpiar" CommandDelete="Eliminar" CommandEdit="Modificar"
                        CommandNew="Nuevo" CommandSelect="Seleccionar" CommandUpdate="Actualizar" ConfirmDelete="Eliminar"
                        CustomizationWindowCaption="Personalizar" EmptyHeaders="Vaciar encabezados" FilterBarClear="Limpiar"
                        FilterBarCreateFilter="Crear" FilterControlPopupCaption="Filtros" GroupContinuedOnNextPage="Continúa en la página siguiente"
                        GroupPanel="Arrastre una columna para agrupar por ese criterio." HeaderFilterShowAll="Mostrar todo"
                        PopupEditFormCaption="Editar" Title="Datos" />
                    <Columns>
                        <dxwgv:GridViewDataTextColumn Caption="Fecha de solicitud" FieldName="fechaSolicitud" SortOrder="Descending"></dxwgv:GridViewDataTextColumn>                    
                        <dxwgv:GridViewDataTextColumn Caption="Fecha de otorgamiento" FieldName="fechaConcesionDesde"></dxwgv:GridViewDataTextColumn>                    
                        <dxwgv:GridViewDataTextColumn Caption="Desarrollo o producto" FieldName="titulo"></dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Titular" FieldName="titulares"></dxwgv:GridViewDataTextColumn>
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
                    <Images ImageFolder="~/App_Themes/Glass//{0}/">
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
                    <SettingsPager>
                        <AllButton>
                            <Image Height="19px" Width="27px" />
                        </AllButton>
                        <FirstPageButton>
                            <Image Height="19px" Width="23px" />
                        </FirstPageButton>
                        <LastPageButton>
                            <Image Height="19px" Width="23px" />
                        </LastPageButton>
                        <NextPageButton>
                            <Image Height="19px" Width="19px" />
                        </NextPageButton>
                        <PrevPageButton>
                            <Image Height="19px" Width="19px" />
                        </PrevPageButton>
                    </SettingsPager>
                    <Settings ShowHeaderFilterButton="True" />
                </dxwgv:ASPxGridView>
            </div>
        <div class="div-abm-botonera-derecha">
                <asp:Button ID="btnModificarProductoProtegido" runat="server" Text="Modificar" CssClass="boton boton-azul"
                    Width="80" Height="25" OnClick="btnModificarProductoProtegido_Click" />
            </div>
            <!-- FIN GRILLA ABM PRODUCTOS PROTEGIDOS -->
            <div class="div-clear">
            </div>
        </div>    
            <br />
            b) Desarrollos no pasibles de ser protegidos por títulos de propiedad intelectual.<br />
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
                <dxwgv:ASPxGridView ID="grdProductosNoProtegidos" runat="server" AutoGenerateColumns="False"
                    CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="800px">
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Styles CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass">
                    <Header ImageSpacing="5px" SortingImageSpacing="5px"></Header>
                        <Cell VerticalAlign="Middle" Wrap="False"><Paddings Padding="8px" /></Cell>
                    </Styles>
                    <SettingsText EmptyDataRow="No hay información disponible." CommandCancel="Cancelar"
                        CommandClearFilter="Limpiar" CommandDelete="Eliminar" CommandEdit="Modificar"
                        CommandNew="Nuevo" CommandSelect="Seleccionar" CommandUpdate="Actualizar" ConfirmDelete="Eliminar"
                        CustomizationWindowCaption="Personalizar" EmptyHeaders="Vaciar encabezados" FilterBarClear="Limpiar"
                        FilterBarCreateFilter="Crear" FilterControlPopupCaption="Filtros" GroupContinuedOnNextPage="Continúa en la página siguiente"
                        GroupPanel="Arrastre una columna para agrupar por ese criterio." HeaderFilterShowAll="Mostrar todo"
                        PopupEditFormCaption="Editar" Title="Datos" />
                    <Columns>
                        <dxwgv:GridViewDataTextColumn Caption="Producto" FieldName="produccion" SortIndex="0" SortOrder="Ascending">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Descripción" FieldName="descripcion">
                        </dxwgv:GridViewDataTextColumn>
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
                    <Images ImageFolder="~/App_Themes/Glass//{0}/">
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
                    <SettingsPager>
                        <AllButton>
                            <Image Height="19px" Width="27px" />
                        </AllButton>
                        <FirstPageButton>
                            <Image Height="19px" Width="23px" />
                        </FirstPageButton>
                        <LastPageButton>
                            <Image Height="19px" Width="23px" />
                        </LastPageButton>
                        <NextPageButton>
                            <Image Height="19px" Width="19px" />
                        </NextPageButton>
                        <PrevPageButton>
                            <Image Height="19px" Width="19px" />
                        </PrevPageButton>
                    </SettingsPager>
                    <Settings ShowHeaderFilterButton="True" />
                </dxwgv:ASPxGridView>
            </div>
        <div class="div-abm-botonera-derecha">
                <asp:Button ID="btnModificarProductoNoProtegido" runat="server" Text="Modificar"
                    CssClass="boton boton-azul" Width="80" Height="25" OnClick="btnModificarProductoNoProtegido_Click" />
            </div>
            <!-- FIN GRILLA ABM PRODUCTOS NO PROTEGIDOS -->
            <div class="div-clear">
            </div>
        </div>
    </div>  
</div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="Popup" runat="server">    

    <!-- POPUP SISTEMAS PROMOCION OTROS -->
    <dxpc:ASPxPopupControl ID="popSistemasPromocionOtros" runat="server" CloseAction="CloseButton"
        Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popup" HeaderText="Agregar/Modificar otras categorías" AllowDragging="True"
        EnableAnimation="True" EnableViewState="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
        CssPostfix="Glass" ImageFolder="~/App_Themes/Glass/{0}/" EnableHierarchyRecreation="False">
        <SizeGripImage Height="12px" Width="12px" />
        <CloseButtonImage Height="17px" Width="17px" />
        <HeaderStyle Font-Bold="True">
            <Paddings PaddingLeft="10px" PaddingRight="6px" PaddingTop="1px" />
        </HeaderStyle>
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <!-- DETALLE -->
                <div class="divPopup">
                    <div class="div-form-cuadroPopup">
                        <asp:Label ID="Label1" runat="server" Text="* Institución ú organismo: " CssClass="axEtiqueta" Width="200"></asp:Label>
                        <asp:TextBox ID="cmbSistemasPromocionOtrosInstitucion" runat="server" Width="400" CssClass="axControl"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label28" runat="server" Text="Categoría: " CssClass="axEtiqueta" Width="200"></asp:Label>
                        <asp:TextBox ID="edtSistemasPromocionOtrosCategoria" runat="server" CssClass="axControl"
                            Width="400px"></asp:TextBox>
                        <br />
                        <br />
                    </div>
                </div>
                <!-- FIN DETALLE -->
                <!-- BOTONERA -->
                <div class="botonera-inferior-der">
                    <asp:Button ID="btnCancelarSistemaPromocionOtro" runat="server" Text="Cancelar" CssClass="boton boton-rojo"
                        Width="90" Height="25" OnClick="btnCancelarSistemaPromocionOtro_Click" />
                </div>
                <!-- FIN BOTONERA -->
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP SISTEMAS PROMOCION OTROS -->
    
    
    <!-- POPUP PROYECTOS INVESTIGACION -->
    <dxpc:ASPxPopupControl ID="popProyectosInvestigacion" runat="server" CloseAction="CloseButton"
        Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popup" HeaderText="Agregar/Modificar proyectos de investigación"
        AllowDragging="True" EnableAnimation="True" EnableViewState="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
        CssPostfix="Glass" ImageFolder="~/App_Themes/Glass/{0}/" EnableHierarchyRecreation="False">
        <SizeGripImage Height="12px" Width="12px" />
        <CloseButtonImage Height="17px" Width="17px" />
        <HeaderStyle Font-Bold="True">
            <Paddings PaddingLeft="10px" PaddingRight="6px" PaddingTop="1px" />
        </HeaderStyle>
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <!-- DETALLE -->
                <div class="divPopup" style="width:700px">
                    <div class="div-form-cuadroPopup">
                        <asp:Label ID="Label5" runat="server" Text="Título del proyecto: " CssClass="axEtiqueta"
                            Width="200"></asp:Label>
                        <asp:TextBox ID="edtProyectosInvestigacionTituloProyecto" runat="server" CssClass="axControl"
                            Width="400px"></asp:TextBox>
                        <br />
                        <br />
                        <div class="div-mitad" style="width: 60%">
                            <asp:Label ID="Label8" runat="server" Text="* Fecha de inicio: " CssClass="axEtiqueta"
                                Width="200"></asp:Label>
                            <asp:TextBox ID="edtProyectosInvestigacionFechaInicio" runat="server" CssClass="axControl"
                                Width="100"></asp:TextBox>
                        </div>
                        <div class="div-mitad" style="width: 40%">
                            <asp:Label ID="Label43" runat="server" Text="Fecha de finalización: " CssClass="axEtiqueta"
                                Width="150"></asp:Label>
                            <asp:TextBox ID="edtProyectosInvestigacionFechaFinalizacion" runat="server" CssClass="axControl"
                                Width="100"></asp:TextBox>
                        </div>
                        <div class="div-clear"></div>
                        <br />
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Participación: " CssClass="axEtiqueta"
                            Width="200"></asp:Label>
                        <asp:TextBox ID="edtProyectosInvestigacionCaracterParticipacion" runat="server" CssClass="axControl"
                            Width="200"></asp:TextBox>
                        <!-- FIN RADIOBUTTON CARACTER PARTICIPACION -->
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="Label17" runat="server" Text="* Descripción del proyecto: " Style="autosize"
                            CssClass="axEtiqueta"></asp:Label>
                        <br />
                        <asp:TextBox ID="edtProyectosInvestigacionPrincipalesResultados" runat="server" TextMode="MultiLine"
                            Style="max-width: 100%; margin-top:6px" Width="100%" CssClass="axControl"></asp:TextBox>
                        <br />
                    </div>
                </div>
                <!-- FIN DETALLE -->
                <!-- BOTONERA -->
                <div class="botonera-inferior-der">
                    <asp:Button ID="btnCancelarProyectoInvestigacion" runat="server" Text="Cancelar"
                        CssClass="boton boton-rojo" Width="90" Height="25" OnClick="btnCancelarProyectoInvestigacion_Click" />
                </div>
                <!-- FIN BOTONERA -->
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP PROYECTOS INVESTIGACION -->
    

        
        
        <!-- POPUP PUBLICACIONES REVISTAS CON ARBITRAJE -->
        <dxpc:ASPxPopupControl ID="popPublicacionesRevistasConArbitraje" runat="server" CloseAction="CloseButton"
            Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
            ClientInstanceName="popup" HeaderText="Agregar/Modificar publicaciones en revistas"            
            AllowDragging="True" EnableAnimation="True" EnableViewState="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
            CssPostfix="Glass" ImageFolder="~/App_Themes/Glass/{0}/" EnableHierarchyRecreation="False">
            <SizeGripImage Height="12px" Width="12px" />
            <CloseButtonImage Height="17px" Width="17px" />
            <HeaderStyle Font-Bold="True">
                <Paddings PaddingLeft="10px" PaddingRight="6px" PaddingTop="1px" />
            </HeaderStyle>
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
                    <!-- DETALLE -->
                    <div class="divPopup">
                        <div class="div-form-cuadroPopup">
                            <asp:Label ID="Label25" runat="server" Text="* Título: " CssClass="axEtiqueta"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasConArbitrajeTitulo" runat="server" CssClass="axControl"
                                Width="100%" Style="max-width: 100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label26" runat="server" Text="* Revista: " CssClass="axEtiqueta"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasConArbitrajeRevista" runat="server" CssClass="axControl"
                                Width="100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label3" runat="server" Text="* Tipo: " CssClass="axEtiqueta"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasConArbitrajeTipo" runat="server" CssClass="axControl"
                                Width="100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label27" runat="server" Text="* Año: " CssClass="axEtiqueta" Width="120"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasConArbitrajeAnio" runat="server" CssClass="axControl"
                                Width="50px"></asp:TextBox>
                            <asp:Label ID="Label7" runat="server" Text="* Volumen: " CssClass="axEtiqueta" Width="120"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasConArbitrajeVolumen" runat="server" CssClass="axControl"
                                Width="50px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label29" runat="server" Text="* Página inicial: " CssClass="axEtiqueta" Width="150"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasConArbitrajePaginas" runat="server" CssClass="axControl"
                                Width="100"></asp:TextBox>
                            <asp:Label ID="Label4" runat="server" Text="* Página final: " CssClass="axEtiqueta" Width="150"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasConArbitrajePaginas2" runat="server" CssClass="axControl"
                                Width="100"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label6" runat="server" Text="* Resumen: " CssClass="axEtiquetaIzq" Width="150"></asp:Label>
                            <br />
                            <asp:TextBox ID="edtPublicacionesRevistasConArbitrajeResumen" runat="server" CssClass="axControl"
                                Width="100%" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <!-- FIN DETALLE -->
                    <br />
                    <!-- BOTONERA -->
                    <div class="botonera-inferior-der">
                        <asp:Button ID="btnCancelarPublicacionRevistaConArbitraje" runat="server" Text="Cancelar"
                            CssClass="boton boton-rojo" Width="90" Height="25" OnClick="btnCancelarPublicacionRevistaConArbitraje_Click" />
                    </div>
                    <!-- FIN BOTONERA -->
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>
        <!-- FIN POPUP PUBLICACIONES REVISTAS CON ARBITRAJE -->
        
        
        
        
        <!-- POPUP PUBLICACIONES CAPITULOS LIBROS -->
        <dxpc:ASPxPopupControl ID="popPublicacionesCapitulosLibros" runat="server" CloseAction="CloseButton"
            Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
            ClientInstanceName="popup" HeaderText="Agregar/Modificar partes de libros" AllowDragging="True"
            EnableAnimation="True" EnableViewState="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
            CssPostfix="Glass" ImageFolder="~/App_Themes/Glass/{0}/" EnableHierarchyRecreation="False">
            <SizeGripImage Height="12px" Width="12px" />
            <CloseButtonImage Height="17px" Width="17px" />
            <HeaderStyle Font-Bold="True">
                <Paddings PaddingLeft="10px" PaddingRight="6px" PaddingTop="1px" />
            </HeaderStyle>
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl5" runat="server">
                    <!-- DETALLE -->
                    <div class="divPopup">
                        <div class="div-form-cuadroPopup">
                            <asp:Label ID="Label42" runat="server" Text="* Tipo de parte: " CssClass="axEtiquetaIzq"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesCapitulosLibrosEditoresLibros" runat="server" CssClass="axControl"
                                Width="100%" Style="max-width: 100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label40" runat="server" Text="* Título de la parte: " CssClass="axEtiquetaIzq"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesCapitulosLibrosTituloCapitulo" runat="server" CssClass="axControl"
                                Width="100%" Style="max-width: 100%; margin-top:2px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label41" runat="server" Text="* Título del libro: " CssClass="axEtiquetaIzq"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesCapitulosLibrosTituloLibro" runat="server" CssClass="axControl"
                                Width="100%" Style="max-width: 100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label44" runat="server" Text="* Editorial: " CssClass="axEtiquetaIzq"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesCapitulosLibrosEditorial" runat="server" CssClass="axControl"
                                Width="100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label45" runat="server" Text="Lugar de impresión: " CssClass="axEtiquetaIzq"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesCapitulosLibrosLugarImpresion" runat="server" CssClass="axControl"
                                Width="100%" Style="margin-top:2px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label46" runat="server" Text="* Año: " CssClass="axEtiqueta" Width="160"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesCapitulosLibrosAnio" runat="server" CssClass="axControl"
                                Width="50px"></asp:TextBox>
                            <asp:Label ID="Label47" runat="server" Text="* Páginas: " CssClass="axEtiqueta" Width="160"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesCapitulosLibrosPaginas" runat="server" CssClass="axControl"
                                Width="120px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label12" runat="server" Text="* Resumen: " CssClass="axEtiquetaIzq" Width="150"></asp:Label>
                            <br />
                            <asp:TextBox ID="edtPublicacionesCapitulosLibrosResumen" runat="server" CssClass="axControl"
                                Width="100%" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <!-- FIN DETALLE -->
                    <br />
                    <!-- BOTONERA -->
                    <div class="botonera-inferior-der">
                        <asp:Button ID="btnCancelarPublicacionCapituloLibro" runat="server" Text="Cancelar"
                            CssClass="boton boton-rojo" Width="90" Height="25" OnClick="btnCancelarPublicacionCapituloLibro_Click" />
                    </div>
                    <!-- FIN BOTONERA -->
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>
        <!-- FIN POPUP PUBLICACIONES CAPITULOS LIBROS -->
        
        
        <!-- POPUP PUBLICACIONES LIBROS -->
        <dxpc:ASPxPopupControl ID="popPublicacionesLibros" runat="server" CloseAction="CloseButton"
            Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
            ClientInstanceName="popup" HeaderText="Agregar/Modificar libros" AllowDragging="True"
            EnableAnimation="True" EnableViewState="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
            CssPostfix="Glass" ImageFolder="~/App_Themes/Glass/{0}/" EnableHierarchyRecreation="False">
            <SizeGripImage Height="12px" Width="12px" />
            <CloseButtonImage Height="17px" Width="17px" />
            <HeaderStyle Font-Bold="True">
                <Paddings PaddingLeft="10px" PaddingRight="6px" PaddingTop="1px" />
            </HeaderStyle>
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl6" runat="server">
                    <!-- DETALLE -->
                    <div class="divPopup">
                        <div class="div-form-cuadroPopup">
                            <asp:Label ID="Label10" runat="server" Text="* Título del libro: " CssClass="axEtiquetaIzq"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesLibrosTituloLibro" runat="server" CssClass="axControl"
                                Width="100%" Style="max-width: 100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label51" runat="server" Text="* Editorial: " CssClass="axEtiquetaIzq"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesLibrosEditorial" runat="server" CssClass="axControl"
                                Width="100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label52" runat="server" Text="Lugar de impresión: " CssClass="axEtiquetaIzq"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesLibrosLugarImpresion" runat="server" CssClass="axControl"
                                Width="100%" Style="margin-top:2px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label53" runat="server" Text="* Año: " CssClass="axEtiqueta" Width="160"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesLibrosAnio" runat="server" CssClass="axControl"
                                Width="50px"></asp:TextBox>
                            <asp:Label ID="Label54" runat="server" Text="* Páginas: " CssClass="axEtiqueta" Width="160"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesLibrosPaginas" runat="server" CssClass="axControl"
                                Width="120px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label9" runat="server" Text="* Resumen: " CssClass="axEtiquetaIzq" Width="150"></asp:Label>
                            <br />
                            <asp:TextBox ID="edtPublicacionesLibrosResumen" runat="server" CssClass="axControl"
                                Width="100%" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <!-- FIN DETALLE -->
                    <br />
                    <!-- BOTONERA -->
                    <div class="botonera-inferior-der">
                        <asp:Button ID="btnCancelarPublicacionLibro" runat="server" Text="Cancelar" CssClass="boton boton-rojo"
                            Width="90" Height="25" OnClick="btnCancelarPublicacionLibro_Click" />
                    </div>
                    <!-- FIN BOTONERA -->
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>
        <!-- FIN POPUP PUBLICACIONES LIBROS -->
        
        
        
        <!-- POPUP PRODUCTOS PROTEGIDOS -->
        <dxpc:ASPxPopupControl ID="popProductosProtegidos" runat="server" CloseAction="CloseButton"
            Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
            ClientInstanceName="popup" HeaderText="Agregar/Modificar títulos de propiedad intelectual"
            AllowDragging="True" EnableAnimation="True" EnableViewState="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
            CssPostfix="Glass" ImageFolder="~/App_Themes/Glass/{0}/" EnableHierarchyRecreation="False">
            <SizeGripImage Height="12px" Width="12px" />
            <CloseButtonImage Height="17px" Width="17px" />
            <HeaderStyle Font-Bold="True">
                <Paddings PaddingLeft="10px" PaddingRight="6px" PaddingTop="1px" />
            </HeaderStyle>
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl8" runat="server">
                    <!-- DETALLE -->
                    <div class="divPopup">
                        <div class="div-form-cuadroPopup">
                            <asp:Label ID="Label62" runat="server" Text="* Tipo, desarrollo o producto: " CssClass="axEtiquetaIzq"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtProductosProtegidosDesarrollo" runat="server" CssClass="axControl"
                                Width="100%" Style="max-width: 100%; margin-top:2px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label63" runat="server" Text="* Titular: " CssClass="axEtiquetaIzq"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtProductosProtegidosTitular" runat="server" CssClass="axControl"
                                Width="100%"></asp:TextBox>
                            <br />
                            <br />
                            <div class="div-mitad">
                                <asp:Label ID="Label64" runat="server" Text="* Fecha de solicitud: " CssClass="axEtiqueta"></asp:Label>
                                <asp:TextBox ID="edtProductosProtegidosFechaSolicitud" runat="server" CssClass="axControl"
                                    Width="100px"></asp:TextBox>
                            </div>
                            <div class="div-mitad" style="text-align:right">
                                <asp:Label ID="Label65" runat="server" Text="Fecha de otorgamiento: " CssClass="axEtiqueta"
                                    Width="200"></asp:Label>
                                <asp:TextBox ID="edtProductosProtegidosFechaOtorgamiento" runat="server" CssClass="axControl"
                                    Width="100px" ></asp:TextBox>
                            </div>
                            <div class="div-clear"></div>
                        </div>
                    </div>
                    <!-- FIN DETALLE -->
                    <br />
                    <!-- BOTONERA -->
                    <div class="botonera-inferior-der">
                        <asp:Button ID="btnCancelarProductoProtegido" runat="server" Text="Cancelar" CssClass="boton boton-rojo"
                            Width="90" Height="25" OnClick="btnCancelarProductoProtegido_Click" />
                    </div>
                    <!-- FIN BOTONERA -->
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>
        <!-- FIN POPUP PRODUCTOS PROTEGIDOS -->
        
        
        <!-- POPUP PRODUCTOS NO PROTEGIDOS -->
        <dxpc:ASPxPopupControl ID="popProductosNoProtegidos" runat="server" CloseAction="CloseButton"
            Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
            ClientInstanceName="popup" HeaderText="Agregar/Modificar otros desarrollos" AllowDragging="True"
            EnableAnimation="True" EnableViewState="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
            CssPostfix="Glass" ImageFolder="~/App_Themes/Glass/{0}/" EnableHierarchyRecreation="False">
            <SizeGripImage Height="12px" Width="12px" />
            <CloseButtonImage Height="17px" Width="17px" />
            <HeaderStyle Font-Bold="True">
                <Paddings PaddingLeft="10px" PaddingRight="6px" PaddingTop="1px" />
            </HeaderStyle>
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl9" runat="server">
                    <!-- DETALLE -->
                    <div class="divPopup">
                        <div class="div-form-cuadroPopup">
                            <asp:Label ID="Label66" runat="server" Text="* Producto: " CssClass="axEtiquetaIzq"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtProductosNoProtegidosProducto" runat="server" CssClass="axControl"
                                Width="100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label67" runat="server" Text="* Descripción: " CssClass="axEtiquetaIzq"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtProductosNoProtegidosDescripcion" runat="server" CssClass="axControl"
                                Width="100%" Style="max-width: 100%; margin-top:2px" TextMode="MultiLine"></asp:TextBox>
                            <br />
                            <br />
                        </div>
                    </div>
                    <!-- FIN DETALLE -->
                    <br />
                    <!-- BOTONERA -->
                    <div class="botonera-inferior-der">
                        <asp:Button ID="btnCancelarProductoNoProtegido" runat="server" Text="Cancelar" CssClass="boton boton-rojo"
                            Width="90" Height="25" OnClick="btnCancelarProductoNoProtegido_Click" />
                    </div>
                    <!-- FIN BOTONERA -->
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>
        <!-- FIN POPUP PRODUCTOS NO PROTEGIDOS -->
        
        

</asp:Content>