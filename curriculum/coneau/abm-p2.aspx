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

    <asp:Label ID="Label27" runat="server" Text="Título máximo obtenido: " CssClass="axEtiqueta"></asp:Label>
    <asp:TextBox ID="edtDocenteTituloMaximo" runat="server" Width="150" CssClass="axControl"
        ReadOnly="true"></asp:TextBox>
    <br />
    <span class="axEtiquetaAyuda">El título máximo se obtiene a partir de la información completada en los puntos 2.1, 2.2 y 2.3.</span>
    <br />
    <br />



<span class="lbl-punto">2.1.</span> Títulos de grado.
<div class="div-punto">
        <!-- GRILLA ABM TITULOS GRADO -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
            <dxwgv:ASPxGridView ID="grdTitulosGradoABM" runat="server" AutoGenerateColumns="False"
                CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass"
                KeyFieldName="ID_TITULOS">
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
                    <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;Acciones&nbsp;&nbsp;" ButtonType="Image"><CustomButtons>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarTituloGrado"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarTituloGrado"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID" VisibleIndex="1" Visible="false" FieldName="ID_TITULOS">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Título" VisibleIndex="1" FieldName="TITULO">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Año de obtención" VisibleIndex="2" FieldName="ANIO_OBTENCION" SortIndex="0" SortOrder="Descending">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución otorgante" VisibleIndex="3" FieldName="INSTITUCION">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="País" VisibleIndex="4" FieldName="PAIS">
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarTituloGrado') { btnModificarTituloGrado_Click(); }
                  if (e.buttonID == 'btngrdEliminarTituloGrado') { btnEliminarTituloGrado_Click(); }
                }" />
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
        <script type="text/javascript">
            function btnModificarTituloGrado_Click() { $('#<%= btnModificarTituloGrado.ClientID %>')[0].click(); }
            function btnEliminarTituloGrado_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarTituloGrado.ClientID %>')[0].click(); }
        </script>
            <asp:Button ID="btnAgregarTituloGrado" runat="server" Text="+" Title="Nuevo" CssClass="boton-grilla-agregar" OnClick="btnAgregarTituloGrado_Click" />
        <div class="div-abm-botonera-derecha">
            <br />
            <br />
            <asp:Button ID="btnModificarTituloGrado" runat="server" Text="Modificar" CssClass="boton boton-azul"
                Width="80" Height="25" OnClick="btnModificarTituloGrado_Click" />
            <br />
            <br />
            <asp:Button ID="btnEliminarTituloGrado" runat="server" Text="Eliminar" CssClass="boton boton-rojo"
                Width="80" Height="25" OnClick="btnEliminarTituloGrado_Click" />
        </div>
        <!-- FIN GRILLA ABM TITULOS GRADO -->
        <div class="div-clear">
        </div>
    </div>
    </div>

<span class="lbl-punto">2.2.</span> Títulos de posgrado.
<div class="div-punto">
        <!-- GRILLA ABM TITULOS POSGRADO -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
            <dxwgv:ASPxGridView ID="grdTitulosPosgradoABM" runat="server" AutoGenerateColumns="False"
                CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass"
                KeyFieldName="ID_TITULOS">
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
                    <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;Acciones&nbsp;&nbsp;" ButtonType="Image"><CustomButtons>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarTituloPosgrado"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarTituloPosgrado"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID" VisibleIndex="1" Visible="false" FieldName="ID_TITULOS">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Título" VisibleIndex="1" FieldName="TITULO">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Tipo" VisibleIndex="1" FieldName="TIPO_TITULO">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Año de obtención" VisibleIndex="2" FieldName="ANIO_OBTENCION" SortIndex="0" SortOrder="Descending">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución otorgante" VisibleIndex="3" FieldName="INSTITUCION">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="País" VisibleIndex="4" FieldName="PAIS">
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarTituloPosgrado') { btnModificarTituloPosgrado_Click(); }
                  if (e.buttonID == 'btngrdEliminarTituloPosgrado') { btnEliminarTituloPosgrado_Click(); }
                }" />
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
        <script type="text/javascript">
            function btnModificarTituloPosgrado_Click() { $('#<%= btnModificarTituloPosgrado.ClientID %>')[0].click(); }
            function btnEliminarTituloPosgrado_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarTituloPosgrado.ClientID %>')[0].click(); }
        </script>
            <asp:Button ID="btnAgregarTituloPosgrado" runat="server" Text="+" Title="Nuevo" CssClass="boton-grilla-agregar" OnClick="btnAgregarTituloPosgrado_Click" />
        <div class="div-abm-botonera-derecha">
            <br />
            <br />
            <asp:Button ID="btnModificarTituloPosgrado" runat="server" Text="Modificar" CssClass="boton boton-azul"
                Width="80" Height="25" OnClick="btnModificarTituloPosgrado_Click" />
            <br />
            <br />
            <asp:Button ID="btnEliminarTituloPosgrado" runat="server" Text="Eliminar" CssClass="boton boton-rojo"
                Width="80" Height="25" OnClick="btnEliminarTituloPosgrado_Click" />
        </div>
        <!-- FIN GRILLA ABM TITULOS POSGRADO -->
        <div class="div-clear">
        </div>
    </div>
    </div>
    
    
