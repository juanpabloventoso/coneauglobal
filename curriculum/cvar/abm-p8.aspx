<%@ Page Language="C#" MasterPageFile="../abm.master" AutoEventWireup="true" CodeFile="abm-p8.aspx.cs"
    Inherits="_Default" Title="Reuniones científicas - ATENEA | Currículum Docente" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Central" runat="server">

<h3>8. Participación en reuniones científicas o eventos artísticos</h3><br />

<span class="lbl-punto">8.1.</span> Participaciones que han sido publicadas.
<% if (sgwNucleo.Usuarios.EsDocente()) { %><br /><br /><div class="div-titulo-popup-violeta" style="font-weight: normal"><b>Origen CVar</b>: Producción > Producción científica > Trabajos en eventos CyT publicados</div><br /><% } %>
<div class="div-punto">
    <div class="div-form-abm">
        <div class="div-form-abm-grilla">
        <dxwgv:ASPxGridView ID="grdEvaluaciones" runat="server" AutoGenerateColumns="False"
            CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="800px"
            KeyFieldName="ID_REUNIONES">
            <SettingsBehavior AllowFocusedRow="True" />
            <Styles CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass">
                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                </Header>
                    <Cell VerticalAlign="Middle" Wrap="False">
                        <Paddings Padding="8px" />
                    </Cell>
            </Styles>
            <SettingsText EmptyDataRow="No hay información disponible." CommandCancel="Cancelar"
                CommandClearFilter="Limpiar" CommandDelete="Eliminar" CommandEdit="Modificar"
                CommandNew="Nuevo" CommandSelect="Seleciconar" CommandUpdate="Actualizar" ConfirmDelete="Eliminar"
                CustomizationWindowCaption="Personalizar" EmptyHeaders="Vaciar encabezados" FilterBarClear="Limpiar"
                FilterBarCreateFilter="Crear" FilterControlPopupCaption="Filtros" GroupContinuedOnNextPage="Continúa en la página siguiente"
                GroupPanel="Arrastre una columna para agrupar por ese criterio." HeaderFilterShowAll="Mostrar todo"
                PopupEditFormCaption="Editar" Title="Datos" />
            <Columns>
             <dxwgv:GridViewDataTextColumn Caption="Denominación de la actividad" VisibleIndex="1" FieldName="titulo" SortIndex="0" SortOrder="Ascending">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Evento" VisibleIndex="1" FieldName="nombreEvento" SortIndex="0" SortOrder="Ascending">
                </dxwgv:GridViewDataTextColumn>
                 <dxwgv:GridViewDataTextColumn Caption="Tipo de participación" VisibleIndex="1" FieldName="tipoEvento" SortIndex="0" SortOrder="Ascending">
                </dxwgv:GridViewDataTextColumn>
                  <dxwgv:GridViewDataTextColumn Caption="Lugar" VisibleIndex="1" FieldName="paisEvento" SortIndex="0" SortOrder="Ascending">
                </dxwgv:GridViewDataTextColumn>
                 <dxwgv:GridViewDataTextColumn Caption="Año" VisibleIndex="1" FieldName="anioEvento" SortIndex="0" SortOrder="Ascending">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Mes" VisibleIndex="1" FieldName="mesEvento" SortIndex="0" SortOrder="Ascending">
                </dxwgv:GridViewDataTextColumn>

            </Columns>
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
                <SettingsPager PageSize="10" CurrentPageNumberFormat="{0}" Position="Top" 
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
            <Settings ShowHeaderFilterButton="True" />
        </dxwgv:ASPxGridView>
    </div>
    <div class="div-abm-botonera-derecha">
       
        <asp:Button ID="btnModificarEvaluaciones" runat="server" Text="Modificar" CssClass="boton boton-azul"
            Width="80" Height="25" OnClick="btnModificar_Click" />
       
    </div>
    <!-- FIN GRILLA ABM TITULOS GRADO -->
    <div class="div-clear">
    </div>
    </div>
</div>



