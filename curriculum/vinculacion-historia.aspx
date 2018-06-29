<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="base.master" CodeFile="vinculacion-historia.aspx.cs" Inherits="form_inicio" Title="CONEAU Global | ATENEA - Ficha Institucional" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Cabecera" runat="server">
Vinculaciones históricas
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">


        <asp:Panel ID="pnlVinculacion" runat="server">
            <div class="div-cuadro">
            <h3>Historial de vinculaciones al cuerpo académico</h3>
            <br />
            La siguiente lista muestra las vinculaciones al cuerpo académico de solicitudes de acreditación que ya han sido presentadas.<br />
            <br />
            <div class="div-contenedor-grilla">
            <dxwgv:ASPxGridView ID="grdCargos" runat="server" AutoGenerateColumns="False" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" Width="100%" KeyFieldName="ID_CARGOS_DOCENTES" SettingsLoadingPanel-Text="Cargando&hellip;" >
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
                    <dxwgv:GridViewDataTextColumn Caption="Identificador" Visible="false" FieldName="ID_CARGOS_DOCENTES"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID. de la rama" Visible="false" FieldName="ID_RAMAS_TRONCALES"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID. de tipo de título" Visible="false" FieldName="ID_TIPOS_TITULOS"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID. de la carrera" FieldName="ID_CARRERAS" Visible="False"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID. de la carreraLocaliz" FieldName="ID_CARRERAS_LOCALIZACIONES" Visible="False"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID. de la uaLocaliz" FieldName="ID_LOCALIZACIONES_UAS" Visible="False"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID. de la Localiz" FieldName="ID_LOCALIZACIONES" Visible="False"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID. de la PC" FieldName="ID_PRESENTACIONES_CARRERAS" Visible="False"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID. de la PUA" FieldName="ID_PRESENTACIONES_UA" Visible="False"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID. de la P" FieldName="ID_PRESENTACIONES" Visible="False"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID. de la UA" FieldName="ID_UNIDADES_ACADEMICAS" Visible="False"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Estado" FieldName="TIPO_ESTADO_CARGO" SortIndex="0" SortOrder="Ascending"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución" FieldName="INSTITUCION" SortIndex="1" SortOrder="Ascending"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Unidad académica" FieldName="UNIDAD_ACADEMICA" SortIndex="2" SortOrder="Ascending"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Localización/sede" FieldName="LOCALIZACION" SortIndex="3" SortOrder="Ascending"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Cargo" FieldName="TIPO_CARGO"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Designación" FieldName="TIPO_DESIGNACION" Visible="false"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Dedicación promedio" FieldName="DED_PROMEDIO" Visible="false"></dxwgv:GridViewDataTextColumn>
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
               <asp:Button ID="btnAprobar" runat="server" 
                Text="Ver vinculación" CssClass="boton boton-azul" onclick="btnRevisar_Click" />  
            </div>
            </div>
        </asp:Panel>

        <br />

        <asp:Panel ID="Panel1" runat="server">
            <div class="div-cuadro">
            <h3>Historial de otras vinculaciones</h3>
            <br />
            La siguiente lista muestra vinculaciones adicionales que han sido realizadas por las distintas instituciones, como autoridad de carreras, unidades académicas o integrante o director de comités y actividades.<br />
            <br />
            <div class="div-contenedor-grilla">
            <dxwgv:ASPxGridView ID="grdVinculacionesO" runat="server" AutoGenerateColumns="False" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                CssPostfix="Glass" Width="100%" KeyFieldName="ID_CLAVE" SettingsLoadingPanel-Text="Cargando&hellip;" >
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
                    <dxwgv:GridViewDataTextColumn Caption="Identificador" Visible="false" FieldName="ID_CLAVE"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Identificador" Visible="false" FieldName="CLAVE"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID" Visible="false" FieldName="ID_TIPOS_VINCULACION"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID" Visible="false" FieldName="CAMPO_CLAVE"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="TABLA" Visible="False"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Estado" FieldName="TIPO_ESTADO_CARGO"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Tipo de vinculación" FieldName="TIPO_VINCULACION" SortIndex="0" SortOrder="Ascending"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución" FieldName="INSTITUCION" SortIndex="1" SortOrder="Ascending"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Vinculado a" FieldName="DENOMINACION"></dxwgv:GridViewDataTextColumn>
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
            </div>
            
        </asp:Panel>

