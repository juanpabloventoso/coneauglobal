<%@ Page Language="C#" MasterPageFile="../abm.master" AutoEventWireup="true" CodeFile="abm-p4.aspx.cs"
    Inherits="_Default" Title="Docencia universitaria - ATENEA | Currículum Docente" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Central" runat="server">

<h3>4. Docencia universitaria</h3><br />


<span class="lbl-punto">4.1.</span> Situación actual. Complete un cuadro por cada cargo docente que desempeña actualmente.
<div class="div-punto">
        <!-- GRILLA ABM CARGOS DOCENTES ACTUAL -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
            <dxwgv:ASPxGridView ID="grdCargosDocentesActual" runat="server" AutoGenerateColumns="False"
                CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="800px"
                KeyFieldName="ID_CARGOS_DOCENTES">
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
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarDocenteActual"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarDocenteActual"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID" Visible="false" FieldName="ID_CARGOS_DOCENTES"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución Universitaria" FieldName="INSTITUCION"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Unidad Académica" FieldName="UNIDAD_ACADEMICA"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Cargo" FieldName="CARGO"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Modalidad" FieldName="TIPO_DURACION_DED"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Dedicación semanal" FieldName="DEDICACION_SEMANAL"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Designación" FieldName="TIPO_DESIGNACION"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Disciplina" FieldName="DISCIPLINA"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Subdisciplina" FieldName="SUBDISCIPLINA"></dxwgv:GridViewDataTextColumn>
                </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarDocenteActual') { btnModificarDocenteActual_Click(); }
                  if (e.buttonID == 'btngrdEliminarDocenteActual') { btnEliminarDocenteActual_Click(); }
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
            function btnModificarDocenteActual_Click() { $('#<%= btnModificarDocenteActual.ClientID %>')[0].click(); }
            function btnEliminarDocenteActual_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarDocenteActual.ClientID %>')[0].click(); }
        </script>
        <asp:Button ID="btnAgregarCargoDocenteActual" runat="server" Text="+" Title="Nuevo" CssClass="boton-grilla-agregar" OnClick="btnAgregarCargoDocenteActual_Click" />
        <div class="div-abm-botonera-derecha">
            
            <br />
            <br />
            <asp:Button ID="btnModificarDocenteActual" runat="server" Text="Modificar" CssClass="boton boton-azul"
                Width="80" Height="25" OnClick="btnModificarDocenteActual_Click" />
            <br />
            <br />
            <asp:Button ID="btnEliminarDocenteActual" runat="server" Text="Eliminar" CssClass="boton boton-rojo"
                Width="80" Height="25" OnClick="btnEliminarDocenteActual_Click" />
        </div>
        <!-- FIN GRILLA ABM CARGOS DOCENTES ACTUAL -->
        <div class="div-clear">
        </div>
    </div>
