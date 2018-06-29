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

<span class="lbl-punto">6.1.</span> Desempeños no académicos 
<% if (sgwNucleo.Usuarios.EsDocente()) { %><br /><br /><div class="div-titulo-popup-violeta" style="font-weight: normal"><b>Origen CVar</b>: Antecedentes > Otras actividades CyT > Ejercicio de la profesión en el ámbito no académico</div><br /><% } %>
<div class="div-punto">
       

        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
            <dxwgv:ASPxGridView ID="grdCargosNoAcademicos" runat="server" AutoGenerateColumns="False"
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
                    <dxwgv:GridViewCommandColumn Caption="Acciones" ButtonType="Image"><CustomButtons>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarCargoNoAcademicoP"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución" FieldName="organizacion"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Cargo/Función" FieldName="tipoFuncionActividad"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Descripción" FieldName="descripcion" Visible="false"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataDateColumn Caption="Fecha de inicio" FieldName="fechaInicio" SortOrder="Descending"><PropertiesDateEdit DisplayFormatString="{0:d}"></PropertiesDateEdit></dxwgv:GridViewDataDateColumn>
                    <dxwgv:GridViewDataDateColumn Caption="Fecha de finalización" FieldName="fechaFin"><PropertiesDateEdit DisplayFormatString="{0:d}"></PropertiesDateEdit></dxwgv:GridViewDataDateColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Disciplina" FieldName="areaEjercicio"></dxwgv:GridViewDataTextColumn>
                </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarCargoNoAcademicoP') { btnModificarCargoNoAcademicoP_Click(); }
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
        </script>
        <div class="div-abm-botonera-derecha">
           
            <asp:Button ID="btnModificarCargoNoAcademicoP" runat="server" Text="Modificar" CssClass="boton boton-azul"
                Width="80" Height="25" OnClick="btnModificar_Click" />
           
        </div>
        </div>
</div>
    <div class="div-clear">
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
                          <asp:Label ID="Label4" runat="server" Text="Institución: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtOrganizacion" runat="server" CssClass="axControl" Enabled="False"
                            Width="400"></asp:TextBox>
                            <br /><br />
                            
                             <asp:Label ID="Label2" runat="server" Text="Cargo/Función: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtFuncion" runat="server" CssClass="axControl" Enabled="False"
                            Width="400"></asp:TextBox>
                            <br /><br />
                            
                              <asp:Label ID="Label3" runat="server" Text="Disciplina: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtArea" runat="server" CssClass="axControl" Enabled="False"
                            Width="400"></asp:TextBox>
                            <br /><br />
                            
                            
                              <asp:Label ID="Label5" runat="server" Text="Fecha de inicio: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtFechaInicio" runat="server" CssClass="axControl" Enabled="False"
                            Width="100"></asp:TextBox>
                            <br /><br />
                        
                        <asp:Label ID="Label10" runat="server" Text="Fecha de finalización: " CssClass="axEtiqueta"
                            Width="200px"></asp:Label>
                        <asp:TextBox ID="edtFechaFin" runat="server" CssClass="axControl" Enabled="False"
                            Width="100"></asp:TextBox>
                        <br />
                        <br />
                         <asp:Label ID="Label1" runat="server" Text="Descripción: " CssClass="axEtiqueta"
                            Width="200px"></asp:Label>
                        <asp:TextBox ID="edtDescripcion" runat="server" CssClass="axControl" Enabled="False"
                            Width="400"></asp:TextBox>
                        <br />
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