</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="Popup" runat="server">

            
    

    <!-- POPUP CARGOS DOCENTES -->
    <dxpc:ASPxPopupControl ID="popCargosDocentes" runat="server" CloseAction="CloseButton"
        Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popup" HeaderText="Información del cargo docente"
        AllowDragging="True" EnableAnimation="True" EnableViewState="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
        CssPostfix="Glass" ImageFolder="~/App_Themes/Glass/{0}/" EnableHierarchyRecreation="False">
        <SizeGripImage Height="12px" Width="12px" />
        <CloseButtonImage Height="17px" Width="17px" />
        <HeaderStyle Font-Bold="True">
        </HeaderStyle>
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <!-- DETALLE -->
                <div class="divPopup" style="overflow: auto; max-height: 400px">
                    <div class="div-form-cuadroPopup">
                        <asp:Label ID="Label9" runat="server" Text="Institución: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:TextBox ID="txtInstitucion" runat="server" CssClass="axControl" Width="400" BackColor="#eeeeee" ReadOnly="true"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label13" runat="server" Text="Unidad Académica/Sede: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:TextBox ID="txtUnidadAcademica" runat="server" CssClass="axControl" Width="400" BackColor="#eeeeee" ReadOnly="true"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label19" runat="server" Text="Cargo: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:TextBox ID="txtTipoCargo" runat="server" CssClass="axControl" Width="300" BackColor="#eeeeee" ReadOnly="true"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Designación: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:TextBox ID="txtDesignacion" runat="server" CssClass="axControl" Width="200" BackColor="#eeeeee" ReadOnly="true"></asp:TextBox>
                        <br />
                        <br />
                    <b>Carga horaria</b>:<br />
                    <table class="tabla-color">
                        <tr style="text-align: center">
                            <td><b>Tipo de actividad</b></td>
                            <td><b>Dedicación<br />semanal</b></td>
                            <td><b>Modalidad</b></td>
                            <td><b>Dedicación<br />promedio anual</b></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Docencia</td>
                            <td><asp:TextBox ID="txtDedicacion1" runat="server" BackColor="#eeeeee" ReadOnly="true" CssClass="axControl" Width="100" style="text-align: center" AutoPostBack="true" OnTextChanged="Dedicacion_TextChanged" /></td>
                            <td><asp:DropDownList ID="ddlModalidad1" runat="server" BackColor="#eeeeee" ReadOnly="true" CssClass="axControl" Width="230" AutoPostBack="true" OnSelectedIndexChanged="Dedicacion_SelectedIndexChanged" /></td>
                            <td><asp:TextBox ID="txtDedicacionP1" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Investigación</td>
                            <td><asp:TextBox ID="txtDedicacion2" runat="server" BackColor="#eeeeee" ReadOnly="true" CssClass="axControl" Width="100" style="text-align: center" AutoPostBack="true" OnTextChanged="Dedicacion_TextChanged" /></td>
                            <td><asp:DropDownList ID="ddlModalidad2" runat="server" BackColor="#eeeeee" ReadOnly="true" CssClass="axControl" Width="230" AutoPostBack="true" OnSelectedIndexChanged="Dedicacion_SelectedIndexChanged" /></td>
                            <td><asp:TextBox ID="txtDedicacionP2" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Gestión</td>
                            <td><asp:TextBox ID="txtDedicacion3" runat="server" BackColor="#eeeeee" ReadOnly="true" CssClass="axControl" Width="100" style="text-align: center" AutoPostBack="true" OnTextChanged="Dedicacion_TextChanged" /></td>
                            <td><asp:DropDownList ID="ddlModalidad3" runat="server" BackColor="#eeeeee" ReadOnly="true" CssClass="axControl" Width="230" AutoPostBack="true" OnSelectedIndexChanged="Dedicacion_SelectedIndexChanged" /></td>
                            <td><asp:TextBox ID="txtDedicacionP3" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Dirección de tesis</td>
                            <td><asp:TextBox ID="txtDedicacion4" runat="server" BackColor="#eeeeee" ReadOnly="true" CssClass="axControl" Width="100" style="text-align: center" AutoPostBack="true" OnTextChanged="Dedicacion_TextChanged" /></td>
                            <td><asp:DropDownList ID="ddlModalidad4" runat="server" BackColor="#eeeeee" ReadOnly="true" CssClass="axControl" Width="230" AutoPostBack="true" OnSelectedIndexChanged="Dedicacion_SelectedIndexChanged" /></td>
                            <td><asp:TextBox ID="txtDedicacionP4" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Tutorías</td>
                            <td><asp:TextBox ID="txtDedicacion5" runat="server" BackColor="#eeeeee" ReadOnly="true" CssClass="axControl" Width="100" style="text-align: center" AutoPostBack="true" OnTextChanged="Dedicacion_TextChanged" /></td>
                            <td><asp:DropDownList ID="ddlModalidad5" runat="server" BackColor="#eeeeee" ReadOnly="true" CssClass="axControl" Width="230" AutoPostBack="true" OnSelectedIndexChanged="Dedicacion_SelectedIndexChanged" /></td>
                            <td><asp:TextBox ID="txtDedicacionP5" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Otras</td>
                            <td><asp:TextBox ID="txtDedicacion6" runat="server" BackColor="#eeeeee" ReadOnly="true" CssClass="axControl" Width="100" style="text-align: center" AutoPostBack="true" OnTextChanged="Dedicacion_TextChanged" /></td>
                            <td><asp:DropDownList ID="ddlModalidad6" runat="server" BackColor="#eeeeee" ReadOnly="true" CssClass="axControl" Width="230" AutoPostBack="true" OnSelectedIndexChanged="Dedicacion_SelectedIndexChanged" /></td>
                            <td><asp:TextBox ID="txtDedicacionP6" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                        </tr>
                        <tr>
                            <td style="text-align: right"><b>Total</b></td>
                            <td><asp:TextBox ID="txtDedicacionTotal" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                            <td></td>
                            <td><asp:TextBox ID="txtDedicacionPTotal" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                        </tr>
                    </table>
                    <br />
                    Actividades curriculares y carreras para las que se ha designado:
                    <div class="div-form-abm" style="margin: 0; width: 590px; max-width: 590px">
                    <dxwgv:ASPxGridView ID="grdActividades" runat="server" ClientInstanceName="grid" 
                    AutoGenerateColumns="False" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
                            CssPostfix="Glass" Width="100%" KeyFieldName="ID_DOC_CARGOS_ACT">
                            <SettingsBehavior AllowFocusedRow="True"  />
                            <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                    </Header>
                                    <Cell VerticalAlign="Middle" Wrap="False">
                                        <Paddings Padding="8px" />
                                    </Cell>
                            </Styles>
                            <SettingsText EmptyDataRow="No hay información disponible." CommandCancel="Cancelar"
                                CommandClearFilter="Limpiar" CommandDelete="Eliminar" CommandEdit="Modificar"
                                CommandNew="Nuevo" CommandSelect="Seleccionar" CommandUpdate="Actualizar" ConfirmDelete="Eliminar"
                                CustomizationWindowCaption="Personalizar" EmptyHeaders="Vaciar encabezados" FilterBarClear="Limpiar"
                                FilterBarCreateFilter="Crear" FilterControlPopupCaption="Filtros" GroupContinuedOnNextPage="Continúa en la página siguiente"
                                GroupPanel="Arrastre una columna para agrupar por ese criterio." HeaderFilterShowAll="Mostrar todo"
                                PopupEditFormCaption="Editar" Title="Datos" />
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Identificador" FieldName="ID_DOC_CARGOS_ACT" Visible="false"></dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Actividad curricular" FieldName="ACTIVIDAD_CURRICULAR"></dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Plan de estudios" FieldName="ANIO_APROBACION"></dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Carrera" FieldName="CARRERA"></dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Localización/Sede" FieldName="LOCALIZACION"></dxwgv:GridViewDataTextColumn>
                            </Columns>
                                <SettingsPager PageSize="5" CurrentPageNumberFormat="{0}" Position="Top" 
                                    ShowNumericButtons="False">
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
                                    <Summary AllPagesText="Páginas: {0} - {1} ({2} ítems)" 
                                        Text="{0} de {1} ({2} ítems)" />
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
                                <Settings ShowHeaderFilterButton="True" VerticalScrollableHeight="300" />
                        </dxwgv:ASPxGridView>
                    </div>
                </div>
                </div>
                <!-- FIN DETALLE -->
                <!-- FIN BOTONERA-->
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP CARGOS DOCENTES -->
    



   
    
    
    
    
</asp:Content>
