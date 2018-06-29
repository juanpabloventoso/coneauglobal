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


<span class="lbl-punto">4.1.</span> Cargos docentes desempeñados.
<% if (sgwNucleo.Usuarios.EsDocente()) { %><br /><br /><div class="div-titulo-popup-violeta" style="font-weight: normal"><b>Origen CVar</b>: Cargos > Docencia > Nivel superior univesitario y/o posgrado</div><br /><% } %>
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
                    <dxwgv:GridViewCommandColumn Caption="Acciones" ButtonType="Image"><CustomButtons>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarDocenteActual"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ID" Visible="false"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Institución/Unidad académica" FieldName="organizacion"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Cargo" FieldName="cargo"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Dedicación semanal" FieldName="dedicacionHorariaSemanal"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Designación" FieldName="tipoCargo"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataDateColumn Caption="Fecha de inicio" FieldName="fechaInicio" SortOrder="Descending">
                        <PropertiesDateEdit DisplayFormatString="{0:d}"></PropertiesDateEdit>
                    </dxwgv:GridViewDataDateColumn>
                    <dxwgv:GridViewDataDateColumn Caption="Fecha de finalización" FieldName="fechaFin">
                        <PropertiesDateEdit DisplayFormatString="{0:d}"></PropertiesDateEdit>
                    </dxwgv:GridViewDataDateColumn>
                </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarDocenteActual') { btnModificarDocenteActual_Click(); }
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
        </script>
        <div class="div-abm-botonera-derecha">
           
            <asp:Button ID="btnModificarDocenteActual" runat="server" Text="Modificar" CssClass="boton boton-azul"
                Width="80" Height="25" OnClick="btnModificarDocenteActual_Click" />
           
        </div>
        <!-- FIN GRILLA ABM CARGOS DOCENTES ACTUAL -->
        <div class="div-clear">
        </div>
    </div>
</div>
    
    

    
    
<span class="lbl-punto">4.2.</span> Dirección de tesis, tesinas y trabajos finales.
<% if (sgwNucleo.Usuarios.EsDocente()) { %><br /><br /><div class="div-titulo-popup-violeta" style="font-weight: normal"><b>Origen CVar</b>: Antecedentes > Formación de recursos humanos en CyT > Tesistas</div><br /><% } %>
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
                <div class="divPopup" style="width: 700px; overflow: auto">
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
                             <asp:Label ID="Label4" runat="server" Text="Dedicación: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtDedicacion" runat="server" CssClass="axControl" Enabled="False"
                            Width="400"></asp:TextBox>
                            <br />
                            <br />
                             <asp:Label ID="Label1" runat="server" Text="Designación: " CssClass="axEtiqueta" Width="200"></asp:Label>
                            <asp:TextBox ID="edtTipoCargo" runat="server" CssClass="axControl" Enabled="False"
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
                            
                            
                            <br /><br />
                            Actividad Curriculares
                            
                            <br /><br />
                            <div class="div-form-abm">
        <div class="div-form-abm-grilla" >
            <dxwgv:ASPxGridView ID="grdActCurricular" runat="server" AutoGenerateColumns="False"
                CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="600px"
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
                   
                    <dxwgv:GridViewDataTextColumn Caption="Denominación" FieldName="actividadCurricular"></dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Profesor responsable" FieldName="profesorResponsable"></dxwgv:GridViewDataTextColumn>
                    
                   
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
           
          
           
        </div>
    
        <div class="div-clear">
        </div>
    </div>
                    
                    
                    
                    </div>
                </div>
                <!-- FIN DETALLE -->

                <!-- BOTONERA-->
                <div class="botonera-inferior-der">
                   
                    <asp:Button ID="btnCancelarCargoDocenteActual" runat="server" Text="Cerrar" CssClass="boton boton-rojo"
                        Width="90" Height="25" OnClick="btnCancelarCargoDocenteActual_Click" />
                </div>
                <!-- FIN BOTONERA -->
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP CARGOS DOCENTES ACTUAL -->
    
    
    


    
    
    
    


   
    
        
    

   
</asp:Content>