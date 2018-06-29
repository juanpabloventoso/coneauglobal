<%@ Page Language="C#" MasterPageFile="../abm.master" AutoEventWireup="true" CodeFile="abm-p5.aspx.cs"
    Inherits="_Default" Title="Formación - ATENEA | Currículum Docente" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Central" runat="server">

<h3>5. Experiencia en gestión académica</h3><br />

<span class="lbl-punto">5.1.</span> Cargos en gestión. Completar un cuadro por cada uno de los cargos desempeñados.
<% if (sgwNucleo.Usuarios.EsDocente()) { %><br /><br /><div class="div-titulo-popup-violeta" style="font-weight: normal"><b>Origen CVar</b>: Cargos > Cargos en gestión institucional</div><br /><% } %>
<div class="div-punto">
        
        <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
            <dxwgv:ASPxGridView ID="grdCargosNoAcademicosABM" runat="server" AutoGenerateColumns="False"
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
                    <dxwgv:GridViewDataTextColumn Caption="Institución" VisibleIndex="1" FieldName="organizacion">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Cargo" VisibleIndex="1" FieldName="cargo">
                    </dxwgv:GridViewDataTextColumn>
                          <dxwgv:GridViewDataTextColumn Caption="Función" VisibleIndex="1" FieldName="tipoFuncion">
                    </dxwgv:GridViewDataTextColumn>
                      <dxwgv:GridViewDataTextColumn Caption="Dedicación semanal" VisibleIndex="1" FieldName="dedicacionHorariaSemanal">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Fecha de inicio" VisibleIndex="0" FieldName="fechaInicio" SortIndex="0" SortOrder="Descending"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Fecha de finalización" VisibleIndex="0" FieldName="fechaFin">
                    </dxwgv:GridViewDataTextColumn>
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
                        
                            <asp:Label ID="Label10" runat="server" Text="Institución: " CssClass="axEtiqueta"
                            Width="200px"></asp:Label>
                        <asp:TextBox ID="edtOrganizacion" runat="server" CssClass="axControl" Enabled="False"
                            Width="400"></asp:TextBox>
                        <br />
                        <br />
                            <asp:Label ID="Label15" runat="server" Text="Cargo: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtCargo" runat="server" CssClass="axControl" Enabled="False"
                            Width="400"></asp:TextBox>
                            <br />
                            <br />
                             <asp:Label ID="Label4" runat="server" Text="Función: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtFuncion" runat="server" CssClass="axControl" Enabled="False"
                            Width="400"></asp:TextBox>
                            <br />
                            <br />
                             <asp:Label ID="Label1" runat="server" Text="Dedicación semanal: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtDedicacion" runat="server" CssClass="axControl" Enabled="False"
                            Width="400"></asp:TextBox>
                             <br />
                            <br />
                             <asp:Label ID="Label2" runat="server" Text="Fecha de Inicio:" CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtFechaInicio" runat="server" CssClass="axControl" Enabled="False"
                            Width="100"></asp:TextBox>
                             <br />
                            <br />
                             <asp:Label ID="Label3" runat="server" Text="Fecha de Finalización:" CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtFechaFin" runat="server" CssClass="axControl" Enabled="False"
                            Width="100"></asp:TextBox>
                       
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