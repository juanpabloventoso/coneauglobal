<%@ Page Language="C#" MasterPageFile="../abm.master" AutoEventWireup="true" CodeFile="abm-p2.aspx.cs"
    Inherits="_Default" Title="Formación - ATENEA | Currículum Docente" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Central" runat="server">

<h3>2. Formación</h3><br />


<div class="div-punto">
    <asp:Label ID="Label27" runat="server" Text="Título máximo obtenido: " CssClass="axEtiqueta"></asp:Label>
    <asp:TextBox ID="edtDocenteTituloMaximo" runat="server" Width="150" CssClass="axControl"
        ReadOnly="true"></asp:TextBox>
    <br />
    <span class="axEtiquetaAyuda">El título máximo se obtiene a partir de la información de los puntos 2.1, 2.2 y 2.3.</span>
    <br />
</div>



<span class="lbl-punto">2.1.</span> Títulos de grado.
<% if (sgwNucleo.Usuarios.EsDocente()) { %><br /><br /><div class="div-titulo-popup-violeta" style="font-weight: normal"><b>Origen CVar</b>: Formación académica > Nivel universitario de grado</div><br /><% } %>
<div class="div-punto">
        <!-- GRILLA ABM TITULOS POSGRADO -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
            <dxwgv:ASPxGridView ID="grdTitulosGrado" runat="server" AutoGenerateColumns="False"
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
                    <dxwgv:GridViewDataTextColumn Caption="Título" VisibleIndex="1" FieldName="titulo">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Año de obtención" VisibleIndex="2" FieldName="fechaEgreso" SortIndex="0" SortOrder="Descending"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución" VisibleIndex="2" FieldName="institucion" SortIndex="0" SortOrder="Descending"></dxwgv:GridViewDataTextColumn>
                </Columns>
                <SettingsPager PageSize="5" SEOFriendly="CrawlerOnly">
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
           
            <asp:Button ID="Button8" runat="server" Text="Modificar" CssClass="boton boton-azul"
                Width="80" Height="25" OnClick="btnModificarTituloGrado_Click" />
           
        </div>
        <!-- FIN GRILLA ABM TITULOS POSGRADO -->
        <div class="div-clear">
        </div>
    </div>
    </div>

<span class="lbl-punto">2.2.</span> Títulos de posgrado.
<% if (sgwNucleo.Usuarios.EsDocente()) { %><br /><br /><div class="div-titulo-popup-violeta" style="font-weight: normal"><b>Origen CVar</b>: Formación académica > Nivel universitario de posgrado</div><br /><% } %>
<br />
 <b>Especializaciones</b>
 <br />
 <div class="div-punto">
        <!-- GRILLA ABM TITULOS POSGRADO -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
            <dxwgv:ASPxGridView ID="grdTitulosPosgradoEspecializaciones" runat="server" AutoGenerateColumns="False"
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
                    <dxwgv:GridViewDataTextColumn Caption="Título" VisibleIndex="1" FieldName="titulo">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Año de obtención" VisibleIndex="2" FieldName="fechaEgreso" SortIndex="0" SortOrder="Descending"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución" VisibleIndex="2" FieldName="institucion" SortIndex="0" SortOrder="Descending"></dxwgv:GridViewDataTextColumn>
                    
                </Columns>
                <SettingsPager PageSize="5" SEOFriendly="CrawlerOnly">
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
           
            <asp:Button ID="Button5" runat="server" Text="Modificar" CssClass="boton boton-azul"
                Width="80" Height="25" OnClick="btnModificarEspecializacion_Click" />
           
        </div>
        <!-- FIN GRILLA ABM TITULOS POSGRADO -->
        <div class="div-clear">
        </div>
    </div>
    </div>
 <b>Maestrías</b>
 <br />
 <div class="div-punto">
        <!-- GRILLA ABM TITULOS POSGRADO -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
            <dxwgv:ASPxGridView ID="grdTitulosPosgradoMaestrias" runat="server" AutoGenerateColumns="False"
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
                    <dxwgv:GridViewDataTextColumn Caption="Título" VisibleIndex="1" FieldName="titulo">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Año de obtención" VisibleIndex="2" FieldName="fechaEgreso" SortIndex="0" SortOrder="Descending"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución" VisibleIndex="2" FieldName="institucion" SortIndex="0" SortOrder="Descending"></dxwgv:GridViewDataTextColumn>
                   
                </Columns>
                <SettingsPager PageSize="5" SEOFriendly="CrawlerOnly">
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
           
            <asp:Button ID="Button2" runat="server" Text="Modificar" CssClass="boton boton-azul"
                Width="80" Height="25" OnClick="btnModificarMaestria_Click" />
          
        </div>
        <!-- FIN GRILLA ABM TITULOS POSGRADO -->
        <div class="div-clear">
        </div>
    </div>
    </div>
