<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="base.master" CodeFile="default.aspx.cs" Inherits="form_inicio" Title="CONEAU Global | Currículum docente" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



<asp:Content ID="Content4" ContentPlaceHolderID="Cabecera" runat="server">
Currículum docente
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">

<div style="padding: 6px">

    <h2 style="color: #333"><asp:Label ID="lblBienvenido" runat="server" Text="Bienvenido" CssClass="lblTitulo"></asp:Label></h2>
    <br />


        
 <asp:Panel ID="pnlNoAnda" runat="server"  Visible="false">
    <div style="padding: 10px; background: #fdd; box-shadow: 0 1px 3px 0 rgba(0,0,0,.2),0 1px 1px 0 rgba(0,0,0,.14),0 -1px 1px -1px rgba(0,0,0,.12)">
        No hemos podido encontrar su currículum en CVar bajo el CUIT <asp:Label ID="lblCUIT" runat="server"></asp:Label>.<br />
        Deberá crear su cuenta en CVar para poder aprobar las vinculaciones. Si ya la ha creado, verifique que el CUIT ingresado en nuestro sistema coincida con el ingresado en CVar.
        <br /><br />
        <asp:Button ID="btnCrearCVAR" runat="server" Text="Crear mi cuenta en CVar ahora" CssClass="boton boton-verde" 
        Width="250px" Height="32px" onclick="btnCrearCVAR_Click" />    
        <br /><br />
        Ante cualquier inconveniente con CVar comuníquese a <b>consultacvar@mincyt.gob.ar</b>.
        <br />
     </div>
    <br />
</asp:Panel>
        

