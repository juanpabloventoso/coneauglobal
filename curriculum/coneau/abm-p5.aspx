<%@ Page Language="C#" MasterPageFile="../abm.master" AutoEventWireup="true" CodeFile="abm-p5.aspx.cs"
    Inherits="_Default" Title="Gestión académica - ATENEA | Currículum Docente" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Central" runat="server">

<h3>5. Experiencia en gestión académica</h3><br />


<span class="lbl-punto">5.1.</span> Cargos en gestión. Completar un cuadro por cada uno de los cargos desempeñados.
<div class="div-punto">
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
            <dxwgv:ASPxGridView ID="grdGestionAcademicaABM" runat="server" AutoGenerateColumns="False"
                CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="800px"
                KeyFieldName="ID_CARGOS_GESTION">
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
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarGestionAcademica"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarGestionAcademica"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID" Visible="false" FieldName="ID_CARGOS_GESTION"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución" FieldName="INSTITUCION"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Cargo/Función" FieldName="CARGO"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Modalidad" FieldName="TIPO_DURACION_DED"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Dedicación semanal" FieldName="DEDICACION_SEMANAL"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataDateColumn Caption="Fecha de inicio" FieldName="FECHA_INICIO" SortOrder="Descending"><PropertiesDateEdit DisplayFormatString="{0:d}"></PropertiesDateEdit></dxwgv:GridViewDataDateColumn>
                    <dxwgv:GridViewDataDateColumn Caption="Fecha de finalización" FieldName="FECHA_FINALIZACION"><PropertiesDateEdit DisplayFormatString="{0:d}"></PropertiesDateEdit></dxwgv:GridViewDataDateColumn>
                </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarGestionAcademica') { btnModificarGestionAcademica_Click(); }
                  if (e.buttonID == 'btngrdEliminarGestionAcademica') { btnEliminarGestionAcademica_Click(); }
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
            function btnModificarGestionAcademica_Click() { $('#<%= btnModificarGestionAcademica.ClientID %>')[0].click(); }
            function btnEliminarGestionAcademica_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarGestionAcademica.ClientID %>')[0].click(); }
        </script>
            <asp:Button ID="btnAgregarGestionAcademica" runat="server" Text="+" title="Nuevo" CssClass="boton-grilla-agregar" OnClick="btnAgregarGestionAcademica_Click" />
        <div class="div-abm-botonera-derecha">
            <br />
            <br />
            <asp:Button ID="btnModificarGestionAcademica" runat="server" Text="Modificar" CssClass="boton boton-azul"
                Width="80" Height="25" OnClick="btnModificarGestionAcademica_Click" />
            <br />
            <br />
            <asp:Button ID="btnEliminarGestionAcademica" runat="server" Text="Eliminar" CssClass="boton boton-rojo"
                Width="80" Height="25" OnClick="btnEliminarGestionAcademica_Click" />
        </div>
        <!-- FIN GRILLA ABM GESTION ACADEMICA -->
        <div class="div-clear">
        </div>
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


<asp:Content ID="Content3" ContentPlaceHolderID="Popup" runat="server">    



    <!-- POPUP GESTION ACADEMICA -->
    <dxpc:ASPxPopupControl ID="popGestionAcademica" runat="server" CloseAction="CloseButton"
        Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popup" HeaderText="Agregar/Modificar experiencia en gestión"
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
                        <asp:Label ID="Label27" runat="server" Text="* Institución: " CssClass="axEtiqueta"
                            Width="150"></asp:Label>
                        <asp:DropDownList ID="cmbGestionAcademicaInstitucion" runat="server" Width="400px"
                            CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbGestionAcademicaInstitucion_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <asp:Panel ID="pnlGestionAcademicaOtraInstitucion" runat="server">
                            <br />
                            <asp:Label ID="Label9" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta"
                                Width="200"></asp:Label>
                            <asp:TextBox ID="edtGestionAcademicaOtraInstitucion" runat="server" CssClass="axControl"
                                Width="400"></asp:TextBox>
                        </asp:Panel>
                        <br />
                        <asp:Label ID="Label28" runat="server" Text="* Cargo/Función: " CssClass="axEtiqueta"
                            Width="150"></asp:Label>
                        <asp:TextBox ID="edtGestionAcademicaCargoFuncion" runat="server" CssClass="axControl"
                            Width="400px"></asp:TextBox>
                        <br />
                        <br />
                        <div class="div-mitad" style="width: 45%">
                            <asp:Label ID="Label14" runat="server" Text="* Dedicación semanal: " CssClass="axEtiqueta" Width="150"></asp:Label>
                            <asp:TextBox ID="edtGestionAcademicaHsRelojSemanales" runat="server" CssClass="axControl" Width="50px"></asp:TextBox>
                            <asp:Label ID="Label16" runat="server" Text="horas reloj" CssClass="axEtiqueta"></asp:Label>
                        </div>
                        <div class="div-mitad" style="width: 55%">
                            <asp:Label ID="Label32" runat="server" Text="* Modalidad: " CssClass="axEtiqueta" Width="100"></asp:Label>
                            <asp:DropDownList ID="cmbGestionAcademicaSemanasAnual" runat="server" CssClass="axControl" Width="150"></asp:DropDownList>
                        </div>
                        <div class="div-clear"></div>
                        <br />
                        <div class="div-mitad">
                            <asp:Label ID="Label30" runat="server" Text="* Fecha de inicio: " CssClass="axEtiqueta"
                                Width="150"></asp:Label>
                            <asp:TextBox ID="edtGestionAcademicaFechaInicio" runat="server" CssClass="axControl"
                                Width="100px" placeholder="dd/mm/aaaa"></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" TargetControlID="edtGestionAcademicaFechaInicio">
                            </asp:CalendarExtender>
                        </div>
                        <div class="div-mitad">
                            <asp:Label ID="Label43" runat="server" Text="Fecha de finalización: " CssClass="axEtiqueta"
                                Width="150px"></asp:Label>
                            <asp:TextBox ID="edtGestionAcademicaFechaFinalizacion" runat="server" CssClass="axControl"
                                Width="100px" placeholder="dd/mm/aaaa"></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" TargetControlID="edtGestionAcademicaFechaFinalizacion">
                            </asp:CalendarExtender>
                        </div>
                        <br />
                        <br />
                    </div>
                </div>
                <!-- FIN DETALLE -->
                <!-- BOTONERA-->
                <div class="botonera-inferior-der">
                    <asp:Button ID="btnGuardarGestionAcademica" runat="server" Text="Aceptar" CssClass="boton boton-verde"
                        Width="90" Height="25" OnClick="btnAceptarGestionAcademica_Click" />&nbsp;&nbsp;
                    <asp:Button ID="btnCancelarGestionAcademica" runat="server" Text="Cancelar" CssClass="boton boton-rojo"
                        Width="90" Height="25" OnClick="btnCancelarGestionAcademica_Click" />
                </div>
                <!-- FIN BOTONERA-->
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP GESTION ACADEMICA -->

</asp:Content>