</div>
    
    
<span class="lbl-punto">4.2.</span> Trayectoria. Complete un cuadro por cada cargo docente desempeñado en el pasado.
<div class="div-punto">
    Complete un cuadro por cada cargo desempeñado en el pasado como profesor
    (adjunto, asociado, titular o categorías equivalentes). No incluir su desempeño
    actual. En el caso de haber ocupado un cargo como docente auxiliar (jefe
    de trabajos prácticos, ayudante o categorías equivalentes) llenar un cuadro genérico
    por cada institución en la que se haya desempeñado.
    <br />
        <!-- GRILLA ABM CARGOS DOCENTES PASADO -->
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
            <dxwgv:ASPxGridView ID="grdCargosDocentesPasado" runat="server" AutoGenerateColumns="False"
                CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="880px"
                KeyFieldName="ID_CARGOS_DOCENTES">
                <SettingsBehavior AllowFocusedRow="True" />
                <Styles CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass">
                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                    </Header>
                        <Cell VerticalAlign="Middle" Wrap="False"><Paddings Padding="8px" /></Cell>
                </Styles>
                <SettingsText EmptyDataRow="No hay información disponible." CommandCancel="Cancelar"
                    CommandClearFilter="Limpiar" CommandDelete="Eliminar" CommandEdit="Modificar"
                    CommandNew="Nuevo" CommandSelect="Seleciconar" CommandUpdate="Actualizar" ConfirmDelete="Eliminar"
                    CustomizationWindowCaption="Personalizar" EmptyHeaders="Vaciar encabezados" FilterBarClear="Limpiar"
                    FilterBarCreateFilter="Crear" FilterControlPopupCaption="Filtros" GroupContinuedOnNextPage="Continúa en la página siguiente"
                    GroupPanel="Arrastre una columna para agrupar por ese criterio." HeaderFilterShowAll="Mostrar todo"
                    PopupEditFormCaption="Editar" Title="Datos" />
                <Columns>
                    <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;Acciones&nbsp;&nbsp;" ButtonType="Image"><CustomButtons>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarDocentePasado"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarDocentePasado"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID" Visible="false" FieldName="ID_CARGOS_DOCENTES"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución Universitaria" FieldName="INSTITUCION"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Unidad Académica" FieldName="UNIDAD_ACADEMICA"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Cargo" FieldName="CARGO"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Modalidad" FieldName="TIPO_DURACION_DED"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Dedicación semanal" FieldName="DEDICACION_SEMANAL"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Designación" FieldName="TIPO_DESIGNACION"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Disciplina" FieldName="DISCIPLINA"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Subdisciplina" FieldName="SUBDISCIPLINA"></dxwgv:GridViewDataTextColumn>
                </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarDocentePasado') { btnModificarCargoDocentePasado_Click(); }
                  if (e.buttonID == 'btngrdEliminarDocentePasado') { btnEliminarCargoDocentePasado_Click(); }
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
            function btnModificarCargoDocentePasado_Click() { $('#<%= btnModificarCargoDocentePasado.ClientID %>')[0].click(); }
            function btnEliminarCargoDocentePasado_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarCargoDocentePasado.ClientID %>')[0].click(); }
        </script>
            <asp:Button ID="btnAgregarCargoDocentePasado" runat="server" Text="+" Title="Nuevo" CssClass="boton-grilla-agregar" OnClick="btnAgregarCargoDocentePasado_Click" />
        <div class="div-abm-botonera-derecha">
            <br />
            <br />
            <asp:Button ID="btnModificarCargoDocentePasado" runat="server" Text="Modificar" CssClass="boton boton-azul"
                Width="80" Height="25" OnClick="btnModificarCargoDocentePasado_Click" />
            <br />
            <br />
            <asp:Button ID="btnEliminarCargoDocentePasado" runat="server" Text="Eliminar" CssClass="boton boton-rojo"
                Width="80" Height="25" OnClick="btnEliminarCargoDocentePasado_Click" />
        </div>
        <!-- FIN GRILLA ABM CARGOS DOCENTES PASADO -->
        <div class="div-clear">
        </div>
    </div>
</div>
    
    
<span class="lbl-punto">4.3.</span> Dirección de tesis, tesinas y trabajos finales.
<div class="div-punto">
        <asp:Label ID="Label44" runat="server" Text="Cantidad total  de tesis doctorales dirigidas y concluidas en los últimos
            5 años." CssClass="axEtiqueta" Width="500"></asp:Label>
        <asp:TextBox ID="edtTesisDoctoralesConcluidas" runat="server" Width="50" CssClass="axControl"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label45" runat="server" Text="Cantidad de tesis doctorales que dirige actualmente."
            CssClass="axEtiqueta" Width="500"></asp:Label>
        <asp:TextBox ID="edtTesisDoctoralesActuales" runat="server" Width="50" CssClass="axControl"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label46" runat="server" Text="Cantidad total de tesis de maestría dirigidas y concluidas en los últimos
            5 años." CssClass="axEtiqueta" Width="500"></asp:Label>
        <asp:TextBox ID="edtTesisMaestriaConcluidas" runat="server" Width="50" CssClass="axControl"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label47" runat="server" Text="Cantidad de tesis de maestría que dirige actualmente."
            CssClass="axEtiqueta" Width="500"></asp:Label>
        <asp:TextBox ID="edtTesisMaestriaActuales" runat="server" Width="50" CssClass="axControl"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label48" runat="server" Text="Cantidad de tesinas y trabajos finales dirigidas y concluidas en los últimos
            5 años." CssClass="axEtiqueta" Width="500"></asp:Label>
        <asp:TextBox ID="edtTesinasTPConcluidas" runat="server" Width="50" CssClass="axControl"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label49" runat="server" Text="Cantidad de tesinas y trabajos finales que dirige actualmente."
            CssClass="axEtiqueta" Width="500"></asp:Label>
        <asp:TextBox ID="edtTesinasTPActuales" runat="server" Width="50" CssClass="axControl"></asp:TextBox>
        <br />
        <br />
