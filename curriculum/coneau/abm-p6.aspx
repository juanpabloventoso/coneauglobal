<%@ Page Language="C#" MasterPageFile="../abm.master" AutoEventWireup="true" CodeFile="abm-p6.aspx.cs"
    Inherits="_Default" Title="Desempeño no académico - ATENEA | Currículum Docente" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Central" runat="server">

<h3>6. Desempeño en el ámbito no universitario</h3><br />

<span class="lbl-punto">6.1.</span> Desempeño no académico actual.
<div class="div-punto">

    <table class="tabla-color">
        <tr>
            <td><b>¿Se desempeña actualmente en el ámbito no académico?</b></td>
            <td><asp:CheckBox ID="chkDesempenioNoAcademico" runat="server" /></td>
        </tr>
    </table>

    <div id="pnlDesempenioNoAcademico">
        <br />
        Complete el siguiente cuadro con cada uno de los cargos/funciones que desempeña actualmente.
        <br />
        <!-- GRILLA ABM CARGOS NO ACADEMICOS -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
            <dxwgv:ASPxGridView ID="grdCargosNoAcademicosABM" runat="server" AutoGenerateColumns="False"
                CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="800px"
                KeyFieldName="ID_CARGOS_NO_DOCENTES">
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
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarCargoNoAcademico"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarCargoNoAcademico"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución" FieldName="INSTITUCION"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Cargo/Función" FieldName="CARGO"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Modalidad" FieldName="TIPO_DURACION_DED"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Dedicación semanal" FieldName="DEDICACION_SEMANAL"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataDateColumn Caption="Fecha de inicio" FieldName="FECHA_INICIO" SortOrder="Descending"><PropertiesDateEdit DisplayFormatString="{0:d}"></PropertiesDateEdit></dxwgv:GridViewDataDateColumn>
                    <dxwgv:GridViewDataDateColumn Caption="Fecha de finalización" FieldName="FECHA_FINALIZACION"><PropertiesDateEdit DisplayFormatString="{0:d}"></PropertiesDateEdit></dxwgv:GridViewDataDateColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Disciplina" FieldName="DISCIPLINA"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Subdisciplina" FieldName="SUBDISCIPLINA"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID" Visible="false" VisibleIndex="6" FieldName="ID_CARGOS_NO_DOCENTES"></dxwgv:GridViewDataTextColumn>
                </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarCargoNoAcademico') { btnModificarCargoNoAcademico_Click(); }
                  if (e.buttonID == 'btngrdEliminarCargoNoAcademico') { btnEliminarCargoNoAcademico_Click(); }
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
            function btnModificarCargoNoAcademico_Click() { $('#<%= btnModificarCargoNoAcademico.ClientID %>')[0].click(); }
            function btnEliminarCargoNoAcademico_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarCargoNoAcademico.ClientID %>')[0].click(); }
        </script>
            <asp:Button ID="btnAgregarCargoNoAcademico" runat="server" Text="+" title="Nuevo" CssClass="boton-grilla-agregar" OnClick="btnAgregarCargoNoAcademico_Click" />
        <div class="div-abm-botonera-derecha">
            <br />
            <br />
            <asp:Button ID="btnModificarCargoNoAcademico" runat="server" Text="Modificar" CssClass="boton boton-azul"
                Width="80" Height="25" OnClick="btnModificarCargoNoAcademico_Click" />
            <br />
            <br />
            <asp:Button ID="btnEliminarCargoNoAcademico" runat="server" Text="Eliminar" CssClass="boton boton-rojo"
                Width="80" Height="25" OnClick="btnEliminarCargoNoAcademico_Click" />
        </div>
        </div>
        <br />
        
        
        Si es docente en carreras de ciencias de la salud, complete el siguiente
        cuadro con la actividad hospitalaria actual.
        <br />
        <!-- GRILLA ABM ACTIVIDADES HOSPITALARIAS -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
            <dxwgv:ASPxGridView ID="grdCargosHospitalarios" runat="server" AutoGenerateColumns="False"
                CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="800px"
                KeyFieldName="ID_CARGOS_HOSPITALARIOS">
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
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarActividadHospitalaria"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarActividadHospitalaria"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución" VisibleIndex="1" FieldName="INSTITUCION">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Servicio" VisibleIndex="2" FieldName="AMBITO_HOSPITALARIO">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Cargo/Función" VisibleIndex="3" FieldName="CARGO">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataDateColumn Caption="Fecha de inicio" FieldName="FECHA_INICIO" SortOrder="Descending">
                        <PropertiesDateEdit DisplayFormatString="{0:d}"></PropertiesDateEdit>
                    </dxwgv:GridViewDataDateColumn>
                     <dxwgv:GridViewDataDateColumn Caption="Fecha de finalizacion" FieldName="FECHA_FINALIZACION" SortOrder="Descending">
                        <PropertiesDateEdit DisplayFormatString="{0:d}"></PropertiesDateEdit>
                    </dxwgv:GridViewDataDateColumn>
                </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarActividadHospitalaria') { btnModificarActividadHospitalaria_Click(); }
                  if (e.buttonID == 'btngrdEliminarActividadHospitalaria') { btnEliminarActividadHospitalaria_Click(); }
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
            function btnModificarCargosHospitalarios_Click() { $('#<%= btnModificarActividadHospitalaria.ClientID %>')[0].click(); }
            function btnEliminarCargosHospitalarios_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarActividadHospitalaria.ClientID %>')[0].click(); }
        </script>
            <asp:Button ID="btnAgregarActividadHospitalaria" runat="server" Text="+" title="Nuevo" CssClass="boton-grilla-agregar" OnClick="btnAgregarCargosHospitalarios_Click" />
        <div class="div-abm-botonera-derecha">
            <br />
            <br />
            <asp:Button ID="btnModificarActividadHospitalaria" runat="server" Text="Modificar"
                CssClass="boton boton-azul" Width="80" Height="25" OnClick="btnModificarCargosHospitalarios_Click" />
            <br />
            <br />
            <asp:Button ID="btnEliminarActividadHospitalaria" runat="server" Text="Eliminar"
                CssClass="boton boton-rojo" Width="80" Height="25" OnClick="btnEliminarCargosHospitalarios_Click" />
        </div>
        <!-- FIN GRILLA ABM ACTIVIDADES HOSPITALARIAS -->
        <div class="div-clear">
        </div>
        </div>
    </div>