<span class="lbl-punto">2.3.</span> Otros títulos de nivel superior (formación técnica o terciaria).
<div class="div-punto">
        <!-- GRILLA ABM OTROS TITULOS -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
            <dxwgv:ASPxGridView ID="grdOtrosTitulosABM" runat="server" AutoGenerateColumns="False"
                CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass"
                KeyFieldName="ID_TITULOS">
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
                    <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;Acciones&nbsp;&nbsp;" ButtonType="Image"><CustomButtons>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarOtroTitulo"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarOtroTitulo"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID" VisibleIndex="1" Visible="false" FieldName="ID_TITULOS">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Título" VisibleIndex="1" FieldName="TITULO">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Año de obtención" VisibleIndex="2" FieldName="ANIO_OBTENCION" SortIndex="0" SortOrder="Descending">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución otorgante" VisibleIndex="3" FieldName="INSTITUCION">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="País" VisibleIndex="4" FieldName="PAIS">
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarOtroTitulo') { btnModificarOtroTitulo_Click(); }
                  if (e.buttonID == 'btngrdEliminarOtroTitulo') { btnEliminarOtroTitulo_Click(); }
                }" />
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
        <script type="text/javascript">
            function btnModificarOtroTitulo_Click() { $('#<%= btnModificarOtroTitulo.ClientID %>')[0].click(); }
            function btnEliminarOtroTitulo_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarOtroTitulo.ClientID %>')[0].click(); }
        </script>
            <asp:Button ID="btnAgregarOtroTitulo" runat="server" Text="+" title="Nuevo" CssClass="boton-grilla-agregar" OnClick="btnAgregarOtroTitulo_Click" />
        <div class="div-abm-botonera-derecha">
            <br />
            <br />
            <asp:Button ID="btnModificarOtroTitulo" runat="server" Text="Modificar" CssClass="boton boton-azul"
                Width="80" Height="25" OnClick="btnModificarOtroTitulo_Click" />
            <br />
            <br />
            <asp:Button ID="btnEliminarOtroTitulo" runat="server" Text="Eliminar" CssClass="boton boton-rojo"
                Width="80" Height="25" OnClick="btnEliminarOtroTitulo_Click" />
        </div>
        <!-- FIN GRILLA ABM OTROS TITULOS -->
        <div class="div-clear">
        </div>
        </div>
    </div>
   