<span class="lbl-punto">8.2.</span> Participaciones que no han sido publicadas.
<% if (sgwNucleo.Usuarios.EsDocente()) { %><br /><br /><div class="div-titulo-popup-violeta" style="font-weight: normal"><b>Origen CVar</b>: Producción > Producción científica > Trabajos en eventos CyT no publicados</div><br /><% } %>
<div class="div-punto">
    <div class="div-form-abm">
        <div class="div-form-abm-grilla">
        <dxwgv:ASPxGridView ID="grdEvaluaciones2" runat="server" AutoGenerateColumns="False"
            CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="800px"
            KeyFieldName="ID_REUNIONES">
            <SettingsBehavior AllowFocusedRow="True" />
            <Styles CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass">
                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                </Header>
                    <Cell VerticalAlign="Middle" Wrap="False">
                        <Paddings Padding="8px" />
                    </Cell>
            </Styles>
            <SettingsText EmptyDataRow="No hay información disponible." CommandCancel="Cancelar"
                CommandClearFilter="Limpiar" CommandDelete="Eliminar" CommandEdit="Modificar"
                CommandNew="Nuevo" CommandSelect="Seleciconar" CommandUpdate="Actualizar" ConfirmDelete="Eliminar"
                CustomizationWindowCaption="Personalizar" EmptyHeaders="Vaciar encabezados" FilterBarClear="Limpiar"
                FilterBarCreateFilter="Crear" FilterControlPopupCaption="Filtros" GroupContinuedOnNextPage="Continúa en la página siguiente"
                GroupPanel="Arrastre una columna para agrupar por ese criterio." HeaderFilterShowAll="Mostrar todo"
                PopupEditFormCaption="Editar" Title="Datos" />
            <Columns>
             <dxwgv:GridViewDataTextColumn Caption="Denominación de la actividad" VisibleIndex="1" FieldName="titulo" SortIndex="0" SortOrder="Ascending">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Evento" VisibleIndex="1" FieldName="nombreEvento" SortIndex="0" SortOrder="Ascending">
                </dxwgv:GridViewDataTextColumn>
                 <dxwgv:GridViewDataTextColumn Caption="Tipo de participación" VisibleIndex="1" FieldName="tipoEvento" SortIndex="0" SortOrder="Ascending">
                </dxwgv:GridViewDataTextColumn>
                  <dxwgv:GridViewDataTextColumn Caption="Lugar" VisibleIndex="1" FieldName="paisEvento" SortIndex="0" SortOrder="Ascending">
                </dxwgv:GridViewDataTextColumn>
                 <dxwgv:GridViewDataTextColumn Caption="Año" VisibleIndex="1" FieldName="anioEvento" SortIndex="0" SortOrder="Ascending">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Mes" VisibleIndex="1" FieldName="mesEvento" SortIndex="0" SortOrder="Ascending">
                </dxwgv:GridViewDataTextColumn>

            </Columns>
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
                <SettingsPager PageSize="10" CurrentPageNumberFormat="{0}" Position="Top" 
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
            <Settings ShowHeaderFilterButton="True" />
        </dxwgv:ASPxGridView>
    </div>
    <div class="div-abm-botonera-derecha">
       
        <asp:Button ID="Button1" runat="server" Text="Modificar" CssClass="boton boton-azul"
            Width="80" Height="25" OnClick="btnModificar2_Click" />
       
    </div>
    <!-- FIN GRILLA ABM TITULOS GRADO -->
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
                        
                          <asp:Label ID="Label4" runat="server" Text="Denominación: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtTitulo" runat="server" CssClass="axControl"
                            Width="400"></asp:TextBox>
                            <br /><br />
                            
                             <asp:Label ID="Label2" runat="server" Text="Evento: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtEvento" runat="server" CssClass="axControl"
                            Width="400"></asp:TextBox>
                            <br /><br />
                            
                              <asp:Label ID="Label3" runat="server" Text="Tipo de participación: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtTipoEvento" runat="server" CssClass="axControl" 
                            Width="400"></asp:TextBox>
                            <br /><br />
                            
                            
                              <asp:Label ID="Label5" runat="server" Text="Lugar: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtPais" runat="server" CssClass="axControl" 
                            Width="400"></asp:TextBox>
                            <br /><br />
                        
                        <asp:Label ID="Label10" runat="server" Text="Año: " CssClass="axEtiqueta"
                            Width="200px"></asp:Label>
                        <asp:TextBox ID="edtAnioEvento" runat="server" CssClass="axControl"
                            Width="100"></asp:TextBox>
                        <br />
                        <br />
                         <asp:Label ID="Label1" runat="server" Text="Mes: " CssClass="axEtiqueta"
                            Width="200px"></asp:Label>
                        <asp:TextBox ID="edtMesEvento" runat="server" CssClass="axControl"
                            Width="100"></asp:TextBox>
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