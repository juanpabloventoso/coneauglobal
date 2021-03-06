﻿<%@ Page Language="C#" MasterPageFile="../abm.master" AutoEventWireup="true" CodeFile="abm-p9.aspx.cs"
    Inherits="_Default" Title="Comités y jurados - ATENEA | Currículum Docente" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Central" runat="server">

<h3>9. Participación en comités evaluadores y jurados</h3><br />

<span class="lbl-punto">9.1.</span> Señale la experiencia en evaluación y acreditación en los últimos 5 años,
        indicando el organismo o la institución convocante y los tipos de evaluación realizadas.
        
        
<div class="div-punto">
		    
		    <div class="div-form-abm">
		        <div class="div-form-abm-grilla">
		        <dxwgv:ASPxGridView ID="grdEvaluaciones" runat="server" AutoGenerateColumns="False"
		            CssFilePath="~/App_Themes/Glass/GridView/styles.css" CssPostfix="Glass" Width="800px"
		            KeyFieldName="ID_EVALUACIONES">
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
                    <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;Acciones&nbsp;&nbsp;" ButtonType="Image"><CustomButtons>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdModificarEvaluaciones"><Image ToolTip="Modificar" Url="~/recursos/imagenes/iconos/editar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                        <dxwgv:GridViewCommandColumnCustomButton ID="btngrdEliminarEvaluaciones"><Image ToolTip="Eliminar" Url="~/recursos/imagenes/iconos/eliminar-gris.png" /></dxwgv:GridViewCommandColumnCustomButton>
                    </CustomButtons></dxwgv:GridViewCommandColumn>
		             <dxwgv:GridViewDataTextColumn Caption="Institución" VisibleIndex="1" FieldName="INSTITUCION" SortIndex="0" SortOrder="Ascending">
		                </dxwgv:GridViewDataTextColumn>
		               <dxwgv:GridViewDataTextColumn Caption="Lugar" VisibleIndex="1" FieldName="LUGAR" SortIndex="0" SortOrder="Ascending">
		                </dxwgv:GridViewDataTextColumn>
		                <dxwgv:GridViewDataTextColumn Caption="Tipo de evaluación" VisibleIndex="1" FieldName="TIPO_EVALUACION" SortIndex="0" SortOrder="Ascending">
		                </dxwgv:GridViewDataTextColumn>
		                 <dxwgv:GridViewDataDateColumn Caption="Fecha" FieldName="FECHA" VisibleIndex="1">
		                  <PropertiesDateEdit DisplayFormatString="{0:d}">
		                  </PropertiesDateEdit>
		                  <Settings AutoFilterCondition="Contains" />
		                  </dxwgv:GridViewDataDateColumn>
		                <dxwgv:GridViewDataTextColumn Caption="ID" VisibleIndex="1" FieldName="ID_EVALUACIONES"  Visible="false" SortIndex="0" SortOrder="Ascending">
		                </dxwgv:GridViewDataTextColumn>
		            </Columns>
                <ClientSideEvents CustomButtonClick="function(s, e) {
                  if (e.buttonID == 'btngrdModificarEvaluaciones') { btnModificarEvaluaciones_Click(); }
                  if (e.buttonID == 'btngrdEliminarEvaluaciones') { btnEliminarEvaluaciones_Click(); }
                }" />
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
            <script type="text/javascript">
                function btnModificarEvaluaciones_Click() { $('#<%= btnModificarEvaluaciones.ClientID %>')[0].click(); }
                function btnEliminarEvaluaciones_Click() { if (sgwConfirmarEliminar()) $('#<%= btnEliminarEvaluaciones.ClientID %>')[0].click(); }
            </script>
		    <asp:Button ID="btnAgregarEvaluaciones" runat="server" Text="+" title="Nuevo" CssClass="boton-grilla-agregar" OnClick="btnAgregarEvaluaciones_Click" />
		    <div class="div-abm-botonera-derecha">
		        <br />
		        <br />
		        <asp:Button ID="btnModificarEvaluaciones" runat="server" Text="Modificar" CssClass="boton boton-verde"
		            Width="80" Height="25" OnClick="btnModificarEvaluaciones_Click" />
		         <br />
		        <br />
		        <asp:Button ID="btnEliminarEvaluaciones" runat="server" Text="Eliminar" CssClass="boton boton-rojo"
		            Width="80" Height="25" OnClick="btnEliminarEvaluaciones_Click" />
		    </div>
		    <!-- FIN GRILLA ABM TITULOS GRADO -->
		    <div class="div-clear">
		    </div>
		    </div>
		</div>

<span class="lbl-punto">9.2.</span> El siguiente resumen se obtiene a partir de la experiencia en evaluación y acreditación
    ingresada en el punto 9.1.