<span class="lbl-punto">2.4.</span> Carrera de formación docente.
<div class="div-punto">
    <table class="tabla-color">
        <tr>
            <td><b>¿Ha cursado una o mas carreras docentes?</b></td>
            <td><asp:CheckBox ID="chkCarreraDocente" runat="server" /></td>
        </tr>
    </table>
        <!-- FIN RADIOBUTTON -->
        <!-- PANEL CARRERA FORMACION DOCENTE -->
        <div id="pnlCarreraDocente">
            Completar el siguiente cuadro con la información de cada una de ellas.
            <br />
            <!-- GRILLA ABM CARRERA FORMACION DOCENTE -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
                <dxwgv:ASPxGridView ID="grdCarreraFormacionDocenteABM" runat="server" AutoGenerateColumns="False"
                    CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass"
                    KeyFieldName="ID_CARRERAS_DOCENTES">
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
                    <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;Acciones&nbsp;&nbsp;" ButtonType="Image"><CustomButtons>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarCarreraFormacionDocente"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarCarreraFormacionDocente"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="ID" Visible="false" FieldName="ID_CARRERAS_DOCENTES">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Institución" VisibleIndex="1" FieldName="INSTITUCION">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Unidad Académica" VisibleIndex="2" FieldName="UNIDAD_ACADEMICA">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Título" VisibleIndex="3" FieldName="TITULO">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Año de obtención" VisibleIndex="4" FieldName="ANIO_OBTENCION" SortIndex="0" SortOrder="Descending">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Duración de la carrera" VisibleIndex="5" FieldName="DURACION_CARRERA">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarCarreraFormacionDocente') { btnModificarCarreraFormacionDocente_Click(); }
                  if (e.buttonID == 'btngrdEliminarCarreraFormacionDocente') { btnEliminarCarreraFormacionDocente_Click(); }
                }" />
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
        <script type="text/javascript">
            function btnModificarCarreraFormacionDocente_Click() { $('#<%= btnModificarCarreraFormacionDocente.ClientID %>')[0].click(); }
            function btnEliminarCarreraFormacionDocente_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarCarreraFormacionDocente.ClientID %>')[0].click(); }
        </script>
                <asp:Button ID="btnAgregarCarreraFormacionDocente" runat="server" Text="+" title="Nuevo"
                    CssClass="boton-grilla-agregar" OnClick="btnAgregarCarreraFormacionDocente_Click" />
            <div class="div-abm-botonera-derecha">
                <br />
                <br />
                <asp:Button ID="btnModificarCarreraFormacionDocente" runat="server" Text="Modificar"
                    CssClass="boton boton-azul" Width="80" Height="25" OnClick="btnModificarCarreraFormacionDocente_Click" />
                <br />
                <br />
                <asp:Button ID="btnEliminarCarreraFormacionDocente" runat="server" Text="Eliminar"
                    CssClass="boton boton-rojo" Width="80" Height="25" OnClick="btnEliminarCarreraFormacionDocente_Click" />
            </div>
            <!-- FIN GRILLA ABM CARRERA FORMACION DOCENTE -->
            <div class="div-clear">
            </div>
             </div>
        </asp:Panel>
        <!-- FIN PANEL CARRERA FORMACION DOCENTE -->
    </div>



<script type="text/javascript">

    function actualizarCarreraDocente() {
        if ($("#<%= chkCarreraDocente.ClientID %>").is(":checked")) $("#pnlCarreraDocente").show(); else $("#pnlCarreraDocente").hide();
    }


    function sgwNucleo_alIniciar() {

        $("#<%= chkCarreraDocente.ClientID %>").change(function () { actualizarCarreraDocente(); });
        actualizarCarreraDocente();

    }
