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
<div class="div-punto">


    <table class="tabla-color">
        <tr>
            <td><b>CONICET</b></td>
            <td><asp:CheckBox ID="chkCONICET" runat="server" /></td>
            <td id="pnlCONICET">
                <asp:Label ID="Label50" runat="server" Text="* Categoría: " CssClass="axEtiqueta" Width="100"></asp:Label>
                <asp:DropDownList ID="ddlCONICET" runat="server" Width="200px" CssClass="axControl">
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td><b>Programa de Incentivos</b></td>
            <td><asp:CheckBox ID="chkIncentivos" runat="server" /></td>
            <td id="pnlIncentivos">
                <asp:Label ID="Label58" runat="server" Text="* Categoría: " CssClass="axEtiqueta" Width="100"></asp:Label>
                <asp:DropDownList ID="ddlIncentivos" runat="server" Width="200px" CssClass="axControl">
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td><b>Otros</b></td>
            <td><asp:CheckBox ID="chkOtros" runat="server" /></td>
        </tr>
    </table>

        <!-- FIN PANEL IZQUIERO -->
        <!-- PANEL DERECHO -->
        <div id="pnlOtros">
            <br />
            Completar el siguiente cuadro con las otras categorizaciones obtenidas.<br />
            Si adscribe a más de un organismo (no contemplado previamente), completar un cuadro por cada uno de ellos.
            <br />
            <!-- GRILLA ABM SISTEMAS PROMOCION OTROS -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
                <dxwgv:ASPxGridView ID="grdSistemasPromocionOtrosABM" runat="server" AutoGenerateColumns="False"
                    CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass"
                    KeyFieldName="ID_OTRAS_CATEGORIAS_INV">
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
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarSistemaPromocionOtro"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarSistemaPromocionOtro"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="ID_OTRAS_CATEGORIAS_INV" Visible="false"></dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Institución ú organismo" FieldName="INSTITUCION"></dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Categoría" FieldName="CATEGORIA"></dxwgv:GridViewDataTextColumn>
                    </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarSistemaPromocionOtro') { btnModificarSistemaPromocionOtro_Click(); }
                  if (e.buttonID == 'btngrdEliminarSistemaPromocionOtro') { btnEliminarSistemaPromocionOtro_Click(); }
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
            function btnModificarSistemaPromocionOtro_Click() { $('#<%= btnModificarSistemaPromocionOtro.ClientID %>')[0].click(); }
            function btnEliminarSistemaPromocionOtro_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarSistemaPromocionOtro.ClientID %>')[0].click(); }
        </script>
                <asp:Button ID="btnAgregarSistemaPromocionOtro" runat="server" Text="+" title="Nuevo" CssClass="boton-grilla-agregar" OnClick="btnAgregarSistemaPromocionOtro_Click" />
            <div class="div-abm-botonera-derecha">
                <br />
                <br />
                <asp:Button ID="btnModificarSistemaPromocionOtro" runat="server" Text="Modificar"
                    CssClass="boton boton-azul" Width="80" Height="25" OnClick="btnModificarSistemaPromocionOtro_Click" />
                <br />
                <br />
                <asp:Button ID="btnEliminarSistemaPromocionOtro" runat="server" Text="Eliminar" CssClass="boton boton-rojo"
                    Width="80" Height="25" OnClick="btnEliminarSistemaPromocionOtro_Click" />
            </div>
            <!-- FIN GRILLA ABM GESTION ACADEMICA -->
            <div class="div-clear">
            </div>
        </div>
        </div>
    </div>


<span class="lbl-punto">7.2.</span> Proyectos de investigación.
<div class="div-punto">
    Detallar el proyecto más importante que desarrolla actualmente y los dos más significativos
    en los que haya participado en los últimos 10 años. Completar la información requerida
    para cada uno de ellos en el siguiente cuadro.

        <!-- GRILLA ABM PROYECTOS INVESTIGACION -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
            <dxwgv:ASPxGridView ID="grdProyectosInvestigacion" runat="server" AutoGenerateColumns="False"
                CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="800px"
                KeyFieldName="ID_ACTIVIDADES_INVESTIGACION">
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
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarProyectoInvestigacion"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarProyectoInvestigacion"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Título del proyecto" FieldName="ACTIVIDAD_INVESTIGACION"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución" FieldName="INSTITUCION"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución evaluadora" FieldName="INSTITUCION_EVAL"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución financiadora" FieldName="INSTITUCION_FINAN"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataDateColumn Caption="Fecha de inicio" FieldName="FECHA_INICIO" SortOrder="Descending">
                         <PropertiesDateEdit DisplayFormatString="{0:d}"></PropertiesDateEdit>
                    </dxwgv:GridViewDataDateColumn>                    
                    <dxwgv:GridViewDataDateColumn Caption="Fecha de finalización" FieldName="FECHA_FINALIZACION" SortOrder="Descending">
                         <PropertiesDateEdit DisplayFormatString="{0:d}"></PropertiesDateEdit>
                    </dxwgv:GridViewDataDateColumn>                    
                    <dxwgv:GridViewDataTextColumn Caption="Carácter de la participación" FieldName="CARACTER"></dxwgv:GridViewDataTextColumn>
                </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarProyectoInvestigacion') { btnModificarProyectoInvestigacion_Click(); }
                  if (e.buttonID == 'btngrdEliminarProyectoInvestigacion') { btnEliminarProyectoInvestigacion_Click(); }
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
                 
              
                <Settings ShowHeaderFilterButton="True" />
            </dxwgv:ASPxGridView>
        </div>
        <script type="text/javascript">
            function btnModificarProyectoInvestigacion_Click() { $('#<%= btnModificarProyectoInvestigacion.ClientID %>')[0].click(); }
            function btnEliminarProyectoInvestigacion_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarProyectoInvestigacion.ClientID %>')[0].click(); }
        </script>
            <asp:Button ID="btnAgregarProyectoInvestigacion" runat="server" Text="+" title="Nuevo" CssClass="boton-grilla-agregar" OnClick="btnAgregarProyectoInvestigacion_Click" />
        <div class="div-abm-botonera-derecha">
            <br />
            <br />
            <asp:Button ID="btnModificarProyectoInvestigacion" runat="server" Text="Modificar"
                CssClass="boton boton-azul" Width="80" Height="25" OnClick="btnModificarProyectoInvestigacion_Click" />
            <br />
            <br />
            <asp:Button ID="btnEliminarProyectoInvestigacion" runat="server" Text="Eliminar"
                CssClass="boton boton-rojo" Width="80" Height="25" OnClick="btnEliminarProyectoInvestigacion_Click" />
        </div>
        <!-- FIN GRILLA ABM PROYECTOS INVESTIGACION -->
        <div class="div-clear">
        </div>
    </div>