</div>



<span class="lbl-punto">6.2.</span> Desempeño no académico pasado.
<div class="div-punto">
        Elaborar un cuadro por cada cargo/función en el ámbito no académico desempeñado
        en el pasado. No incluir su desempeño actual.

        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
            <dxwgv:ASPxGridView ID="grdCargosNoAcademicosABMP" runat="server" AutoGenerateColumns="False"
                CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="800px"
                KeyFieldName="ID_CARGOS_NO_DOCENTES">
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
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarCargoNoAcademicoP"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarCargoNoAcademicoP"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución" FieldName="INSTITUCION"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Cargo/Función" FieldName="CARGO"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Modalidad" FieldName="TIPO_DURACION_DED"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Dedicación semanal" FieldName="DEDICACION_SEMANAL"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataDateColumn Caption="Fecha de inicio" FieldName="FECHA_INICIO" SortOrder="Descending"><PropertiesDateEdit DisplayFormatString="{0:d}"></PropertiesDateEdit></dxwgv:GridViewDataDateColumn>
                    <dxwgv:GridViewDataDateColumn Caption="Fecha de finalización" FieldName="FECHA_FINALIZACION"><PropertiesDateEdit DisplayFormatString="{0:d}"></PropertiesDateEdit></dxwgv:GridViewDataDateColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Disciplina" FieldName="DISCIPLINA"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Subdisciplina" FieldName="SUBDISCIPLINA"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID" Visible="false" VisibleIndex="6" FieldName="ID_CARGOS_NO_DOCENTES"></dxwgv:GridViewDataTextColumn>
                </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarCargoNoAcademicoP') { btnModificarCargoNoAcademicoP_Click(); }
                  if (e.buttonID == 'btngrdEliminarCargoNoAcademicoP') { btnEliminarCargoNoAcademicoP_Click(); }
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
            function btnModificarCargoNoAcademicoP_Click() { $('#<%= btnModificarCargoNoAcademicoP.ClientID %>')[0].click(); }
            function btnEliminarCargoNoAcademicoP_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarCargoNoAcademicoP.ClientID %>')[0].click(); }
        </script>
            <asp:Button ID="btnAgregarCargoNoAcademicoP" runat="server" Text="+" title="Nuevo" CssClass="boton-grilla-agregar" OnClick="btnAgregarCargoNoAcademicoP_Click" />
        <div class="div-abm-botonera-derecha">
            <br />
            <br />
            <asp:Button ID="btnModificarCargoNoAcademicoP" runat="server" Text="Modificar" CssClass="boton boton-azul"
                Width="80" Height="25" OnClick="btnModificarCargoNoAcademicoP_Click" />
            <br />
            <br />
            <asp:Button ID="btnEliminarCargoNoAcademicoP" runat="server" Text="Eliminar" CssClass="boton boton-rojo"
                Width="80" Height="25" OnClick="btnEliminarCargoNoAcademicoP_Click" />
        </div>
        </div>