</div>



<span class="lbl-punto">4.4.</span> Experiencia en educación a distancia.
<div class="div-punto">
Si es docente de carreras semipresenciales o a distancia, explique brevemente cual es su experiencia en educación a distancia.
<br />
<br />
    <asp:TextBox ID="edtExperienciaEducacionDistancia" runat="server" Width="100%" Style="max-width: 100%"
        CssClass="axControl" TextMode="MultiLine"></asp:TextBox>
    <br />
    <br />
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


<asp:Content ID="Content3" ContentPlaceHolderID="Popup" runat="server">    


    <!-- POPUP CARGOS DOCENTES ACTUAL -->
    <dxpc:ASPxPopupControl ID="popCargosDocentesActual" runat="server" CloseAction="CloseButton"
        Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popup" HeaderText="Agregar/Modificar situación docente actual"
        AllowDragging="True" EnableAnimation="True" EnableViewState="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
        CssPostfix="Glass" ImageFolder="~/App_Themes/Glass/{0}/" EnableHierarchyRecreation="False">
        <SizeGripImage Height="12px" Width="12px" />
        <CloseButtonImage Height="17px" Width="17px" />
        <HeaderStyle Font-Bold="True">
        </HeaderStyle>
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl4" runat="server">
                <!-- DETALLE -->
                <div class="divPopup" style="width: 600px">
                    <div class="div-form-cuadroPopup">
                        <asp:Label ID="Label11" runat="server" Text="* Institución: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbCargosDocentesActualInstitucion" runat="server" Width="400" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCargosDocentesActualInstitucion_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlCargoActualOtraInstitucion" runat="server">
                            <asp:Label ID="Label18" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtCargoActualOtraInstitucion" runat="server" CssClass="axControl" Width="400px"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>
                        <asp:Label ID="Label10" runat="server" Text="* Unidad Académica: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbCargosDocentesActualUA" runat="server" Width="400" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCargosDocentesActualUA_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlCargoActualOtraUA" runat="server">
                            <asp:Label ID="Label2" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtCargoActualOtraUA" runat="server" CssClass="axControl" Width="400px"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>
                        <asp:Label ID="Label1" runat="server" Text="* Cargo: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbCargosDocentesActualCargo" runat="server" Width="250" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCargosDocentesActualCargo_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlCargoActualOtroCargo" runat="server">
                            <asp:Label ID="Label4" runat="server" Text="* Otro (especificar): " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtCargosDocentesActualOtroCargo" runat="server" CssClass="axControl" Width="200"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>
                        <div class="div-mitad">
                            <asp:Label ID="Label3" runat="server" Text="* Fecha de inicio: " CssClass="axEtiqueta" Width="150"></asp:Label>
                            <asp:TextBox ID="edtCargosDocentesActualFechaInicio" runat="server" CssClass="axControl" Width="100" placeholder="dd/mm/aaaa"></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender3" runat="server" Format="dd/MM/yyyy" TargetControlID="edtCargosDocentesActualFechaInicio">
                            </asp:CalendarExtender>
                        </div>
                        <div class="div-mitad">
                            <asp:Label ID="Label22" runat="server" Text="Fecha de finalización: " CssClass="axEtiqueta" Width="150"></asp:Label>
                            <asp:TextBox ID="edtCargosDocentesActualFechaFinalizacion" runat="server" CssClass="axControl" Width="100" placeholder="dd/mm/aaaa"></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender4" runat="server" Format="dd/MM/yyyy" TargetControlID="edtCargosDocentesActualFechaFinalizacion">
                            </asp:CalendarExtender>
                        </div>
                        <div class="div-clear"></div>
                        <br />
                        <span class="axEtiquetaAyuda">Deje la fecha de finalización en blanco para los cargos actuales. Si completa una fecha de finalización, el cargo pasará al punto 4.2.</span>
                        <br />
                        <br />
                        <div class="div-mitad" style="width: 45%">
                            <asp:Label ID="Label8" runat="server" Text="* Dedicación semanal: " CssClass="axEtiqueta" Width="150"></asp:Label>
                            <asp:TextBox ID="edtCargosDocentesActualDedicacionSemanal" runat="server" CssClass="axControl" Width="50px"></asp:TextBox>
                            <asp:Label ID="Label14" runat="server" Text="horas reloj" CssClass="axEtiqueta"></asp:Label>
                        </div>
                        <div class="div-mitad" style="width: 55%">
                            <asp:Label ID="Label5" runat="server" Text="* Modalidad: " CssClass="axEtiqueta" Width="100"></asp:Label>
                            <asp:DropDownList ID="cmbCargosDocentesActualSemanasAnual" runat="server" CssClass="axControl" Width="150"></asp:DropDownList>
                        </div>
                        <div class="div-clear"></div>
                        <br />
                        <asp:Label ID="Label17" runat="server" Text="* Designación: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbCargosDocentesActualDesignacion" runat="server" Width="250" CssClass="axControl"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Label ID="Label38" runat="server" Text="Disciplina: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbCargosDocentesActualDisciplina" runat="server" Width="300" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCargosDocentesActualDisciplina_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlCargosDocentesActualOtraDisciplina" runat="server">
                            <asp:Label ID="Label6" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtCargosDocentesActualOtraDisciplina" runat="server" Width="300" CssClass="axControl"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>
                        <asp:Label ID="Label39" runat="server" Text="Subdisciplina: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbCargosDocentesActualSubdisciplina" runat="server" Width="300" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCargosDocentesActualSubdisciplina_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlCargosDocentesActualOtraSubdisciplina" runat="server">
                            <asp:Label ID="Label7" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtCargosDocentesActualOtraSubdisciplina" runat="server" Width="300" CssClass="axControl"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>

                    <asp:Panel ID="pnlCargosDocentesActualCursos" runat="server">
                    <div class="div-form-subtitulo">Carreras y actividades curriculares de grado</div>
                    <!-- GRILLA ABM CURSOS DE GRADO -->
                    <div class="div-form-abm">
                    <div class="div-form-abm-grilla" style="max-width: 530px">
                        <dxwgv:ASPxGridView ID="grdCursosGrado" runat="server" AutoGenerateColumns="False"
                            CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass"
                            KeyFieldName="ID_CARGOS_ACT_CURRIC">
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
                                    <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarCursosGrado"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                                    <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarCursosGrado"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                                </CustomButtons></dxwgv:GridViewCommandColumn>
                                <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="ID_CARGOS_ACT_CURRIC" Visible="false"></dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Carrera" FieldName="CARRERA"></dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Actividad(es) curricular(es)" FieldName="ACTIVIDAD_CURRICULAR"></dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Plan de estudios" FieldName="PLAN_ESTUDIOS"></dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Año de inicio" VisibleIndex="3" FieldName="ANIO_INICIO"></dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <ClientSideEvents CustomButtonClick="function(s, e) {
                              if (e.buttonID == 'btngrdModificarCursosGrado') { btnModificarCursosGrado_Click(); }
                              if (e.buttonID == 'btngrdEliminarCursosGrado') { btnEliminarCursosGrado_Click(); }
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
                        function btnModificarCursosGrado_Click() { $('#<%= btnModificarCursosGrado.ClientID %>')[0].click(); }
                        function btnEliminarCursosGrado_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarCursosGrado.ClientID %>')[0].click(); }
                    </script>
                        <asp:Button ID="btnAgregarCursosGrado" runat="server" Text="+" title="Nuevo" CssClass="boton-grilla-agregar" OnClick="btnAgregarCursosGrado_Click" />
                    <div class="div-abm-botonera-derecha">
                        <br />
                        <br />
                        <asp:Button ID="btnModificarCursosGrado" runat="server" Text="Modificar" CssClass="boton boton-azul"
                            Width="80" Height="25" OnClick="btnModificarCursosGrado_Click" />
                        <br />
                        <br />
                        <asp:Button ID="btnEliminarCursosGrado" runat="server" Text="Eliminar" CssClass="boton boton-rojo"
                            Width="80" Height="25" OnClick="btnEliminarCursosGrado_Click" />
                    </div>
                    <!-- FIN GRILLA ABM TITULOS GRADO -->
                    <div class="div-clear">
                    </div>
                    </div>
                    <!-- FIN GRILLA ABM CURSOS DE GRADO -->
                    <div class="div-form-subtitulo">Carreras y actividades curriculares de posgrado</div>
                    <div class="div-form-abm">
                    <div class="div-form-abm-grilla" style="max-width: 530px">
                        <dxwgv:ASPxGridView ID="grdCursosPosgrado" runat="server" AutoGenerateColumns="False"
                            CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass"
                            KeyFieldName="ID_CARGOS_ACT_CURRIC">
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
                                    <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarCursosPosgrado"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                                    <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarCursosPosgrado"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                                </CustomButtons></dxwgv:GridViewCommandColumn>
                                <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="ID_CARGOS_ACT_CURRIC" Visible="false"></dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Carrera" FieldName="CARRERA"></dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Tipo" FieldName="TIPO_CARRERA"></dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Actividad(es) curricular(es)" FieldName="ACTIVIDAD_CURRICULAR"></dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Plan de estudios" FieldName="PLAN_ESTUDIOS"></dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Año de inicio" VisibleIndex="3" FieldName="ANIO_INICIO"></dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <ClientSideEvents CustomButtonClick="function(s, e) {
                              if (e.buttonID == 'btngrdModificarCursosPosgrado') { btnModificarCursosPosgrado_Click(); }
                              if (e.buttonID == 'btngrdEliminarCursosPosgrado') { btnEliminarCursosPosgrado_Click(); }
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
                        function btnModificarCursosPosgrado_Click() { $('#<%= btnModificarCursosPosgrado.ClientID %>')[0].click(); }
                        function btnEliminarCursosPosgrado_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarCursosPosgrado.ClientID %>')[0].click(); }
                    </script>
                        <asp:Button ID="btnAgregarCursosPosgrado" runat="server" Text="+" title="Nuevo" CssClass="boton-grilla-agregar" OnClick="btnAgregarCursosPosgrado_Click" />
                    <div class="div-abm-botonera-derecha">
                        <br />
                        <br />
                        <asp:Button ID="btnModificarCursosPosgrado" runat="server" Text="Modificar" CssClass="boton boton-azul"
                            Width="80" Height="25" OnClick="btnModificarCursosPosgrado_Click" />
                        <br />
                        <br />
                        <asp:Button ID="btnEliminarCursosPosgrado" runat="server" Text="Eliminar" CssClass="boton boton-rojo"
                            Width="80" Height="25" OnClick="btnEliminarCursosPosgrado_Click" />
                    </div>
                    <!-- FIN GRILLA ABM TITULOS GRADO -->
                    <div class="div-clear">
                    </div>
                    </div>       
                    </asp:Panel>                 
                    </div>
                </div>
                <!-- FIN DETALLE -->

                <!-- BOTONERA-->
                <div class="botonera-inferior-der">
                    <asp:Button ID="btnGuardarCargoDocenteActual" runat="server" Text="Siguiente" CssClass="boton boton-verde"
                        Width="90" Height="25" OnClick="btnGuardarCargoDocenteActual_Click" />&nbsp;&nbsp;
                    <asp:Button ID="btnCancelarCargoDocenteActual" runat="server" Text="Cancelar" CssClass="boton boton-rojo"
                        Width="90" Height="25" OnClick="btnCancelarCargoDocenteActual_Click" />
                </div>
                <!-- FIN BOTONERA -->
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP CARGOS DOCENTES ACTUAL -->
    
    
    


    <!-- POPUP CARGOS DOCENTES CURSO GRADO -->
    <dxpc:ASPxPopupControl ID="popCargoActualCursoGrado" runat="server" CloseAction="CloseButton"
        Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popup" HeaderText="Agregar/Modificar curso de grado"
        AllowDragging="True" EnableAnimation="True" EnableViewState="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
        CssPostfix="Glass" ImageFolder="~/App_Themes/Glass/{0}/" EnableHierarchyRecreation="False">
        <SizeGripImage Height="12px" Width="12px" />
        <CloseButtonImage Height="17px" Width="17px" />
        <HeaderStyle Font-Bold="True">
        </HeaderStyle>
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <!-- DETALLE -->
                <div class="divPopup" style="width: 700px; overflow: auto">
                    <div class="div-form-cuadroPopup">
                        <asp:Label ID="Label15" runat="server" Text="* Carrera: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbCargoActualCursoGradoCarrera" runat="server" Width="400" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCargoActualCursoGradoCarrera_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlCargoActualCursoGradoOtraCarrera" runat="server">
                            <asp:Label ID="lblCargoActualCursoGradoOtraCarrera" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtCargoActualCursoGradoOtraCarrera" runat="server" CssClass="axControl" Width="400px"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>
                        <asp:Label ID="Label25" runat="server" Text="* Plan de estudios (año): " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:TextBox ID="edtCargoActualCursoGradoPlanEstudios" runat="server" CssClass="axControl" Width="100"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label26" runat="server" Text="* Actividad(es) Curricular(es): " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:TextBox ID="edtCargoActualCursoGradoActividadCurricular" runat="server" CssClass="axControl" Width="500"></asp:TextBox>
                        <br />
                        <br />

                        <div class="div-mitad">
                            <asp:Label ID="Label29" runat="server" Text="* Año de inicio: " CssClass="axEtiqueta" Width="150"></asp:Label>
                            <asp:TextBox ID="edtCargoActualCursoGradoAnioInicio" runat="server" CssClass="axControl" Width="100"></asp:TextBox>
                        </div>
                        <div class="div-mitad">
                        </div>
                        <div class="div-clear"></div>
                        <br />
                        <span class="axEtiquetaAyuda">Deje el año de finalización en blanco para los cargos actuales.</span>
                    </div>
                </div>
                <!-- FIN DETALLE -->

                <!-- BOTONERA-->
                <div class="botonera-inferior-der">
                    <asp:Button ID="btnGuardarCargoActualCursoGrado" runat="server" Text="Guardar" CssClass="boton boton-verde"
                        Width="90" Height="25" OnClick="btnGuardarCargoActualCursoGrado_Click" />&nbsp;&nbsp;
                    <asp:Button ID="btnCancelarCargoActualCursoGrado" runat="server" Text="Cancelar" CssClass="boton boton-rojo"
                        Width="90" Height="25" OnClick="btnCancelarCargoActualCursoGrado_Click" />
                </div>
                <!-- FIN BOTONERA -->
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP CARGOS DOCENTES CURSO GRADO -->
    
    
    
    


    <!-- POPUP CARGOS DOCENTES CURSO POSGRADO -->
    <dxpc:ASPxPopupControl ID="popCargoActualCursoPosgrado" runat="server" CloseAction="CloseButton"
        Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popup" HeaderText="Agregar/Modificar curso de grado"
        AllowDragging="True" EnableAnimation="True" EnableViewState="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
        CssPostfix="Glass" ImageFolder="~/App_Themes/Glass/{0}/" EnableHierarchyRecreation="False">
        <SizeGripImage Height="12px" Width="12px" />
        <CloseButtonImage Height="17px" Width="17px" />
        <HeaderStyle Font-Bold="True">
        </HeaderStyle>
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
                <!-- DETALLE -->
                <div class="divPopup" style="width: 700px; overflow: auto">
                    <div class="div-form-cuadroPopup">
                        <asp:Label ID="Label33" runat="server" Text="* Carrera: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbCargoActualCursoPosgradoCarrera" runat="server" Width="400" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCargoActualCursoPosgradoCarrera_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlCargoActualCursoPosgradoOtraCarrera" runat="server">
                            <asp:Label ID="lblCargoActualCursoPosgradoOtraCarrera" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtCargoActualCursoPosgradoOtraCarrera" runat="server" CssClass="axControl" Width="400px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label37" runat="server" Text="* Tipo: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:DropDownList ID="cmbCargoActualCursoPosgradoTipo" runat="server" Width="250" CssClass="axControl"></asp:DropDownList>
                            <br />
                            <br />
                        </asp:Panel>
                        <asp:Label ID="Label40" runat="server" Text="Plan de estudios (año): " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:TextBox ID="edtCargoActualCursoPosgradoPlanEstudios" runat="server" CssClass="axControl" Width="100"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label50" runat="server" Text="* Actividad(es) Curricular(es): " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:TextBox ID="edtCargoActualCursoPosgradoActividadCurricular" runat="server" CssClass="axControl" Width="500"></asp:TextBox>
                        <br />
                        <br />

                        <div class="div-mitad">
                            <asp:Label ID="Label51" runat="server" Text="* Año de inicio: " CssClass="axEtiqueta" Width="150"></asp:Label>
                            <asp:TextBox ID="edtCargoActualCursoPosgradoAnioInicio" runat="server" CssClass="axControl" Width="100"></asp:TextBox>
                        </div>
                        <div class="div-mitad">
                        </div>
                        <div class="div-clear"></div>
                        <br />
                        <span class="axEtiquetaAyuda">Deje el año de finalización en blanco para los cargos actuales.</span>
                    </div>
                </div>
                <!-- FIN DETALLE -->

                <!-- BOTONERA-->
                <div class="botonera-inferior-der">
                    <asp:Button ID="btnGuardarCargoActualCursoPosgrado" runat="server" Text="Guardar" CssClass="boton boton-verde"
                        Width="90" Height="25" OnClick="btnGuardarCargoActualCursoPosgrado_Click" />&nbsp;&nbsp;
                    <asp:Button ID="btnCancelarCargoActualCursoPosgrado" runat="server" Text="Cancelar" CssClass="boton boton-rojo"
                        Width="90" Height="25" OnClick="btnCancelarCargoActualCursoPosgrado_Click" />
                </div>
                <!-- FIN BOTONERA -->
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP CARGOS DOCENTES CURSO POSGRADO -->
    
        
    

    <!-- POPUP CARGOS DOCENTES PASADO -->
    <dxpc:ASPxPopupControl ID="popCargosDocentesPasado" runat="server" CloseAction="CloseButton"
        Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popup" HeaderText="Agregar/Modificar trayectoria docente"
        AllowDragging="True" EnableAnimation="True" EnableViewState="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
        CssPostfix="Glass" ImageFolder="~/App_Themes/Glass/{0}/" EnableHierarchyRecreation="False">
        <SizeGripImage Height="12px" Width="12px" />
        <CloseButtonImage Height="17px" Width="17px" />
        <HeaderStyle Font-Bold="True">
        </HeaderStyle>
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <!-- DETALLE -->
                <div class="divPopup" style="width: 700px; overflow: auto">
                    <div class="div-form-cuadroPopup">
                        <asp:Label ID="Label9" runat="server" Text="* Institución: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbCargosDocentesPasadoInstitucion" runat="server" Width="400" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCargosDocentesPasadoInstitucion_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlCargoPasadoOtraInstitucion" runat="server">
                            <asp:Label ID="Label12" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtCargoPasadoOtraInstitucion" runat="server" CssClass="axControl" Width="400px"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>
                        <asp:Label ID="Label13" runat="server" Text="* Unidad Académica: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbCargosDocentesPasadoUA" runat="server" Width="400" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCargosDocentesPasadoUA_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlCargoPasadoOtraUA" runat="server">
                            <asp:Label ID="Label16" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtCargoPasadoOtraUA" runat="server" CssClass="axControl" Width="400px"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>
                        <asp:Label ID="Label19" runat="server" Text="* Cargo: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbCargosDocentesPasadoCargo" runat="server" Width="250" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCargosDocentesPasadoCargo_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlCargoPasadoOtroCargo" runat="server">
                            <asp:Label ID="Label20" runat="server" Text="* Otro (especificar): " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtCargosDocentesPasadoOtroCargo" runat="server" CssClass="axControl" Width="200"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>
                        <div class="div-mitad">
                            <asp:Label ID="Label21" runat="server" Text="* Fecha de inicio: " CssClass="axEtiqueta" Width="150"></asp:Label>
                            <asp:TextBox ID="edtCargosDocentesPasadoFechaInicio" runat="server" CssClass="axControl" Width="100" placeholder="dd/mm/aaaa"></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" TargetControlID="edtCargosDocentesPasadoFechaInicio">
                            </asp:CalendarExtender>
                        </div>
                        <div class="div-mitad">
                            <asp:Label ID="Label23" runat="server" Text="Fecha de finalización: " CssClass="axEtiqueta" Width="150"></asp:Label>
                            <asp:TextBox ID="edtCargosDocentesPasadoFechaFinalizacion" runat="server" CssClass="axControl" Width="100" placeholder="dd/mm/aaaa"></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" TargetControlID="edtCargosDocentesPasadoFechaFinalizacion">
                            </asp:CalendarExtender>
                        </div>
                        <div class="div-clear"></div>
                        <br />
                        <br />
                        <div class="div-mitad" style="width: 45%">
                            <asp:Label ID="Label24" runat="server" Text="Dedicación semanal: " CssClass="axEtiqueta" Width="150"></asp:Label>
                            <asp:TextBox ID="edtCargosDocentesPasadoDedicacionSemanal" runat="server" CssClass="axControl" Width="50px"></asp:TextBox>
                            <asp:Label ID="Label27" runat="server" Text="horas reloj" CssClass="axEtiqueta"></asp:Label>
                        </div>
                        <div class="div-mitad" style="width: 55%">
                            <asp:Label ID="Label28" runat="server" Text="Modalidad: " CssClass="axEtiqueta" Width="100"></asp:Label>
                            <asp:DropDownList ID="cmbCargosDocentesPasadoSemanasAnual" runat="server" CssClass="axControl" Width="150"></asp:DropDownList>
                        </div>
                        <div class="div-clear"></div>
                        <br />
                        <asp:Label ID="Label30" runat="server" Text="* Designación: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbCargosDocentesPasadoDesignacion" runat="server" Width="250" CssClass="axControl"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Label ID="Label31" runat="server" Text="Disciplina: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbCargosDocentesPasadoDisciplina" runat="server" Width="300" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCargosDocentesPasadoDisciplina_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlCargosDocentesPasadoOtraDisciplina" runat="server">
                            <asp:Label ID="Label32" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtCargosDocentesPasadoOtraDisciplina" runat="server" Width="300" CssClass="axControl"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>
                        <asp:Label ID="Label34" runat="server" Text="Subdisciplina: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbCargosDocentesPasadoSubdisciplina" runat="server" Width="300" CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbCargosDocentesPasadoSubdisciplina_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Panel ID="pnlCargosDocentesPasadoOtraSubdisciplina" runat="server">
                            <asp:Label ID="Label35" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtCargosDocentesPasadoOtraSubdisciplina" runat="server" Width="300" CssClass="axControl"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>
                    </div>
                </div>
                <!-- FIN DETALLE -->

                <!-- BOTONERA-->
                <div class="botonera-inferior-der">
                    <asp:Button ID="btnGuardarCargoDocentePasado" runat="server" Text="Guardar" CssClass="boton boton-verde"
                        Width="90" Height="25" OnClick="btnGuardarCargoDocentePasado_Click" />&nbsp;&nbsp;
                    <asp:Button ID="btnCancelarCargoDocentePasado" runat="server" Text="Cancelar" CssClass="boton boton-rojo"
                        Width="90" Height="25" OnClick="btnCancelarCargoDocentePasado_Click" />
                </div>
                <!-- FIN BOTONERA-->
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP CARGOS DOCENTES PASADO -->
</asp:Content>