</div>


<span class="lbl-punto">7.3.</span> Principales productos de los últimos 5 años.
<div class="div-punto">
    <span class="lbl-punto">7.3.1.</span> Indicar las referencias completas correspondientes a los siguientes tipos
        de productos.
    <div class="div-punto">
        a) Publicaciones en revistas con arbitraje.<br />
        <!-- GRILLA ABM PUBLICACIONES REVISTAS CON ARBITRAJE -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
                <dxwgv:ASPxGridView ID="grdPublicacionesRevistasConArbitraje" runat="server"
                    AutoGenerateColumns="False" CssFilePath="~/App_Themes/Glass/GridView/styles.css"
                    CssPostfix="Glass" Width="800px" KeyFieldName="ID_PUBLICACIONES">
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
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarPublicacionRevistaConArbitraje"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarPublicacionRevistaConArbitraje"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="ID" Visible="false" FieldName="ID_PUBLICACIONES"></dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Autores" VisibleIndex="1" FieldName="AUTORES">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Título" VisibleIndex="2" FieldName="PUBLICACION">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Revista" VisibleIndex="3" FieldName="CONTENEDOR">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Volumen" VisibleIndex="5" FieldName="VOLUMEN">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Año" VisibleIndex="4" FieldName="ANIO">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Páginas" VisibleIndex="6" FieldName="PAGINAS">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarPublicacionRevistaConArbitraje') { btnModificarPublicacionRevistaConArbitraje_Click(); }
                  if (e.buttonID == 'btngrdEliminarPublicacionRevistaConArbitraje') { btnEliminarPublicacionRevistaConArbitraje_Click(); }
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
            function btnEliminarPublicacionRevistaConArbitraje_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarPublicacionRevistaConArbitraje.ClientID %>')[0].click(); }
        </script>
                <asp:Button ID="btnAgregarPublicacionRevistaConArbitraje" runat="server" Text="+" title="Nuevo"
                    CssClass="boton-grilla-agregar" OnClick="btnAgregarPublicacionRevistaConArbitraje_Click" />
        <div class="div-abm-botonera-derecha">
                <br />
                <br />
                <asp:Button ID="btnModificarPublicacionRevistaConArbitraje" runat="server" Text="Modificar"
                    CssClass="boton boton-azul" Width="80" Height="25" OnClick="btnModificarPublicacionRevistaConArbitraje_Click" />
                <br />
                <br />
                <asp:Button ID="btnEliminarPublicacionRevistaConArbitraje" runat="server" Text="Eliminar"
                    CssClass="boton boton-rojo" Width="80" Height="25" OnClick="btnEliminarPublicacionRevistaConArbitraje_Click" />
            </div>
            <div class="div-clear">
            </div>
        </div>
        <!-- FIN GRILLA ABM PUBLICACIONES REVISTAS CON ARBITRAJE -->    
            <br />
        b) Publicaciones en revistas sin arbitraje.<br />
        <!-- GRILLA ABM PUBLICACIONES REVISTAS SIN ARBITRAJE -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
                <dxwgv:ASPxGridView ID="grdPublicacionesRevistasSinArbitraje" runat="server"
                    AutoGenerateColumns="False" CssFilePath="~/App_Themes/Glass/GridView/styles.css"
                    CssPostfix="Glass" Width="800px" KeyFieldName="ID_PUBLICACIONES">
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
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarPublicacionRevistaSinArbitraje"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarPublicacionRevistaSinArbitraje"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="ID" Visible="false" FieldName="ID_PUBLICACIONES"></dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Autores" FieldName="AUTORES">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Título" FieldName="PUBLICACION">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Revista" FieldName="CONTENEDOR">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Volumen" FieldName="VOLUMEN">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Año" FieldName="ANIO">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Páginas" FieldName="PAGINAS">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarPublicacionRevistaSinArbitraje') { btnModificarPublicacionRevistaSinArbitraje_Click(); }
                  if (e.buttonID == 'btngrdEliminarPublicacionRevistaSinArbitraje') { btnEliminarPublicacionRevistaSinArbitraje_Click(); }
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
            function btnModificarPublicacionRevistaSinArbitraje_Click() { $('#<%= btnModificarPublicacionRevistaSinArbitraje.ClientID %>')[0].click(); }
            function btnEliminarPublicacionRevistaSinArbitraje_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarPublicacionRevistaSinArbitraje.ClientID %>')[0].click(); }
        </script>
                <asp:Button ID="btnAgregarPublicacionRevistaSinArbitraje" runat="server" Text="+" title="Nuevo"
                    CssClass="boton-grilla-agregar" OnClick="btnAgregarPublicacionRevistaSinArbitraje_Click" />
        <div class="div-abm-botonera-derecha">
                <br />
                <br />
                <asp:Button ID="btnModificarPublicacionRevistaSinArbitraje" runat="server" Text="Modificar"
                    CssClass="boton boton-azul" Width="80" Height="25" OnClick="btnModificarPublicacionRevistaSinArbitraje_Click" />
                <br />
                <br />
                <asp:Button ID="btnEliminarPublicacionRevistaSinArbitraje" runat="server" Text="Eliminar"
                    CssClass="boton boton-rojo" Width="80" Height="25" OnClick="btnEliminarPublicacionRevistaSinArbitraje_Click" />
            </div>
            <div class="div-clear">
            </div>
        </div>
        <!-- FIN GRILLA ABM PUBLICACIONES REVISTAS SIN ARBITRAJE -->    
            <br />
        c) Libros.<br />
        <!-- GRILLA ABM PUBLICACIONES LIBROS -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
                <dxwgv:ASPxGridView ID="grdPublicacionesLibros" runat="server" AutoGenerateColumns="False"
                    CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="800px"
                    KeyFieldName="ID_PUBLICACIONES">
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
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarPublicacionLibro"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="ID" Visible="false" FieldName="ID_PUBLICACIONES"></dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Autores" FieldName="AUTORES">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Título del libro" FieldName="PUBLICACION">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Editorial" FieldName="EDITORIAL">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Lugar de impresión" FieldName="LUGAR_IMPRESION">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Año" FieldName="ANIO">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarPublicacionLibro') { btnModificarPublicacionLibro_Click(); }
                  if (e.buttonID == 'btngrdEliminarPublicacionLibro') { btnEliminarPublicacionLibro_Click(); }
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
            function btnEliminarPublicacionLibro_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarPublicacionLibro.ClientID %>')[0].click(); }
        </script>
                <asp:Button ID="btnAgregarPublicacionLibro" runat="server" Text="+" title="Nuevo" CssClass="boton-grilla-agregar"
                    OnClick="btnAgregarPublicacionLibro_Click" />
        <div class="div-abm-botonera-derecha">
                <br />
                <br />
                <asp:Button ID="btnModificarPublicacionLibro" runat="server" Text="Modificar" CssClass="boton boton-azul"
                    Width="80" Height="25" OnClick="btnModificarPublicacionLibro_Click" />
                <br />
                <br />
                <asp:Button ID="btnEliminarPublicacionLibro" runat="server" Text="Eliminar" CssClass="boton boton-rojo"
                    Width="80" Height="25" OnClick="btnEliminarPublicacionLibro_Click" />
            </div>
            <div class="div-clear">
            </div>
        </div>
        <!-- FIN GRILLA ABM PUBLICACIONES LIBROS -->    
            <br />
        d) Capítulos de libros.<br />
        <!-- GRILLA ABM PUBLICACIONES CAPITULOS LIBROS -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
                <dxwgv:ASPxGridView ID="grdPublicacionesCapitulosLibros" runat="server" AutoGenerateColumns="False"
                    CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="800px"
                    KeyFieldName="ID_PUBLICACIONES">
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
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarPublicacionCapituloLibro"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="ID" Visible="false" FieldName="ID_PUBLICACIONES"></dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Autores" FieldName="AUTORES">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Título del capítulo" FieldName="PUBLICACION">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Título del libro" FieldName="CONTENEDOR">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Editores del libro" FieldName="EDITORES">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Editorial" FieldName="EDITORIAL">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Lugar de impresión" FieldName="LUGAR_IMPRESION">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Año" FieldName="ANIO">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Páginas" FieldName="PAGINAS">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarPublicacionCapituloLibro') { btnModificarPublicacionCapituloLibro_Click(); }
                  if (e.buttonID == 'btngrdEliminarPublicacionCapituloLibro') { btnEliminarPublicacionCapituloLibro_Click(); }
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
            function btnEliminarPublicacionCapituloLibro_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarPublicacionCapituloLibro.ClientID %>')[0].click(); }
        </script>
                <asp:Button ID="btnAgregarPublicacionCapituloLibro" runat="server" Text="+" title="Nuevo"
                    CssClass="boton-grilla-agregar" OnClick="btnAgregarPublicacionCapituloLibro_Click" />
        <div class="div-abm-botonera-derecha">
                <br />
                <br />
                <asp:Button ID="btnModificarPublicacionCapituloLibro" runat="server" Text="Modificar"
                    CssClass="boton boton-azul" Width="80" Height="25" OnClick="btnModificarPublicacionCapituloLibro_Click" />
                <br />
                <br />
                <asp:Button ID="btnEliminarPublicacionCapituloLibro" runat="server" Text="Eliminar"
                    CssClass="boton boton-rojo" Width="80" Height="25" OnClick="btnEliminarPublicacionCapituloLibro_Click" />
            </div>
            <div class="div-clear">
            </div>
        </div>
        <!-- FIN GRILLA ABM PUBLICACIONES CAPITULOS LIBROS --> 
            <br />
        e) Trabajos presentados a congresos y/o seminarios.<br />
        <!-- GRILLA ABM PUBLICACIONES TRABAJOS -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
                <dxwgv:ASPxGridView ID="grdPublicacionesTrabajos" runat="server" AutoGenerateColumns="False"
                    CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="800px"
                    KeyFieldName="ID_PUBLICACIONES">
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
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarPublicacionTrabajo"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarPublicacionTrabajo"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="ID" Visible="false" FieldName="ID_PUBLICACIONES"></dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Autores" FieldName="AUTORES">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Título" FieldName="PUBLICACION">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Evento" FieldName="CONTENEDOR">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Lugar de realización" FieldName="LUGAR_REALIZACION">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Año" FieldName="ANIO">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarPublicacionTrabajo') { btnModificarPublicacionTrabajo_Click(); }
                  if (e.buttonID == 'btngrdEliminarPublicacionTrabajo') { btnEliminarPublicacionTrabajo_Click(); }
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
            function btnModificarPublicacionTrabajo_Click() { $('#<%= btnModificarPublicacionTrabajo.ClientID %>')[0].click(); }
            function btnEliminarPublicacionTrabajo_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarPublicacionTrabajo.ClientID %>')[0].click(); }
        </script>
                <asp:Button ID="btnAgregarPublicacionTrabajo" runat="server" Text="+" title="Nuevo" CssClass="boton-grilla-agregar"
                    OnClick="btnAgregarPublicacionTrabajo_Click" />
        <div class="div-abm-botonera-derecha">
                <br />
                <br />
                <asp:Button ID="btnModificarPublicacionTrabajo" runat="server" Text="Modificar" CssClass="boton boton-azul"
                    Width="80" Height="25" OnClick="btnModificarPublicacionTrabajo_Click" />
                <br />
                <br />
                <asp:Button ID="btnEliminarPublicacionTrabajo" runat="server" Text="Eliminar" CssClass="boton boton-rojo"
                    Width="80" Height="25" OnClick="btnEliminarPublicacionTrabajo_Click" />
            </div>
            <div class="div-clear">
            </div>
        </div>
        <!-- FIN GRILLA ABM PUBLICACIONES TRABAJOS -->
    </div>    

    <span class="lbl-punto">7.3.2.</span> Resultados pasibles de ser protegidos a través de instrumentos de propiedad
            intelectual como patentes, derechos de autor, etc., y desarrollos que no pueden
            ser protegidos por instrumentos de propiedad intelectual como las tecnologías organizacionales
            u otros. Complete un cuadro por cada uno de estos dos tipos de productos.
    <div class="div-punto">
            a) Títulos de propiedad intelectual.<br />
            <!-- GRILLA ABM PRODUCTOS PROTEGIDOS -->
            <div class="div-form-abm">
            <div class="div-form-abm-grilla" >
                <dxwgv:ASPxGridView ID="grdProductosProtegidos" runat="server" AutoGenerateColumns="False"
                    CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="800px"
                    KeyFieldName="ID_PRODUCTOS">
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
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarProductoProtegido"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarProductoProtegido"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="ID" Visible="false" FieldName="ID_PRODUCTOS"></dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Desarrollo o producto" FieldName="PRODUCTO">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Titular" FieldName="TITULAR">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataDateColumn Caption="Fecha de solicitud" FieldName="FECHA_SOLICITUD">
                             <PropertiesDateEdit DisplayFormatString="{0:d}"></PropertiesDateEdit>
                        </dxwgv:GridViewDataDateColumn>                    
                        <dxwgv:GridViewDataDateColumn Caption="Fecha de otorgamiento" FieldName="FECHA_OTORGAMIENTO">
                             <PropertiesDateEdit DisplayFormatString="{0:d}"></PropertiesDateEdit>
                        </dxwgv:GridViewDataDateColumn>                    
                    </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarProductoProtegido') { btnModificarProductoProtegido_Click(); }
                  if (e.buttonID == 'btngrdEliminarProductoProtegido') { btnEliminarProductoProtegido_Click(); }
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
            function btnModificarProductoProtegido_Click() { $('#<%= btnModificarProductoProtegido.ClientID %>')[0].click(); }
            function btnEliminarProductoProtegido_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarProductoProtegido.ClientID %>')[0].click(); }
        </script>
                <asp:Button ID="btnAgregarProductoProtegido" runat="server" Text="+" title="Nuevo" CssClass="boton-grilla-agregar" OnClick="btnAgregarProductoProtegido_Click" />
        <div class="div-abm-botonera-derecha">
                <br />
                <br />
                <asp:Button ID="btnModificarProductoProtegido" runat="server" Text="Modificar" CssClass="boton boton-azul"
                    Width="80" Height="25" OnClick="btnModificarProductoProtegido_Click" />
                <br />
                <br />
                <asp:Button ID="btnEliminarProductoProtegido" runat="server" Text="Eliminar" CssClass="boton boton-rojo"
                    Width="80" Height="25" OnClick="btnEliminarProductoProtegido_Click" />
            </div>
            <div class="div-clear">
            </div>
        </div>
            <!-- FIN GRILLA ABM PRODUCTOS PROTEGIDOS -->    
            <br />
            b) Desarrollos no pasibles de ser protegidos por títulos de propiedad intelectual.<br />
            <!-- GRILLA ABM PRODUCTOS NO PROTEGIDOS -->
            <div class="div-form-abm">
            <div class="div-form-abm-grilla" >
                <dxwgv:ASPxGridView ID="grdProductosNoProtegidos" runat="server" AutoGenerateColumns="False"
                    CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="800px"
                    KeyFieldName="ID_PRODUCTOS">
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
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarProductoNoProtegido"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarProductoNoProtegido"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="ID" Visible="false" FieldName="ID_PRODUCTOS"></dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Producto" FieldName="PRODUCTO">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Descripción" FieldName="DESCRIPCION">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarProductoNoProtegido') { btnModificarProductoNoProtegido_Click(); }
                  if (e.buttonID == 'btngrdEliminarProductoNoProtegido') { btnEliminarProductoNoProtegido_Click(); }
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
            function btnModificarProductoNoProtegido_Click() { $('#<%= btnModificarProductoNoProtegido.ClientID %>')[0].click(); }
            function btnEliminarProductoNoProtegido_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarProductoNoProtegido.ClientID %>')[0].click(); }
        </script>
                <asp:Button ID="btnAgregarProductoNoProtegido" runat="server" Text="+" title="Nuevo" CssClass="boton-grilla-agregar" OnClick="btnAgregarProductoNoProtegido_Click" />
        <div class="div-abm-botonera-derecha">
                <br />
                <br />
                <asp:Button ID="btnModificarProductoNoProtegido" runat="server" Text="Modificar"
                    CssClass="boton boton-azul" Width="80" Height="25" OnClick="btnModificarProductoNoProtegido_Click" />
                <br />
                <br />
                <asp:Button ID="btnEliminarProductoNoProtegido" runat="server" Text="Eliminar" CssClass="boton boton-rojo"
                    Width="80" Height="25" OnClick="btnEliminarProductoNoProtegido_Click" />
            </div>
            <div class="div-clear">
            </div>
        </div>
            <!-- FIN GRILLA ABM PRODUCTOS NO PROTEGIDOS -->
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