<asp:Panel ID="pnlNotificacion" runat="server">
<br />
<div style="display: none">      
<div style=" background: #ffd; padding: 10px; border-radius: 6px; box-shadow: 0 1px 3px 0 rgba(0,0,0,.2),0 1px 1px 0 rgba(0,0,0,.14),0 -1px 1px -1px rgba(0,0,0,.12)">
<div style="float: left; width: 30px;"><img src="../../imagenes/iconos/vineta-naranja.png"></div>
<div style="float: left; "><b>¡Nuevo!</b> Ahora puede designar un colaborador para que lo ayude a completar su currículum. <a href="configuracion.aspx">Ir a mi configuración</a></div>
<div class="div-clear"></div>
</div>
</div>
</asp:Panel>


        <asp:Panel ID="pnlCurriculum" runat="server" CssClass="div-cuadro">
            <h3>Mi currículum</h3>
            <br />
            Ingrese a su currículum docente para completarlo o actualizarlo desde esta opción.<br />
            <b>El mismo tiene carácter de declaración jurada y debe completarlo con información verídica y comprobable.</b>
            <br /><br />
            <asp:Button ID="btnAbrirFicha" runat="server" Text="Abrir mi currículum" CssClass="boton boton-verde" onclick="btnAbrirFicha_Click" />    
            <asp:Button ID="btnImportar" runat="server" Text="Importar ficha generada..." CssClass="boton boton-azul" onclick="btnImportarFicha_Click" />    
            <br />
            <asp:Panel ID="pnlCVarAyuda" runat="server">
                <span class="axEtiquetaAyuda">Nota: Con sólo completar su currículum en CVar la información ya estará disponible para CONEAU. No es necesario realizar ningún paso adicional.</span>
                <br />
            </asp:Panel>
        </asp:Panel>

        <br />
        
        <asp:Panel ID="pnlVinculacion" runat="server" CssClass="div-cuadro">
            <h3>Vinculaciones al cuerpo académico</h3>
            <br />
            La siguiente lista muestra las vinculaciones vigentes al cuerpo académico que le han realizado las distintas instituciones<asp:Literal ID="lblPendientes" runat="server" Text=" y que están pendientes de revisión" />.<br />
            Deberá aprobarlas o rechazarlas para que cada institución pueda presentar su solicitud de acreditación.<br />
            Sólamente aparecerán las vinculaciones de solicitudes de acreditación que estén siendo completadas.
            Las vinculaciones de solicitudes de acreditación ya presentadas puede consultarlas <a href="vinculacion-historia.aspx">haciendo clic aquí</a>.
            <br />
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
                <SettingsText EmptyDataRow="No hay vinculaciones vigentes para revisar." CommandCancel="Cancelar"
                    CommandClearFilter="Limpiar" CommandDelete="Eliminar" CommandEdit="Modificar"
                    CommandNew="Nuevo" CommandSelect="Seleccionar" CommandUpdate="Actualizar" ConfirmDelete="Eliminar"
                    CustomizationWindowCaption="Personalizar" EmptyHeaders="Vaciar encabezados" FilterBarClear="Limpiar"
                    FilterBarCreateFilter="Crear" FilterControlPopupCaption="Filtros" GroupContinuedOnNextPage="Continúa en la página siguiente"
                    GroupPanel="Arrastre una columna para agrupar por ese criterio." HeaderFilterShowAll="Mostrar todo"
                    PopupEditFormCaption="Editar" Title="Datos" />
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="Identificador" Visible="false" FieldName="ID_CARGOS_DOCENTES"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID. de la rama" Visible="false" FieldName="ID_NIVELES_EDUCATIVOS"></dxwgv:GridViewDataTextColumn>
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
                    <dxwgv:GridViewDataTextColumn Caption="Carrera(s)" FieldName="CARRERAS"></dxwgv:GridViewDataTextColumn>
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
            </div>
                <div style="float: left">
                <asp:Button ID="btnAprobar" runat="server" Text="Revisar vinculación" CssClass="boton boton-azul" onclick="btnRevisar_Click" />   
                </div>
                <div style="float: right; margin-top: 6px">
                    <asp:CheckBox ID="chkMostrarAprobadas" runat="server" TextAlign="Left" OnCheckedChanged="chkMostrarAprobadas_Click" AutoPostBack="true" Text="Mostrar ítems revisados con anterioridad" />   
                </div>
                <div class="clear"></div>
        </asp:Panel>

        <br />

        <asp:Panel ID="pnlOtrasVinculaciones" runat="server" CssClass="div-cuadro">
            <h3>Otras vinculaciones</h3>
            <br />
            La siguiente lista muestra vinculaciones adicionales que han sido realizadas por las distintas instituciones, como autoridad de carreras, unidades académicas o integrante o director de comités y actividades<asp:Literal ID="lblPendientesOtras" runat="server" Text=" y que están pendientes de revisión" />.<br />
            Deberá aprobarlas o rechazarlas para que cada institución pueda continuar con su solicitud de acreditación.<br />
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
                <SettingsText EmptyDataRow="No hay otras vinculaciones vigentes para revisar." CommandCancel="Cancelar"
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
            <br />
            </div>
                <div style="float: left">
                <asp:Button ID="btnAprobarVin" runat="server" Text="Aprobar" CssClass="boton boton-verde" onclick="btnAprobarO_Click" />   
                <asp:Button ID="btnRechazarVin" runat="server" Text="Rechazar" CssClass="boton boton-rojo" onclick="btnRechazarO_Click" />   
                </div>
                <div style="float: right; margin-top: 6px">
                    <asp:CheckBox ID="chkMostrarAprobadasOtras" runat="server" TextAlign="Left" OnCheckedChanged="chkMostrarAprobadasOtras_Click" AutoPostBack="true" Text="Mostrar ítems ya revisados" />   
                </div>
                <div class="clear"></div>
        </asp:Panel>

        <br />

        <asp:Panel ID="pnlExpertos" runat="server" Visible="false">
            <div class="div-form-tituloCG">Registro de Expertos de la CONEAU</div>
            <div class="divSubregion">
            Si desea solicitar la incorporación al Registro de Expertos de la CONEAU, puede hacerlo desde la siguiente opción.
            <br /><br />
        </asp:Panel>
 

 </div>


 </asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Popup" runat="server">



    <!-- POPUP CARGOS DOCENTES -->
    <dxpc:ASPxPopupControl ID="popCargosDocentes" runat="server" CloseAction="CloseButton"
        Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popup" HeaderText="Información de la vinculación docente" 
        AllowDragging="True" EnableAnimation="True" EnableViewState="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
        CssPostfix="Glass" ImageFolder="~/App_Themes/Glass/{0}/" EnableHierarchyRecreation="False" ScrollBars="None">
        <SizeGripImage Height="12px" Width="12px" />
        <CloseButtonImage Height="17px" Width="17px" />
        <HeaderStyle Font-Bold="True">
        </HeaderStyle>
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <!-- DETALLE -->
                <div class="div-no-carga" style="text-align: left">
                Revise la siguiente información. Si todos los datos son <b>correctos</b>, apruébelo haciendo clic en el botón "Aprobar vinculación".
                <br />
                Si encuentra información <b>incorrecta</b>, haga clic en "Rechazar vinculación" e ingrese una descripción de la información que detectó como incorrecta o faltante.
                </div>
                <div class="divPopup" style="overflow: auto; min-height: 300px">
                    <div class="div-form-cuadroPopup">
                        <asp:Label ID="Label1129" runat="server" Text="Institución: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:TextBox ID="txtInstitucion" runat="server" CssClass="axControl" Width="400" BackColor="#eeeeee" ReadOnly="true"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label12343" runat="server" Text="Unidad Académica/Sede: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:TextBox ID="txtUnidadAcademica" runat="server" CssClass="axControl" Width="400" BackColor="#eeeeee" ReadOnly="true"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Panel ID="pnlCargoGrado" runat="server">
                        <asp:Label ID="Label5219" runat="server" Text="Cargo: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:TextBox ID="txtTipoCargo" runat="server" CssClass="axControl" Width="300" BackColor="#eeeeee" ReadOnly="true"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label2341" runat="server" Text="Designación: " CssClass="axEtiqueta" Width="150"></asp:Label>
                        <asp:TextBox ID="txtDesignacion" runat="server" CssClass="axControl" Width="200" BackColor="#eeeeee" ReadOnly="true"></asp:TextBox>
                        <br />
                        <br />
                        </asp:Panel>
                        <asp:Panel ID="pnlCargoPosgrado" runat="server">
                            <asp:Label ID="Label151" runat="server" Text="Carrera: " CssClass="axEtiqueta" Width="150"></asp:Label>
                            <asp:TextBox ID="txtCargoCarrera" runat="server" Width="400" CssClass="axControl" BackColor="#eeeeee" ReadOnly="true"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label1152" runat="server" Text="Tipo de vínculo: " CssClass="axEtiqueta" Width="150"></asp:Label>
                            <asp:TextBox ID="txtTipoVinculo" runat="server" Width="150" CssClass="axControl" BackColor="#eeeeee" ReadOnly="true"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Panel ID="pnlCargoDistancia" runat="server">
                                <asp:Label ID="Label6113" runat="server" Text="Pertenencia: " CssClass="axEtiqueta" Width="150"></asp:Label>
                                <asp:TextBox ID="txtPertenencia" runat="server" Width="250" CssClass="axControl" BackColor="#eeeeee" ReadOnly="true"></asp:TextBox>
                                <br />
                                <br />
                            </asp:Panel>
                            <table class="tabla-color">
                                <tr>
                                    <td><b>El docente es Director o Coordinador de la carrera:</b></td>
                                    <td><asp:CheckBox ID="chkCargoDirector" runat="server"  Enabled="false" /></td>
                                </tr>
                            </table>
                            <br />
                            <asp:Label ID="Label14" runat="server" Text="* Fecha de designación: " CssClass="axEtiqueta" Width="150"></asp:Label>
                            <asp:TextBox ID="txtFechaDesignacion" runat="server" Width="120" CssClass="axControl" BackColor="#eeeeee" ReadOnly="true"></asp:TextBox>
                            <br />
                            <br />
                        </asp:Panel>
                        
                        
                    Dedicación de la vinculación para cada tipo de actividad llevada a cabo según su designación.
                    <table class="tabla-color">
                        <tr style="text-align: center">
                            <td><b>Tipo de actividad</b></td>
                            <td><b>Dedicación<br />semanal</b></td>
                            <td><b>Modalidad</b></td>
                            <td style="display: <%= esGrado ? "table-cell" : "none" %>"><b>Dedicación<br />promedio anual</b></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Docencia</td>
                            <td><asp:TextBox ID="txtDedicacion1" Text="0" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                            <td><asp:DropDownList ID="ddlModalidad1" runat="server" CssClass="axControl" Enabled="false" BackColor="#eeeeee" Width="230" /></td>
                            <td style="display: <%= esGrado ? "table-cell" : "none" %>"><asp:TextBox ID="txtDedicacionP1" Text="0" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Investigación</td>
                            <td><asp:TextBox ID="txtDedicacion2" Text="0" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                            <td><asp:DropDownList ID="ddlModalidad2" runat="server" CssClass="axControl" Enabled="false" BackColor="#eeeeee" Width="230" /></td>
                            <td style="display: <%= esGrado ? "table-cell" : "none" %>"><asp:TextBox ID="txtDedicacionP2" Text="0" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Gestión</td>
                            <td><asp:TextBox ID="txtDedicacion3" Text="0" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                            <td><asp:DropDownList ID="ddlModalidad3" runat="server" CssClass="axControl" Enabled="false" BackColor="#eeeeee" Width="230" /></td>
                            <td style="display: <%= esGrado ? "table-cell" : "none" %>"><asp:TextBox ID="txtDedicacionP3" Text="0" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Vinculación con el medio</td>
                            <td><asp:TextBox ID="txtDedicacion7" Text="0"  runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                            <td><asp:DropDownList ID="ddlModalidad7" runat="server" CssClass="axControl" Enabled="false" BackColor="#eeeeee" Width="230" /></td>
                            <td style="display: <%= esGrado ? "table-cell" : "none" %>"><asp:TextBox ID="txtDedicacionP7" Text="0" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Dirección de tesis</td>
                            <td><asp:TextBox ID="txtDedicacion4" Text="0"  runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                            <td><asp:DropDownList ID="ddlModalidad4" runat="server" CssClass="axControl" Enabled="false" BackColor="#eeeeee" Width="230" /></td>
                            <td style="display: <%= esGrado ? "table-cell" : "none" %>"><asp:TextBox ID="txtDedicacionP4" Text="0" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Tutorías</td>
                            <td><asp:TextBox ID="txtDedicacion5" Text="0" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                            <td><asp:DropDownList ID="ddlModalidad5" runat="server" CssClass="axControl" Enabled="false" BackColor="#eeeeee" Width="230" /></td>
                            <td style="display: <%= esGrado ? "table-cell" : "none" %>"><asp:TextBox ID="txtDedicacionP5" Text="0" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Otras</td>
                            <td><asp:TextBox ID="txtDedicacion6" Text="0" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                            <td><asp:DropDownList ID="ddlModalidad6" runat="server" CssClass="axControl" Enabled="false" BackColor="#eeeeee" Width="230" /></td>
                            <td style="display: <%= esGrado ? "table-cell" : "none" %>"><asp:TextBox ID="txtDedicacionP6" Text="0" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                        </tr>
                        <tr>
                            <td style="text-align: right"><b>Total</b></td>
                            <td><asp:TextBox ID="txtDedicacionTotal" Text="0" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                            <td></td>
                            <td style="display: <%= esGrado ? "table-cell" : "none" %>"><asp:TextBox ID="txtDedicacionPTotal" Text="0"  runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
                        </tr>
                    </table>
                    <br />
                    <asp:Panel ID="pnlCargoPosgrado2" runat="server">
                        <asp:Label ID="Label15" runat="server" Text="Descripción de las actividades señaladas en el cuadro de arriba:" CssClass="axEtiqueta"></asp:Label> 
                        <br />              
                        <asp:TextBox ID="txtActividades" runat="server" Width="100%" CssClass="axControl" TextMode="MultiLine" BackColor="#eeeeee" ReadOnly="true"></asp:TextBox>
                        <br />
                        <br /> 
                    </asp:Panel>
                   
                    <asp:Panel ID="pnlActividadesCurriculares" runat="server">
                   
                    Actividades curriculares y carreras para las que se ha designado:
                    <br />
                    <div style="overflow-x: auto">
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
                                <dxwgv:GridViewDataTextColumn Caption="Identificador" FieldName="ID_PRESENTACIONES_CARRERAS" Visible="false"></dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Actividad curricular" FieldName="ACTIVIDAD_CURRICULAR"></dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Carrera" FieldName="CARRERA"></dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Plan de estudios" FieldName="ANIO_APROBACION"></dxwgv:GridViewDataTextColumn>
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
                    </asp:Panel>
                    
                    
                </div>
                </div>
                <!-- FIN DETALLE -->

                <!-- BOTONERA-->
                <div class="botonera-inferior-der">
                    <asp:Button ID="btnAceptarCargo" runat="server" Text="Aprobar vinculación" CssClass="boton boton-verde" OnClick="btnAceptarCargo_Click" />
                    <asp:Button ID="btnCancelarCargo" runat="server" Text="Rechazar vinculación" CssClass="boton boton-rojo" OnClick="btnCancelarCargo_Click" />
                </div>
                <!-- FIN BOTONERA-->
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP CARGOS DOCENTES -->
    
 


    <!-- POPUP CARGOS DOCENTES -->
    <dxpc:ASPxPopupControl ID="popEscribir" runat="server" CloseAction="CloseButton"
        Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popup" HeaderText="Información del cargo docente"
        AllowDragging="True" EnableAnimation="True" EnableViewState="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
        CssPostfix="Glass" ImageFolder="~/App_Themes/Glass/{0}/" EnableHierarchyRecreation="False">
        <SizeGripImage Height="12px" Width="12px" />
        <CloseButtonImage Height="17px" Width="17px" />
        <HeaderStyle Font-Bold="True">
        </HeaderStyle>
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <div class="divPopup" style="overflow: auto; max-height: 400px;">
                    <div class="div-form-cuadroPopup">
                    <b>Ingrese el motivo por el cual ha rechazado la vinculación</b> (ej: Tipo de cargo incorrecto, falta vincular a una materia, etc.):
                    <br />
                    <asp:TextBox ID="txtEscribir" runat="server" TextMode="MultiLine" CssClass="axControl" style="width: 100%"></asp:TextBox>
                    </div>
                </div>
                <div class="botonera-inferior-der">
                    <asp:Button ID="btnAceptarEscribir" runat="server" Text="Aceptar" CssClass="boton boton-verde" OnClick="btnAceptarEscribir_Click" />
                    <asp:Button ID="btnCancelarEscribir" runat="server" Text="Cancelar" CssClass="boton boton-rojo" OnClick="btnCancelarEscribir_Click" />
                </div>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP CARGOS DOCENTES -->
    
    



    <!-- POPUP USAR CVAR -->
    <dxpc:ASPxPopupControl ID="popUsarCVar" runat="server" CloseAction="CloseButton"
        Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popup" HeaderText="Hemos detectado un currículum CVar"
        AllowDragging="True" EnableAnimation="True" EnableViewState="True" CssFilePath="~/App_Themes/Glass/{0}/styles.css"
        CssPostfix="Glass" ImageFolder="~/App_Themes/Glass/{0}/" EnableHierarchyRecreation="False">
        <SizeGripImage Height="12px" Width="12px" />
        <CloseButtonImage Height="17px" Width="17px" />
        <HeaderStyle Font-Bold="True">
        </HeaderStyle>
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
                <div class="divPopup" style="overflow: auto; max-height: 400px;">
                    <div class="div-form-cuadroPopup">
                    Actualmente, no está utilizando CVar para su currículum docente. 
                    Sin embargo, hemos detectado que se encuentra registrado en CVar bajo el CUIT <asp:Literal ID="lblCUIT2" runat="server" />.<br />
                    <br />
                    <br />
                    Esta opción es recomendada ya que con sólo actualizar su currículum CVar, automáticamente tendrá completa la información 
                    necesaria para CONEAU, el programa de Incentivos, CONICET y otros Organismos.
                    <br />
                    <br />
                    <b>¿Desea utilizar el currículum CVar a partir de ahora?</b>
                    </div>
                </div>
                <div class="botonera-inferior-der">
                    <asp:Button ID="btnUsarCVar" runat="server" Text="Sí (recomendado)" CssClass="boton boton-verde" OnClick="btnUsarCVar_Click" />
                    <asp:Button ID="btnNoUsarCVar" runat="server" Text="No, gracias" CssClass="boton boton-rojo" OnClick="btnNoUsarCVar_Click" />
                </div>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP USAR CVAR -->
    
    
        
    
</asp:Content>