</script>



    <!-- BOTONERA GENERAL -->
    <div class="fullform-botonera-inferior">
        <asp:Button ID="btnGuardarDatosGenerales" runat="server" OnClick="btnGuardarDatosGenerales_Click" Text="Guardar" CssClass="boton boton-verde" />
        <img id="img-botonera-cargando" src="/coneauglobal/recursos/imagenes/iconos/cargando.gif" title="Cargando..." />
    </div>
    <!-- FIN BOTONERA GENERAL -->
    <div class="div-clear">
    </div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="Popup" runat="server">    

    <!-- POPUP TITULOS GRADO -->
    <dxpc:ASPxPopupControl ID="popTitulosGrado" runat="server" CloseAction="CloseButton"
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
                        <asp:Label ID="Label11" runat="server" Text="* Denominación del título: " CssClass="axEtiqueta"
                            Width="200"></asp:Label>
                        <asp:TextBox ID="edtTitulosGradoTituloObtenido" runat="server" Width="400" CssClass="axControl"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label10" runat="server" Text="* Año de obtención: " CssClass="axEtiqueta"
                            Width="200px"></asp:Label>
                        <asp:TextBox ID="edtTitulosGradoAnioObtencion" runat="server" CssClass="axControl"
                            Width="100"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="* País: " CssClass="axEtiqueta" Width="200"></asp:Label>
                        <asp:DropDownList ID="cmbTitulosGradoPais" runat="server" Width="400" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbTitulosGradoPais_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlTitulosGradoInstitucionOtorgante" runat="server">
                            <asp:Label ID="Label15" runat="server" Text="* Institución otorgante: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:DropDownList ID="cmbTitulosGradoInstitucionOtorgante" runat="server" Width="400" CssClass="axControl"></asp:DropDownList>
                            <br />
                            <br />
                        </asp:Panel>
                        <asp:Panel ID="pnlTitulosGradoOtraInstitucionOtorgante" runat="server">
                            <asp:Label ID="Label3" runat="server" Text="* Institución otorgante: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtTitulosGradoOtraInstitucionOtorgante" runat="server" CssClass="axControl" Width="400"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>
                    </div>
                </div>
                <!-- FIN DETALLE -->

                <!-- BOTONERA -->
            <div class="botonera-inferior-der">
                    <asp:Button ID="btnGuardarTituloGrado" runat="server" Text="Guardar" CssClass="boton boton-verde"
                        Width="90" Height="25" OnClick="btnGuardarTituloGrado_Click" />&nbsp;&nbsp;
                    <asp:Button ID="btnCancelarTituloGrado" runat="server" Text="Cancelar" CssClass="boton boton-rojo"
                        Width="90" Height="25" OnClick="btnCancelarTituloGrado_Click" />
                </div>
                <!-- FIN BOTONERA -->
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP TITULOS GRADO -->
    
    
    
    
    
    <!-- POPUP TITULOS POSGRADO -->
    <dxpc:ASPxPopupControl ID="popTitulosPosgrado" runat="server" CloseAction="CloseButton"
        Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popup" HeaderText="Agregar/Modificar título de posgrado"
        AllowDragging="True" EnableAnimation="True" EnableViewState="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
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
                        <asp:Label ID="Label5" runat="server" Text="* Tipo de título: " CssClass="axEtiqueta" Width="200"></asp:Label>
                        <asp:DropDownList ID="cmbTitulosPosgradoTipo" runat="server" Width="250" CssClass="axControl"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="* Denominación del título: " CssClass="axEtiqueta"
                            Width="200"></asp:Label>
                        <asp:TextBox ID="edtTitulosPosgradoTituloObtenido" runat="server" Width="400" CssClass="axControl"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="* Año de obtención: " CssClass="axEtiqueta"
                            Width="200"></asp:Label>
                        <asp:TextBox ID="edtTitulosPosgradoAnioObtencion" runat="server" Width="100" CssClass="axControl"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label13" runat="server" Text="* País: " CssClass="axEtiqueta" Width="200"></asp:Label>
                        <asp:DropDownList ID="cmbTitulosPosgradoPais" runat="server" Width="400" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbTitulosPosgradoPais_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlTitulosPosgradoInstitucionOtorgante" runat="server">
                            <asp:Label ID="Label12" runat="server" Text="* Institución otorgante: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:DropDownList ID="cmbTitulosPosgradoInstitucionOtorgante" runat="server" Width="400" CssClass="axControl"></asp:DropDownList>
                            <br />
                            <br />
                        </asp:Panel>
                        <asp:Panel ID="pnlTitulosPosgradoOtraInstitucionOtorgante" runat="server">
                            <asp:Label ID="Label23" runat="server" Text="* Institución otorgante: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtTitulosPosgradoOtraInstitucionOtorgante" runat="server" CssClass="axControl" Width="400"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>
                    </div>
                </div>
                <!-- FIN DETALLE -->

                <!-- BOTONERA -->
            <div class="botonera-inferior-der">
                    <asp:Button ID="btnGuardarTituloPosgrado" runat="server" Text="Guardar" CssClass="boton boton-verde"
                        Width="90" Height="25" OnClick="btnGuardarTituloPosgrado_Click" />&nbsp;&nbsp;
                    <asp:Button ID="btnCancelarTituloPosgrado" runat="server" Text="Cancelar" CssClass="boton boton-rojo"
                        Width="90" Height="25" OnClick="btnCancelarTituloPosgrado_Click" />
                </div>
                <!-- FIN BOTONERA -->
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP TITULOS POSGRADO -->
    
    
    
    
    
    <!-- POPUP OTROS TITULOS -->
    <dxpc:ASPxPopupControl ID="popOtrosTitulos" runat="server" CloseAction="CloseButton"
        Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popup" HeaderText="Agregar/Modificar título de nivel superior"
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
                <div class="divPopup">
                    <div class="div-form-cuadroPopup">
                        <asp:Label ID="Label16" runat="server" Text="* Denominación del título: " CssClass="axEtiqueta"
                            Width="200"></asp:Label>
                        <asp:TextBox ID="edtOtrosTitulosTituloObtenido" runat="server" Width="400" CssClass="axControl"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label20" runat="server" Text="* Año de obtención: " CssClass="axEtiqueta"
                            Width="200px"></asp:Label>
                        <asp:TextBox ID="edtOtrosTitulosAnioObtencion" runat="server" CssClass="axControl"
                            Width="100"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label24" runat="server" Text="* País: " CssClass="axEtiqueta" Width="200"></asp:Label>
                        <asp:DropDownList ID="cmbOtrosTitulosPais" runat="server" Width="400" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbOtrosTitulosPais_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlOtrosTitulosInstitucionOtorgante" runat="server">
                            <asp:Label ID="Label25" runat="server" Text="* Institución otorgante: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:DropDownList ID="cmbOtrosTitulosInstitucion" runat="server" Width="400" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbOtrosTitulosInstitucion_SelectedIndexChanged" ></asp:DropDownList>
                            <br />
                            <br />
                        </asp:Panel>
                        <asp:Panel ID="pnlOtrosTitulosOtraInstitucionOtorgante" runat="server">
                            <asp:Label ID="Label26" runat="server" Text="* Institución otorgante: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtOtrosTitulosOtraInstitucion" runat="server" CssClass="axControl" Width="400"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>                    
                    </div>
                </div>
                <!-- FIN DETALLE -->
                <!-- BOTONERA -->
            <div class="botonera-inferior-der">
                    <asp:Button ID="btnGuardarOtroTitulo" runat="server" Text="Guardar" CssClass="boton boton-verde"
                        Width="90" Height="25" OnClick="btnGuardarOtroTitulo_Click" />&nbsp;&nbsp;
                    <asp:Button ID="btnCancelarOtroTitulo" runat="server" Text="Cancelar" CssClass="boton boton-rojo"
                        Width="90" Height="25" OnClick="btnCancelarOtroTitulo_Click" />
                </div>
                <!-- FIN BOTONERA-->
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP OTROS TITULOS -->
    
    
    
    
    
    <!-- POPUP CARRERA FORMACION DOCENTE -->
    <dxpc:ASPxPopupControl ID="popCarrerasFormacionDocente" runat="server" CloseAction="CloseButton"
        Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popup" HeaderText="Agregar/Modificar carrera de formación docente"
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
                        <asp:Label ID="Label14" runat="server" Text="* Institución Universitaria: " CssClass="axEtiqueta"
                            Width="200"></asp:Label>
                        <asp:DropDownList ID="cmbCarrerasFormacionDocenteInstituciones" runat="server" Width="400px" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCarrerasFormacionDocenteInstituciones_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlCarrerasFormacionDocenteOtraInst" runat="server">
                            <asp:Label ID="Label6" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtCarrerasFormacionDocenteOtraInst" runat="server" CssClass="axControl"
                                Width="400"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>
                        <asp:Label ID="Label116" runat="server" Text="* Unidad Académica: " CssClass="axEtiqueta"
                            Width="200px"></asp:Label>
                        <asp:DropDownList ID="cmbCarrerasFormacionDocenteUA" runat="server" Width="400px" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCarrerasFormacionDocenteUA_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlCarrerasFormacionDocenteOtraUA" runat="server">
                            <asp:Label ID="Label22" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtCarrerasFormacionDocenteOtraUA" runat="server" CssClass="axControl"
                                Width="400"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>
                        <asp:Label ID="Label17" runat="server" Text="* Título: " CssClass="axEtiqueta" Width="200"></asp:Label>
                        <asp:TextBox ID="edtCarrerasFormacionDocenteTitulo" runat="server" CssClass="axControl"
                            Width="400px"></asp:TextBox>
                        <br />
                        <br />
                        <div class="div-mitad">
                            <asp:Label ID="Label18" runat="server" Text="* Año de obtención: " CssClass="axEtiqueta"
                                Width="200"></asp:Label>
                            <asp:TextBox ID="edtCarrerasFormacionDocenteAnioObtencion" runat="server" CssClass="axControl" Width="80"></asp:TextBox>
                        </div>
                        <div class="div-mitad">
                            <asp:Label ID="Label19" runat="server" Text="* Duración de la carrera (años): " CssClass="axEtiqueta"
                                Width="230"></asp:Label>
                            <asp:TextBox ID="edtCarrerasFormacionDocenteDuracion" runat="server" CssClass="axControl" Width="50"></asp:TextBox>
                        </div>
                        <br />
                        <br />
                    </div>
                </div>
                <!-- FIN DETALLE -->
                <br />
                <!-- BOTONERA-->
                <div class="botonera-inferior-der">
                    <asp:Button ID="btnGuardarCarreraFormacionDocente" runat="server" Text="Guardar"
                        CssClass="boton boton-verde" Width="90" Height="25" OnClick="btnGuardarCarreraFormacionDocente_Click" />&nbsp;&nbsp;
                    <asp:Button ID="btnCancelarCarreraFormacionDocente" runat="server" Text="Cancelar"
                        CssClass="boton boton-rojo" Width="90" Height="25" OnClick="btnCancelarCarreraFormacionDocente_Click" />
                </div>
                <!-- FIN BOTONERA--> 
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP CARRERA FORMACION DOCENTE -->
    
</asp:Content>