<script type="text/javascript">

    function actualizarCONICET() {
        if ($("#<%= chkCONICET.ClientID %>").is(":checked")) $("#pnlCONICET").show(); else $("#pnlCONICET").hide();
    }

    function actualizarIncentivos() {
        if ($("#<%= chkIncentivos.ClientID %>").is(":checked")) $("#pnlIncentivos").show(); else $("#pnlIncentivos").hide();
    }

    function actualizarOtros() {
        if ($("#<%= chkOtros.ClientID %>").is(":checked")) $("#pnlOtros").show(); else $("#pnlOtros").hide();
    }

    function sgwNucleo_alIniciar() {

        $("#<%= chkCONICET.ClientID %>").change(function () { actualizarCONICET(); });
        $("#<%= chkIncentivos.ClientID %>").change(function () { actualizarIncentivos(); });
        $("#<%= chkOtros.ClientID %>").change(function () { actualizarOtros(); });
        actualizarCONICET();
        actualizarIncentivos();
        actualizarOtros();

    }
</script>


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
                        <asp:DropDownList ID="cmbSistemasPromocionOtrosInstitucion" runat="server" Width="400" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbSistemasPromocionOtrosInstitucion_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlSistemasPromocionOtrosOtraInstitucion" runat="server">
                            <asp:Label ID="Label2" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtSistemasPromocionOtrosOtraInstitucion" runat="server" CssClass="axControl" Width="400px"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>
                        <asp:Label ID="Label28" runat="server" Text="* Categoría: " CssClass="axEtiqueta" Width="200"></asp:Label>
                        <asp:TextBox ID="edtSistemasPromocionOtrosCategoria" runat="server" CssClass="axControl"
                            Width="400px"></asp:TextBox>
                        <br />
                        <br />
                    </div>
                </div>
                <!-- FIN DETALLE -->
                <!-- BOTONERA -->
                <div class="botonera-inferior-der">
                    <asp:Button ID="btnGuardarSistemaPromocionOtro" runat="server" Text="Guardar" CssClass="boton boton-verde"
                        Width="90" Height="25" OnClick="btnGuardarSistemaPromocionOtro_Click" />&nbsp;&nbsp;
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
                        <asp:Label ID="Label5" runat="server" Text="* Título del proyecto: " CssClass="axEtiqueta"
                            Width="200"></asp:Label>
                        <asp:TextBox ID="edtProyectosInvestigacionTituloProyecto" runat="server" CssClass="axControl"
                            Width="400px"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="* Institución: " CssClass="axEtiqueta" Width="200"></asp:Label>
                        <asp:DropDownList ID="cmbProyectosInvestigacionInstitucion" runat="server" Width="400" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbProyectosInvestigacionInstitucion_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlProyectosInvestigacionOtraInstitucion" runat="server">
                            <asp:Label ID="Label4" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta" Width="250"></asp:Label>
                            <asp:TextBox ID="edtProyectosInvestigacionOtraInstitucion" runat="server" CssClass="axControl" Width="400px"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>
                        <asp:Label ID="Label6" runat="server" Text="* Institución evaluadora: " CssClass="axEtiqueta" Width="200"></asp:Label>
                        <asp:DropDownList ID="cmbProyectosInvestigacionInstEval" runat="server" Width="400" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbProyectosInvestigacionInstEval_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlProyectosInvestigacionOtraInstEval" runat="server">
                            <asp:Label ID="Label12" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta" Width="250"></asp:Label>
                            <asp:TextBox ID="edtProyectosInvestigacionOtraInstEval" runat="server" CssClass="axControl" Width="400px"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>
                        <asp:Label ID="Lable957" runat="server" Text="* Institución financiadora: " CssClass="axEtiqueta" Width="200"></asp:Label>
                        <asp:DropDownList ID="cmbProyectosInvestigacionInstFinan" runat="server" Width="400" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbProyectosInvestigacionInstFinan_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlProyectosInvestigacionOtraInstFinan" runat="server">
                            <asp:Label ID="Label59" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta" Width="250"></asp:Label>
                            <asp:TextBox ID="edtProyectosInvestigacionOtraInstFinan" runat="server" CssClass="axControl" Width="400px"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>
                        <div class="div-mitad" style="width: 60%">
                            <asp:Label ID="Label8" runat="server" Text="* Fecha de inicio: " CssClass="axEtiqueta"
                                Width="200"></asp:Label>
                            <asp:TextBox ID="edtProyectosInvestigacionFechaInicio" runat="server" CssClass="axControl"
                                Width="100" placeholder="dd/mm/aaaa"></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" TargetControlID="edtProyectosInvestigacionFechaInicio">
                            </asp:CalendarExtender>
                        </div>
                        <div class="div-mitad" style="width: 40%">
                            <asp:Label ID="Label43" runat="server" Text="Fecha de finalización: " CssClass="axEtiqueta"
                                Width="150"></asp:Label>
                            <asp:TextBox ID="edtProyectosInvestigacionFechaFinalizacion" runat="server" CssClass="axControl"
                                Width="100" placeholder="dd/mm/aaaa"></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender3" runat="server" Format="dd/MM/yyyy" TargetControlID="edtProyectosInvestigacionFechaFinalizacion">
                            </asp:CalendarExtender>
                        </div>
                        <br />
                        <br />
                        <br />
                        <!-- RADIOBUTTON CARACTER PARTICIPACION -->
                        <div>
                            <div style="clear: none; float: left; margin-top: 6px">
                                <asp:Label ID="Label9" runat="server" Text="* Carácter de la participación: "
                                    CssClass="axEtiqueta" Width="240px"></asp:Label>
                            </div>
                            <div style="clear: none; float: left; margin-top: -1px;">
                                <dxe:ASPxRadioButtonList ID="rdbProyectosInvestigacionCaracterParticipacion" runat="server"
                                    Width="150px" Height="18px" SelectedIndex="1" RepeatDirection="Horizontal"  Font-Names="'Trebuchet MS', Tahoma, Arial" Font-Size="13px" Border-BorderStyle="None" ItemSpacing="10" CssClass="axEtiqueta">
                                    <Items>
                                        <dxe:ListEditItem Text="Director/Codirector" Value="0" />
                                        <dxe:ListEditItem Text="Investigador" Value="1" />
                                    </Items>
                                </dxe:ASPxRadioButtonList>
                            </div>
                        </div>
                        <!-- FIN RADIOBUTTON CARACTER PARTICIPACION -->
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="Label17" runat="server" Text="* Principales resultados: " Style="autosize"
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
                    <asp:Button ID="btnGuardarProyectoInvestigacion" runat="server" Text="Guardar" CssClass="boton boton-verde"
                        Width="90" Height="25" OnClick="btnGuardarProyectoInvestigacion_Click" />&nbsp;&nbsp;
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
            ClientInstanceName="popup" HeaderText="Agregar/Modificar publicaciones con arbitraje"
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
                            <asp:Label ID="Label24" runat="server" Text="* Autores: " CssClass="axEtiqueta"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasConArbitrajeAutores" runat="server" CssClass="axControl"
                                Width="100%" Style="max-width: 100%"></asp:TextBox>
                            <br />
                            <br />
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
                            <asp:Label ID="Label27" runat="server" Text="* Año: " CssClass="axEtiqueta" Width="120"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasConArbitrajeAnio" runat="server" CssClass="axControl"
                                Width="50px"></asp:TextBox>
                            <asp:Label ID="Label7" runat="server" Text="* Volumen: " CssClass="axEtiqueta" Width="120"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasConArbitrajeVolumen" runat="server" CssClass="axControl"
                                Width="50px"></asp:TextBox>
                            <asp:Label ID="Label29" runat="server" Text="* Páginas: " CssClass="axEtiqueta" Width="120"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasConArbitrajePaginas" runat="server" CssClass="axControl"
                                Width="120px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label31" runat="server" Text="Sitio web con información: " CssClass="axEtiqueta"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasConArbitrajeURL" runat="server"
                                CssClass="axControl" Width="100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label21" runat="server" Text="Palabras clave: " CssClass="axEtiqueta"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasConArbitrajePalabrasClave" runat="server"
                                CssClass="axControl" Width="100%"></asp:TextBox>
                            <br />
                            <span class="axEtiquetaAyuda">Ingrese palabras o frases que identifiquen su contenido, separadas por comas.</span>
                            <br />
                        </div>
                    </div>
                    <!-- FIN DETALLE -->
                    <br />
                    <!-- BOTONERA -->
                    <div class="botonera-inferior-der">
                        <asp:Button ID="btnGuardarPublicacionRevistaConArbitraje" runat="server" Text="Guardar"
                            CssClass="boton boton-verde" Width="90" Height="25" OnClick="btnGuardarPublicacionRevistaConArbitraje_Click" />&nbsp;&nbsp;
                        <asp:Button ID="btnCancelarPublicacionRevistaConArbitraje" runat="server" Text="Cancelar"
                            CssClass="boton boton-rojo" Width="90" Height="25" OnClick="btnCancelarPublicacionRevistaConArbitraje_Click" />
                    </div>
                    <!-- FIN BOTONERA -->
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>
        <!-- FIN POPUP PUBLICACIONES REVISTAS CON ARBITRAJE -->
        
        
        <!-- POPUP PUBLICACIONES REVISTAS SIN ARBITRAJE -->
        <dxpc:ASPxPopupControl ID="popPublicacionesRevistasSinArbitraje" runat="server" CloseAction="CloseButton"
            Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
            ClientInstanceName="popup" HeaderText="Agregar/Modificar publicaciones sin arbitraje"
            AllowDragging="True" EnableAnimation="True" EnableViewState="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
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
                            <asp:Label ID="Label32" runat="server" Text="* Autores: " CssClass="axEtiquetaIzq"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasSinArbitrajeAutores" runat="server" CssClass="axControl"
                                Width="100%" Style="max-width: 100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label33" runat="server" Text="* Título: " CssClass="axEtiquetaIzq" Width="200px"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasSinArbitrajeTitulo" runat="server" CssClass="axControl"
                                Width="100%" Style="max-width: 100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label34" runat="server" Text="* Revista: " CssClass="axEtiquetaIzq"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasSinArbitrajeRevista" runat="server" CssClass="axControl"
                                Width="100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label35" runat="server" Text="* Año: " CssClass="axEtiqueta" Width="120"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasSinArbitrajeAnio" runat="server" CssClass="axControl"
                                Width="50px"></asp:TextBox>
                            <asp:Label ID="Label36" runat="server" Text="* Volumen: " CssClass="axEtiqueta" Width="120"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasSinArbitrajeVolumen" runat="server" CssClass="axControl"
                                Width="50px"></asp:TextBox>
                            <asp:Label ID="Label37" runat="server" Text="* Páginas: " CssClass="axEtiqueta" Width="120"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasSinArbitrajePaginas" runat="server" CssClass="axControl"
                                Width="120px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label61" runat="server" Text="Sitio web con información: " CssClass="axEtiqueta"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasSinArbitrajeURL" runat="server"
                                CssClass="axControl" Width="100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label153" runat="server" Text="Palabras clave: " CssClass="axEtiqueta"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesRevistasSinArbitrajePalabrasClave" runat="server"
                                CssClass="axControl" Width="100%"></asp:TextBox>
                            <br />
                            <span class="axEtiquetaAyuda">Ingrese palabras o frases que identifiquen su contenido, separadas por comas.</span>
                            <br />
                        </div>
                    </div>
                    <!-- FIN DETALLE -->
                    <br />
                    <!-- BOTONERA-->
                    <div class="botonera-inferior-der">
                        <asp:Button ID="btnGuardarPublicacionRevistaSinArbitraje" runat="server" Text="Guardar"
                            CssClass="boton boton-verde" Width="90" Height="25" OnClick="btnGuardarPublicacionRevistaSinArbitraje_Click" />&nbsp;&nbsp;
                        <asp:Button ID="btnCancelarPublicacionRevistaSinArbitraje" runat="server" Text="Cancelar"
                            CssClass="boton boton-rojo" Width="90" Height="25" OnClick="btnCancelarPublicacionRevistaSinArbitraje_Click" />
                    </div>
                    <!-- FIN BOTONERA-->
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>
        <!-- FIN POPUP PUBLICACIONES REVISTAS SIN ARBITRAJE -->
        
        
        <!-- POPUP PUBLICACIONES CAPITULOS LIBROS -->
        <dxpc:ASPxPopupControl ID="popPublicacionesCapitulosLibros" runat="server" CloseAction="CloseButton"
            Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
            ClientInstanceName="popup" HeaderText="Agregar/Modificar Capítulos de Libros" AllowDragging="True"
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
                            <asp:Label ID="Label39" runat="server" Text="* Autores: " CssClass="axEtiquetaIzq"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesCapitulosLibrosAutores" runat="server" CssClass="axControl"
                                Width="100%" Style="max-width: 100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label40" runat="server" Text="* Título del capítulo: " CssClass="axEtiquetaIzq"
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
                            <asp:Label ID="Label42" runat="server" Text="* Editores del libro: " CssClass="axEtiquetaIzq"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesCapitulosLibrosEditoresLibros" runat="server" CssClass="axControl"
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
                            <asp:Label ID="Label23" runat="server" Text="Sitio web con información: " CssClass="axEtiqueta"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesCapitulosLibrosURL" runat="server"
                                CssClass="axControl" Width="100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label314" runat="server" Text="Palabras clave: " CssClass="axEtiqueta"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesCapitulosLibrosPalabrasClave" runat="server" CssClass="axControl"
                                Width="100%"></asp:TextBox>
                            <br />
                            <span class="axEtiquetaAyuda">Ingrese palabras o frases que identifiquen su contenido, separadas por comas.</span>
                            <br />
                        </div>
                    </div>
                    <!-- FIN DETALLE -->
                    <br />
                    <!-- BOTONERA -->
                    <div class="botonera-inferior-der">
                        <asp:Button ID="btnGuardarPublicacionCapituloLibro" runat="server" Text="Guardar"
                            CssClass="boton boton-verde" Width="90" Height="25" OnClick="btnGuardarPublicacionCapituloLibro_Click" />&nbsp;&nbsp;
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
                            <asp:Label ID="Label49" runat="server" Text="* Autores: " CssClass="axEtiquetaIzq"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesLibrosAutores" runat="server" CssClass="axControl"
                                Width="100%" Style="max-width: 100%"></asp:TextBox>
                            <br />
                            <br />
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
                            <asp:Label ID="Label38" runat="server" Text="Sitio web con información: " CssClass="axEtiqueta"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesLibrosURL" runat="server"
                                CssClass="axControl" Width="100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label16" runat="server" Text="Palabras clave: " CssClass="axEtiqueta"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesLibrosPalabrasClave" runat="server" CssClass="axControl"
                                Width="100%"></asp:TextBox>
                            <br />
                            <span class="axEtiquetaAyuda">Ingrese palabras o frases que identifiquen su contenido, separadas por comas.</span>
                            <br />
                        </div>
                    </div>
                    <!-- FIN DETALLE -->
                    <br />
                    <!-- BOTONERA -->
                    <div class="botonera-inferior-der">
                        <asp:Button ID="btnGuardarPublicacionLibro" runat="server" Text="Guardar" CssClass="boton boton-verde"
                            Width="90" Height="25" OnClick="btnGuardarPublicacionLibro_Click" />&nbsp;&nbsp;
                        <asp:Button ID="btnCancelarPublicacionLibro" runat="server" Text="Cancelar" CssClass="boton boton-rojo"
                            Width="90" Height="25" OnClick="btnCancelarPublicacionLibro_Click" />
                    </div>
                    <!-- FIN BOTONERA -->
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>
        <!-- FIN POPUP PUBLICACIONES LIBROS -->
        
        
        <!-- POPUP PUBLICACIONES TRABAJOS -->
        <dxpc:ASPxPopupControl ID="popPublicacionesTrabajos" runat="server" CloseAction="CloseButton"
            Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" z-indez="50000"
            ClientInstanceName="popup" HeaderText="Agregar/Modificar presentaciones" AllowDragging="True"
            EnableAnimation="True" EnableViewState="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
            CssPostfix="Glass" ImageFolder="~/App_Themes/Glass/{0}/" EnableHierarchyRecreation="False">
            <SizeGripImage Height="12px" Width="12px" />
            <CloseButtonImage Height="17px" Width="17px" />
            <HeaderStyle Font-Bold="True">
                <Paddings PaddingLeft="10px" PaddingRight="6px" PaddingTop="1px" />
            </HeaderStyle>
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl7" runat="server">
                    <!-- DETALLE -->
                    <div class="divPopup">
                        <div class="div-form-cuadroPopup">
                            <asp:Label ID="Label56" runat="server" Text="* Autores: " CssClass="axEtiquetaIzq"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesTrabajosAutores" runat="server" CssClass="axControl"
                                Width="100%" Style="max-width: 100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label57" runat="server" Text="* Título: " CssClass="axEtiquetaIzq" Width="200px"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesTrabajosTitulo" runat="server" CssClass="axControl"
                                Width="100%" Style="max-width: 100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label11" runat="server" Text="* Evento: " CssClass="axEtiquetaIzq" Width="200px"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesTrabajosEvento" runat="server" CssClass="axControl"
                                Width="100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label133" runat="server" Text="* Lugar de realización: " CssClass="axEtiquetaIzq"
                                Width="200px"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesTrabajosLugarRealizacion" runat="server" CssClass="axControl"
                                Width="100%" Style="margin-top:2px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label60" runat="server" Text="* Año: " CssClass="axEtiqueta" Style="auto-size"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesTrabajosAnio" runat="server" CssClass="axControl"
                                Width="50px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label48" runat="server" Text="Sitio web con información: " CssClass="axEtiqueta"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesTrabajosURL" runat="server"
                                CssClass="axControl" Width="100%"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label214" runat="server" Text="Palabras clave: " CssClass="axEtiqueta"></asp:Label>
                            <asp:TextBox ID="edtPublicacionesTrabajosPalabrasClave" runat="server" CssClass="axControl"
                                Width="100%"></asp:TextBox>
                            <br />
                            <span class="axEtiquetaAyuda">Ingrese palabras o frases que identifiquen su contenido, separadas por comas.</span>
                            <br />
                        </div>
                    </div>
                    <!-- FIN DETALLE -->
                    <br />
                    <!-- BOTONERA -->
                    <div class="botonera-inferior-der">
                        <asp:Button ID="btnGuardarPublicacionTrabajo" runat="server" Text="Guardar" CssClass="boton boton-verde"
                            Width="90" Height="25" OnClick="btnGuardarPublicacionTrabajo_Click" />&nbsp;&nbsp;
                        <asp:Button ID="btnCancelarPublicacionTrabajo" runat="server" Text="Cancelar" CssClass="boton boton-rojo"
                            Width="90" Height="25" OnClick="btnCancelarPublicacionTrabajo_Click" />
                    </div>
                    <!-- FIN BOTONERA -->
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>
        <!-- FIN POPUP PUBLICACIONES TRABAJOS -->
        
        
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
                                    Width="100px" placeholder="dd/mm/aaaa"></asp:TextBox>
                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" TargetControlID="edtProductosProtegidosFechaSolicitud">
                                </asp:CalendarExtender>
                            </div>
                            <div class="div-mitad" style="text-align:right">
                                <asp:Label ID="Label65" runat="server" Text="Fecha de otorgamiento: " CssClass="axEtiqueta"
                                    Width="200"></asp:Label>
                                <asp:TextBox ID="edtProductosProtegidosFechaOtorgamiento" runat="server" CssClass="axControl"
                                    Width="100px" placeholder="dd/mm/aaaa"></asp:TextBox>
                                <asp:CalendarExtender ID="CalendarExtender4" runat="server" Format="dd/MM/yyyy" TargetControlID="edtProductosProtegidosFechaOtorgamiento">
                                </asp:CalendarExtender>
                            </div>
                            <br />
                            <br />
                        </div>
                    </div>
                    <!-- FIN DETALLE -->
                    <br />
                    <!-- BOTONERA -->
                    <div class="botonera-inferior-der">
                        <asp:Button ID="btnGuardarProductoProtegido" runat="server" Text="Guardar" CssClass="boton boton-verde"
                            Width="90" Height="25" OnClick="btnGuardarProductoProtegido_Click" />&nbsp;&nbsp;
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
                        <asp:Button ID="btnGuardarProductoNoProtegido" runat="server" Text="Guardar" CssClass="boton boton-verde"
                            Width="90" Height="25" OnClick="btnGuardarProductoNoProtegido_Click" />&nbsp;&nbsp;
                        <asp:Button ID="btnCancelarProductoNoProtegido" runat="server" Text="Cancelar" CssClass="boton boton-rojo"
                            Width="90" Height="25" OnClick="btnCancelarProductoNoProtegido_Click" />
                    </div>
                    <!-- FIN BOTONERA -->
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>
        <!-- FIN POPUP PRODUCTOS NO PROTEGIDOS -->
        
        

</asp:Content>