<b>Doctorados</b>
 <br />
<div class="div-punto">
        <!-- GRILLA ABM TITULOS POSGRADO -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
            <dxwgv:ASPxGridView ID="grdTitulosPosgradoDoctorado" runat="server" AutoGenerateColumns="False"
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
                    <dxwgv:GridViewDataTextColumn Caption="Título" VisibleIndex="1" FieldName="titulo">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Año de obtención" VisibleIndex="2" FieldName="fechaEgreso" SortIndex="0" SortOrder="Descending"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución" VisibleIndex="2" FieldName="institucion" SortIndex="0" SortOrder="Descending"></dxwgv:GridViewDataTextColumn>
                    
                </Columns>
                <SettingsPager PageSize="5" SEOFriendly="CrawlerOnly">
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
            
            <asp:Button ID="btnModificarTituloPosgrado" runat="server" Text="Modificar" CssClass="boton boton-azul"
                Width="80" Height="25" OnClick="btnModificarDoctorado_Click" />
         
        </div>
        <!-- FIN GRILLA ABM TITULOS POSGRADO -->
        <div class="div-clear">
        </div>
    </div>
    </div>
<br />    
    
<span class="lbl-punto">2.3.</span> Otros títulos de nivel superior (formación técnica o terciaria).
<% if (sgwNucleo.Usuarios.EsDocente()) { %><br /><br /><div class="div-titulo-popup-violeta" style="font-weight: normal"><b>Origen CVar</b>: Formación académica > Nivel terciario no universitario</div><br /><% } %>
<div class="div-punto">
      
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
            <dxwgv:ASPxGridView ID="grdOtroTitulo" runat="server" AutoGenerateColumns="False"
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
                    <dxwgv:GridViewDataTextColumn Caption="Título" VisibleIndex="1" FieldName="titulo">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Año de obtención" VisibleIndex="2" FieldName="fechaEgreso" SortIndex="0" SortOrder="Descending"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución" VisibleIndex="2" FieldName="organizacion" SortIndex="0" SortOrder="Descending"></dxwgv:GridViewDataTextColumn>
                   
                </Columns>
                <SettingsPager PageSize="5" SEOFriendly="CrawlerOnly">
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
           
            <asp:Button ID="Button11" runat="server" Text="Modificar" CssClass="boton boton-azul"
                Width="80" Height="25" OnClick="btnModificarOtroTitulo_Click" />
           
        </div>
        <!-- FIN GRILLA ABM TITULOS POSGRADO -->
        <div class="div-clear">
        </div>
    </div>
    </div>









   
 
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="Popup" runat="server">    

   
    <dxpc:ASPxPopupControl ID="popGeneral" runat="server" CloseAction="CloseButton"
        Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popup" HeaderText="Agregar/Modificar título de grado" AllowDragging="True"
        EnableAnimation="True" EnableViewState="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
        CssPostfix="Glass" ImageFolder="~/App_Themes/Glass/{0}/" EnableHierarchyRecreation="False">
        <SizeGripImage Height="12px" Width="12px" />
        <CloseButtonImage Height="17px" Width="17px" />
        <HeaderStyle Font-Bold="True">
            <Paddings PaddingLeft="10px" PaddingRight="6px" PaddingTop="1px" />
        </HeaderStyle>
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl4" runat="server">
                <!-- DETALLE -->
                <div class="divPopup">
                    <div class="div-form-cuadroPopup">
                        
                        <asp:Label ID="Label10" runat="server" Text="Año de obtención: " CssClass="axEtiqueta"
                            Width="200px"></asp:Label>
                        <asp:TextBox ID="edtFecha" runat="server" CssClass="axControl" Enabled="False"
                            Width="100"></asp:TextBox>
                        <br />
                        <br />
                            <asp:Label ID="Label15" runat="server" Text="Institución otorgante: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtInstitucion" runat="server" CssClass="axControl" Enabled="False"
                            Width="400"></asp:TextBox>
                            <br />
                            <br />
                             <asp:Label ID="Label4" runat="server" Text="Título: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtTitulo" runat="server" CssClass="axControl" Enabled="False"
                            Width="400"></asp:TextBox>
                            <br />
                    </div>
                </div>
                <!-- FIN DETALLE -->

                <!-- BOTONERA -->
            <div class="botonera-inferior-der">
                   
                    <asp:Button ID="btnCancelarTituloGrado" runat="server" Text="Cerrar" CssClass="boton boton-rojo"
                        Width="90" Height="25" OnClick="btnCerrarpopGeneral_Click" />
                </div>
                <!-- FIN BOTONERA -->
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
  
    
    
    
    
 
    
</asp:Content>