</div>


<script type="text/javascript">

    function actualizarDesempenioNoAcademico() {
        if ($("#<%= chkDesempenioNoAcademico.ClientID %>").is(":checked")) $("#pnlDesempenioNoAcademico").show(); else $("#pnlDesempenioNoAcademico").hide();
    }


    function sgwNucleo_alIniciar() {

        $("#<%= chkDesempenioNoAcademico.ClientID %>").change(function () { actualizarDesempenioNoAcademico(); });
        actualizarDesempenioNoAcademico();

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

    <!-- POPUP CARGOS NO ACADEMICOS -->
    <dxpc:ASPxPopupControl ID="popCargosNoAcademicos" runat="server" CloseAction="CloseButton"
        Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popup" HeaderText="Desempeño no académico"
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
                <div class="divPopup" style="width:670px">
                    <div class="div-form-cuadroPopup">
                         <asp:Label ID="Label27" runat="server" Text="* Institución: " CssClass="axEtiqueta"
                            Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbCargoNoAcademicoInstitucion" runat="server" Width="400px"
                            CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCargoNoAcademicoInstitucion_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <asp:Panel ID="pnlCargoNoAcademicoInstitucion" runat="server">
                            <br />
                            <asp:Label ID="Label11" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta"
                                Width="200"></asp:Label>
                            <asp:TextBox ID="edtOtraCargoNoAcademicoInstitucion" runat="server" CssClass="axControl"
                                Width="400"></asp:TextBox>
                        </asp:Panel>
                       
                        <br />
                        <asp:Label ID="Label10" runat="server" Text="* Cargo/Función: " CssClass="axEtiqueta"
                            Width="150"></asp:Label>
                        <asp:TextBox ID="edtCargosNoAcademicosCargoFuncion" runat="server" CssClass="axControl"
                            Width="400px"></asp:TextBox>
                        <br />
                        <br />
                        <div class="div-mitad" style="width: 45%">
                            <asp:Label ID="Label14" runat="server" Text="* Dedicación semanal: " CssClass="axEtiqueta" Width="150"></asp:Label>
                            <asp:TextBox ID="edtCargosNoAcademicosHsRelojSemanales" runat="server" CssClass="axControl" Width="50px"></asp:TextBox>
                            <asp:Label ID="Label16" runat="server" Text="horas reloj" CssClass="axEtiqueta"></asp:Label>
                        </div>
                        <div class="div-mitad" style="width: 55%">
                            <asp:Label ID="Label32" runat="server" Text="* Modalidad: " CssClass="axEtiqueta" Width="100"></asp:Label>
                            <asp:DropDownList ID="cmbCargosNoAcademicosSemanasAnual" runat="server" CssClass="axControl" Width="150"></asp:DropDownList>
                        </div>
                        <div class="div-clear"></div>
                        <br />
                        <div class="div-mitad">
                            <asp:Label ID="Label17" runat="server" Text="* Fecha de inicio: " CssClass="axEtiqueta" Width="150"></asp:Label>
                            <asp:TextBox ID="edtCargosNoAcademicosFechaInicio" runat="server" CssClass="axControl" Width="100" placeholder="dd/mm/aaaa"></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" TargetControlID="edtCargosNoAcademicosFechaInicio">
                            </asp:CalendarExtender>
                        </div>
                        <div class="div-mitad">
                            <asp:Label ID="Label28" runat="server" Text="Fecha de finalización: " CssClass="axEtiqueta" Width="150"></asp:Label>
                            <asp:TextBox ID="edtCargosNoAcademicosFechaFinalizacion" runat="server" CssClass="axControl" Width="100" placeholder="dd/mm/aaaa"></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender6" runat="server" Format="dd/MM/yyyy" TargetControlID="edtCargosNoAcademicosFechaFinalizacion">
                            </asp:CalendarExtender>
                        </div>
                        <div class="div-clear"></div>
                        <br />
                        <span class="axEtiquetaAyuda">Deje la fecha de finalización en blanco para los cargos actuales. Si completa una fecha de finalización, el cargo pasará al punto 6.2.</span>
                        <br />
                        <br />
                        <asp:Label ID="Label41" runat="server" Text="* Disciplina: " CssClass="axEtiqueta"
                            Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbCargosNoAcademicosDisciplina" runat="server" Width="300"
                            CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCargosNoAcademicosDisciplina_SelectedIndexChanged"> 
                        </asp:DropDownList>
                        <br />
                        <asp:Panel ID="pnlCargosNoAcademicosOtraDisciplina" runat="server">
                            <br />
                            <asp:Label ID="Label9" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta"
                                Width="200"></asp:Label>
                            <asp:TextBox ID="edtCargosNoAcademicosOtraDisciplina" runat="server" Width="300"
                                CssClass="axControl"></asp:TextBox>
                        </asp:Panel>
                        <br />
                        <asp:Label ID="Label42" runat="server" Text="* Subdisciplina: " CssClass="axEtiqueta"
                            Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbCargosNoAcademicosSubdisciplina" runat="server" Width="300"
                            CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCargosNoAcademicosSubdisciplina_SelectedIndexChanged">
                        </asp:DropDownList>
                        <br />
                        <asp:Panel ID="pnlCargosNoAcademicosOtraSubdisciplina" runat="server">
                            <br />
                            <asp:Label ID="Label13" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta"
                                Width="200"></asp:Label>
                            <asp:TextBox ID="edtCargosNoAcademicosOtraSubdisciplina" runat="server" Width="300"
                                CssClass="axControl"></asp:TextBox>
                        </asp:Panel>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Describir sus funciones, responsabilidades, indicando si tuvo personal a su cargo: "
                            Style="autosize" CssClass="axEtiqueta"></asp:Label>
                        <br />
                        <asp:TextBox ID="edtCargosNoAcademicosFunciones" runat="server" Width="100%" Style="max-width: 100%; margin-top:2px"
                            CssClass="axControl" TextMode="MultiLine"></asp:TextBox>
                        <br />
                        <br />
                    </div>
                </div>
                <!-- FIN DETALLE -->
                <!-- BOTONERA -->
                <div class="botonera-inferior-der">
                    <asp:Button ID="btnGuardarCargoNoAcademico" runat="server" Text="Guardar" CssClass="boton boton-verde"
                        Width="90" Height="25" OnClick="btnAceptarCargoNoAcademico_Click" />&nbsp;&nbsp;
                    <asp:Button ID="btnCancelarCargoNoAcademico" runat="server" Text="Cancelar" CssClass="boton boton-rojo"
                        Width="90" Height="25" OnClick="btnCancelarCargoNoAcademico_Click" />
                </div>
                <!-- FIN BOTONERA -->
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP CARGOS NO ACADEMICOS -->
    
    
    

    <!-- POPUP CARGOS NO ACADEMICOS PASADOS -->
    <dxpc:ASPxPopupControl ID="popCargosNoAcademicosP" runat="server" CloseAction="CloseButton"
        Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popup" HeaderText="Desempeño no académico"
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
                <div class="divPopup" style="width:670px">
                    <div class="div-form-cuadroPopup">
                         <asp:Label ID="Label5" runat="server" Text="* Institución: " CssClass="axEtiqueta"
                            Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbCargoNoAcademicoInstitucionP" runat="server" Width="400px"
                            CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCargoNoAcademicoInstitucionP_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <asp:Panel ID="pnlCargoNoAcademicoInstitucionP" runat="server">
                            <br />
                            <asp:Label ID="Label6" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta"
                                Width="200"></asp:Label>
                            <asp:TextBox ID="edtOtraCargoNoAcademicoInstitucionP" runat="server" CssClass="axControl"
                                Width="400"></asp:TextBox>
                        </asp:Panel>
                       
                        <br />
                        <asp:Label ID="Label8" runat="server" Text="* Cargo/Función: " CssClass="axEtiqueta"
                            Width="150"></asp:Label>
                        <asp:TextBox ID="edtCargosNoAcademicosCargoFuncionP" runat="server" CssClass="axControl"
                            Width="400px"></asp:TextBox>
                        <br />
                        <br />
                        <div class="div-mitad" style="width: 45%">
                            <asp:Label ID="Label29" runat="server" Text="* Dedicación semanal: " CssClass="axEtiqueta" Width="150"></asp:Label>
                            <asp:TextBox ID="edtCargosNoAcademicosHsRelojSemanalesP" runat="server" CssClass="axControl" Width="50px"></asp:TextBox>
                            <asp:Label ID="Label30" runat="server" Text="horas reloj" CssClass="axEtiqueta"></asp:Label>
                        </div>
                        <div class="div-mitad" style="width: 55%">
                            <asp:Label ID="Label31" runat="server" Text="* Modalidad: " CssClass="axEtiqueta" Width="100"></asp:Label>
                            <asp:DropDownList ID="cmbCargosNoAcademicosSemanasAnualP" runat="server" CssClass="axControl" Width="150"></asp:DropDownList>
                        </div>
                        <div class="div-clear"></div>
                        <br />
                        <div class="div-mitad">
                            <asp:Label ID="Label25" runat="server" Text="* Fecha de inicio: " CssClass="axEtiqueta" Width="150"></asp:Label>
                            <asp:TextBox ID="edtCargosNoAcademicosFechaInicioP" runat="server" CssClass="axControl" Width="100" placeholder="dd/mm/aaaa"></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender3" runat="server" Format="dd/MM/yyyy" TargetControlID="edtCargosNoAcademicosFechaInicioP">
                            </asp:CalendarExtender>
                        </div>
                        <div class="div-mitad">
                            <asp:Label ID="Label26" runat="server" Text="Fecha de finalización: " CssClass="axEtiqueta" Width="150"></asp:Label>
                            <asp:TextBox ID="edtCargosNoAcademicosFechaFinalizacionP" runat="server" CssClass="axControl" Width="100" placeholder="dd/mm/aaaa"></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender13" runat="server" Format="dd/MM/yyyy" TargetControlID="edtCargosNoAcademicosFechaFinalizacionP">
                            </asp:CalendarExtender>
                        </div>
                        <div class="div-clear"></div>
                        <br />
                        <asp:Label ID="Label18" runat="server" Text="* Disciplina: " CssClass="axEtiqueta"
                            Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbCargosNoAcademicosDisciplinaP" runat="server" Width="300"
                            CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCargosNoAcademicosDisciplinaP_SelectedIndexChanged"> 
                        </asp:DropDownList>
                        <br />
                        <asp:Panel ID="pnlCargosNoAcademicosOtraDisciplinaP" runat="server">
                            <br />
                            <asp:Label ID="Label19" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta"
                                Width="200"></asp:Label>
                            <asp:TextBox ID="edtCargosNoAcademicosOtraDisciplinaP" runat="server" Width="300"
                                CssClass="axControl"></asp:TextBox>
                        </asp:Panel>
                        <br />
                        <asp:Label ID="Label22" runat="server" Text="* Subdisciplina: " CssClass="axEtiqueta"
                            Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbCargosNoAcademicosSubdisciplinaP" runat="server" Width="300"
                            CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCargosNoAcademicosSubdisciplinaP_SelectedIndexChanged">
                        </asp:DropDownList>
                        <br />
                        <asp:Panel ID="pnlCargosNoAcademicosOtraSubdisciplinaP" runat="server">
                            <br />
                            <asp:Label ID="Label23" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta"
                                Width="200"></asp:Label>
                            <asp:TextBox ID="edtCargosNoAcademicosOtraSubdisciplinaP" runat="server" Width="300"
                                CssClass="axControl"></asp:TextBox>
                        </asp:Panel>
                        <br />
                        <asp:Label ID="Label24" runat="server" Text="Describir sus funciones, responsabilidades, indicando si tuvo personal a su cargo: "
                            Style="autosize" CssClass="axEtiqueta"></asp:Label>
                        <br />
                        <asp:TextBox ID="edtCargosNoAcademicosFuncionesP" runat="server" Width="100%" Style="max-width: 100%; margin-top:2px"
                            CssClass="axControl" TextMode="MultiLine"></asp:TextBox>
                        <br />
                        <br />
                    </div>
                </div>
                <!-- FIN DETALLE -->
                <!-- BOTONERA -->
                <div class="botonera-inferior-der">
                    <asp:Button ID="btnGuardarCargoNoAcademicoP" runat="server" Text="Guardar" CssClass="boton boton-verde"
                        Width="90" Height="25" OnClick="btnAceptarCargoNoAcademicoP_Click" />&nbsp;&nbsp;
                    <asp:Button ID="btnCancelarCargoNoAcademicoP" runat="server" Text="Cancelar" CssClass="boton boton-rojo"
                        Width="90" Height="25" OnClick="btnCancelarCargoNoAcademicoP_Click" />
                </div>
                <!-- FIN BOTONERA -->
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP CARGOS NO ACADEMICOS -->    
    
    <!-- POPUP ACTIVIDADES HOSPITALARIAS -->
    <dxpc:ASPxPopupControl ID="popCargosHospitalarios" runat="server" CloseAction="CloseButton"
        Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popup" HeaderText="Actividad hospitalaria"
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
                    <div class="divPopup" style="width:670px">
                    <div class="div-form-cuadroPopup">
                        <asp:Label ID="Label3" runat="server" Text="* Institución: " CssClass="axEtiqueta"
                            Width="200"></asp:Label>
                        <asp:DropDownList ID="cmbCargosHospitalariosInstitucion" runat="server" Width="400px"
                            CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCargosHospitalariosInstitucion_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <asp:Panel ID="pnlCargosHospitalarios" runat="server">
                            <br />
                            <asp:Label ID="Label20" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta"
                                Width="240px"></asp:Label>
                            <asp:TextBox ID="edtCargosHospitalariosInstitucionOtra" runat="server" CssClass="axControl"
                                Width="400"></asp:TextBox>
                        </asp:Panel>
                        <br />
                        <asp:Label ID="Label7" runat="server" Text="* Servicio: " CssClass="axEtiqueta" Width="200px"></asp:Label>
                        <asp:TextBox ID="edtActividadesHospitalariasServicio" runat="server" CssClass="axControl"
                            Width="400px"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="* Cargo/Función: " CssClass="axEtiqueta"
                            Width="200px"></asp:Label>
                        <asp:TextBox ID="edtActividadesHospitalariasCargoFuncion" runat="server" CssClass="axControl"
                            Width="400px"></asp:TextBox>
                        <br />
                        <br />
                         <asp:Label ID="Label12" runat="server" Text="* Fecha de inicio: " CssClass="axEtiqueta"
                            Width="240px"></asp:Label>
                        <asp:TextBox ID="edtCargosHospitalariosFechaInicio" runat="server" CssClass="axControl"
                            Width="100px" placeholder="dd/mm/aaaa"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender4" runat="server" Format="dd/MM/yyyy" TargetControlID="edtCargosHospitalariosFechaInicio">
                        </asp:CalendarExtender>
                        <br />
                        <br />
                          <asp:Label ID="Label21" runat="server" Text="Fecha de finalización: " CssClass="axEtiqueta"
                            Width="240px"></asp:Label>
                        <asp:TextBox ID="edtCargosHospitalariosFechaFinalizacion" runat="server" CssClass="axControl"
                            Width="100px" placeholder="dd/mm/aaaa"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender5" runat="server" Format="dd/MM/yyyy" TargetControlID="edtCargosHospitalariosFechaFinalizacion">
                        </asp:CalendarExtender>
                        <br />
                        <br />
                    </div>
                </div>
                <!-- FIN DETALLE -->
                <!-- BOTONERA -->
                <div class="botonera-inferior-der">
                    <asp:Button ID="btnAceptarCargosHospitalarios" runat="server" Text="Guardar" CssClass="boton boton-verde"
                        Width="90" Height="25" OnClick="btnAceptarCargosHospitalarios_Click" />&nbsp;&nbsp;
                    <asp:Button ID="btnCancelarActividadHospitalaria" runat="server" Text="Cancelar"
                        CssClass="boton boton-rojo" Width="90" Height="25" OnClick="btnCancelarCargosHospitalarios_Click" />
                </div>
                <!-- FIN BOTONERA -->
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP ACTIVIDADES HOSPITALARIAS -->
    
    

</asp:Content>