<div class="div-punto">


    <table class="tabla-color">
        <tr>
            <td>Jurado de concurso</td>
            <td><asp:CheckBox ID="chkJuradoConcurso" runat="server"  Enabled="false" /></td>
        </tr>
        <tr>
            <td>Jurado de tesis</td>
            <td><asp:CheckBox ID="chkJuradoTesis" runat="server" Enabled="false" /></td>
        </tr>
        <tr>
            <td>Evaluación de becarios</td>
            <td><asp:CheckBox ID="chkEvaluacionBecarios" runat="server" Enabled="false" /></td>
        </tr>
        <tr>
            <td>Evaluación de investigadores</td>
            <td><asp:CheckBox ID="chkEvaluacionInvestigadores" runat="server" Enabled="false" /></td>
        </tr>
        <tr>
            <td>Evaluación de programas y proyectos</td>
            <td><asp:CheckBox ID="chkEvaluacionProgramas" runat="server" Enabled="false" /></td>
        </tr>
        <tr>
            <td>Evaluación de instituciones</td>
            <td><asp:CheckBox ID="chkEvaluacionInstituciones" runat="server" Enabled="false" /></td>
        </tr>
        <tr>
            <td>Evaluación para comité editorial</td>
            <td><asp:CheckBox ID="chkEvaluacionComite" runat="server" Enabled="false" /></td>
        </tr>
        <tr>
            <td>Evaluación y/o acreditación de carreras de grado y posgrado</td>
            <td><asp:CheckBox ID="chkEvaluacionAcreditacion" runat="server" Enabled="false" /></td>
        </tr>
    </table>


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

    <!-- POPUP EXPERIENCIAS EVALUACION -->
    <dxpc:ASPxPopupControl ID="popEvaluaciones" runat="server" CloseAction="CloseButton"
        Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popup" HeaderText="Agregar/Modificar comités o jurados" AllowDragging="True"
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
                        <asp:Label ID="Label1" runat="server" Text="* Organismo o institución convocante: "
                            CssClass="axEtiqueta" Width="222"></asp:Label>
                        <asp:DropDownList ID="cmbInstitucion" runat="server" Width="390px"
                            CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbInstitucion_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <asp:Panel ID="pnlOtraInstitucion" runat="server">
                            <br />
                            <asp:Label ID="Label11" runat="server" Text="* Otra (especificar): " CssClass="axEtiqueta"
                                Width="222px"></asp:Label>
                            <asp:TextBox ID="edtOtraInstitucion" runat="server" CssClass="axControl"
                                Width="390"></asp:TextBox>
                        </asp:Panel>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="* Lugar: " CssClass="axEtiqueta" Width="222"></asp:Label>
                        <asp:TextBox ID="edtExperienciasEvaluacionLugar" runat="server" CssClass="axControl"
                            Width="390px"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label27" runat="server" Text="* Tipo de evaluación: " CssClass="axEtiqueta"
                            Width="222"></asp:Label>
                        <asp:DropDownList ID="cmbExperienciasEvaluacionTiposEvaluacion" runat="server" Width="300px"
                            CssClass="axControl" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbExperienciasEvaluacionTiposEvaluacion_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <asp:Panel ID="pnlExperienciasEvaluacionOtroTipoEvaluacion" runat="server">
                            <br />
                            <asp:Label ID="Label3" runat="server" Text="* Otro (especificar): " CssClass="axEtiqueta"
                                Width="222"></asp:Label>
                            <asp:TextBox ID="edtExperienciasEvaluacionOtroTipoEvaluacion" runat="server" CssClass="axControl"
                                Width="300px"></asp:TextBox>
                            <br />
                        </asp:Panel>
                        <br />
                        <asp:Label ID="Label8" runat="server" Text="* Fecha: " CssClass="axEtiqueta" Width="222px"></asp:Label>
                        <asp:TextBox ID="edtExperienciasEvaluacionFecha" runat="server" CssClass="axControl"
                            Width="100px" placeholder="dd/mm/aaaa"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" TargetControlID="edtExperienciasEvaluacionFecha">
                        </asp:CalendarExtender>
                        <br />
                        <br />
                    </div>
                </div>
                <!-- FIN DETALLE -->
                <br />
                <!-- BOTONERA -->
                <div class="divBotonera">
                    <asp:Button ID="btnGuardarExperienciaEvaluacion" runat="server" Text="Guardar" CssClass="boton boton-verde"
                        Width="90" Height="25" OnClick="btnAceptarEvaluaciones_Click" />&nbsp;&nbsp;
                    <asp:Button ID="btnCancelarExperienciaEvaluacion" runat="server" Text="Cancelar"
                        CssClass="boton boton-rojo" Width="90" Height="25" OnClick="btnCancelarEvaluaciones_Click" />
                </div>
                <!-- FIN BOTONERA -->
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP EXPERIENCIAS EVALUACION -->

</asp:Content>