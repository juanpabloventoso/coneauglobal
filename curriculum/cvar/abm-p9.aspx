<%@ Page Language="C#" MasterPageFile="../abm.master" AutoEventWireup="true" CodeFile="abm-p9.aspx.cs"
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

<span class="lbl-punto">9.1.</span> Evaluación de personal de ciencia y tecnología, jurado de tesis y/o premios.
<% if (sgwNucleo.Usuarios.EsDocente()) { %><br /><br /><div class="div-titulo-popup-violeta" style="font-weight: normal"><b>Origen CVar</b>: Antecedentes > Evaluación > Evaluación de personal CyT y jurado de tesis y/o premios</div><br /><% } %>
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
		                <dxwgv:GridViewDataTextColumn Caption="Tipo de evaluación" VisibleIndex="1" FieldName="tipoPersonalEvaluado" SortIndex="0" SortOrder="Ascending">
		                </dxwgv:GridViewDataTextColumn>
		             <dxwgv:GridViewDataTextColumn Caption="Institución" VisibleIndex="1" FieldName="institucion">
		                </dxwgv:GridViewDataTextColumn>
		               <dxwgv:GridViewDataTextColumn Caption="País" VisibleIndex="1" FieldName="lugarPais">
		                </dxwgv:GridViewDataTextColumn>
		               <dxwgv:GridViewDataTextColumn Caption="Ciudad" VisibleIndex="1" FieldName="ciudad">
		                </dxwgv:GridViewDataTextColumn>
		                 <dxwgv:GridViewDataTextColumn Caption="Año" FieldName="anio" VisibleIndex="0" SortIndex="0" SortOrder="Descending"></dxwgv:GridViewDataTextColumn>
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
		            Width="80" Height="25" OnClick="btnModificarEvaluaciones1_Click" />
		    </div>
		    <!-- FIN GRILLA ABM TITULOS GRADO -->
		    <div class="div-clear">
		    </div>
		    </div>
		</div>


<span class="lbl-punto">9.2.</span> Evaluación de programas/proyectos de investigación y desarrollo y/o extensión.
<% if (sgwNucleo.Usuarios.EsDocente()) { %><br /><br /><div class="div-titulo-popup-violeta" style="font-weight: normal"><b>Origen CVar</b>: Antecedentes > Evaluación > Evaluación de programas/proyectos de I+D y/o extensión</div><br /><% } %>
<div class="div-punto">
		    
		    <div class="div-form-abm">
		        <div class="div-form-abm-grilla">
		        <dxwgv:ASPxGridView ID="grdEvaluacionInvestigacion" runat="server" AutoGenerateColumns="False"
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
		             <dxwgv:GridViewDataTextColumn Caption="Institución" VisibleIndex="1" FieldName="institucion">
		                </dxwgv:GridViewDataTextColumn>
		               <dxwgv:GridViewDataTextColumn Caption="País" VisibleIndex="1" FieldName="lugarPais">
		                </dxwgv:GridViewDataTextColumn>
		               <dxwgv:GridViewDataTextColumn Caption="Ciudad" VisibleIndex="1" FieldName="ciudad">
		                </dxwgv:GridViewDataTextColumn>
		                 <dxwgv:GridViewDataTextColumn Caption="Año" FieldName="anio" VisibleIndex="0" SortIndex="0" SortOrder="Descending"></dxwgv:GridViewDataTextColumn>
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
		            Width="80" Height="25" OnClick="btnModificarEvaluaciones2_Click" />
		    </div>
		    <!-- FIN GRILLA ABM TITULOS GRADO -->
		    <div class="div-clear">
		    </div>
		    </div>
		</div>


<span class="lbl-punto">9.3.</span> Evaluación de trabajos en revistas de ciencia y tecnología.
<% if (sgwNucleo.Usuarios.EsDocente()) { %><br /><br /><div class="div-titulo-popup-violeta" style="font-weight: normal"><b>Origen CVar</b>: Antecedentes > Evaluación > Evaluación de trabajos en revistas de CyT</div><br /><% } %>
<div class="div-punto">
		    
		    <div class="div-form-abm">
		        <div class="div-form-abm-grilla">
		        <dxwgv:ASPxGridView ID="grdEvaluacionRevistas" runat="server" AutoGenerateColumns="False"
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
		                <dxwgv:GridViewDataTextColumn Caption="Revista" VisibleIndex="1" FieldName="tituloRevista">
		                </dxwgv:GridViewDataTextColumn>
		               <dxwgv:GridViewDataTextColumn Caption="País" VisibleIndex="1" FieldName="lugarPais">
		                </dxwgv:GridViewDataTextColumn>
		               <dxwgv:GridViewDataTextColumn Caption="Ciudad" VisibleIndex="1" FieldName="ciudad">
		                </dxwgv:GridViewDataTextColumn>
		               <dxwgv:GridViewDataTextColumn Caption="Función" VisibleIndex="1" FieldName="funcionDesempeniada">
		                </dxwgv:GridViewDataTextColumn>
		                 <dxwgv:GridViewDataTextColumn Caption="Año" FieldName="anio" VisibleIndex="0" SortIndex="0" SortOrder="Descending"></dxwgv:GridViewDataTextColumn>
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
		        <asp:Button ID="Button2" runat="server" Text="Modificar" CssClass="boton boton-azul"
		            Width="80" Height="25" OnClick="btnModificarEvaluaciones3_Click" />
		    </div>
		    <!-- FIN GRILLA ABM TITULOS GRADO -->
		    <div class="div-clear">
		    </div>
		    </div>
		</div>


<span class="lbl-punto">9.4.</span> Evaluación institucional.
<% if (sgwNucleo.Usuarios.EsDocente()) { %><br /><br /><div class="div-titulo-popup-violeta" style="font-weight: normal"><b>Origen CVar</b>: Antecedentes > Evaluación > Evaluación institucional</div><br /><% } %>
<div class="div-punto">
		    
		    <div class="div-form-abm">
		        <div class="div-form-abm-grilla">
		        <dxwgv:ASPxGridView ID="grdEvaluacionInstitucional" runat="server" AutoGenerateColumns="False"
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
		                <dxwgv:GridViewDataTextColumn Caption="Tipo de evaluación" VisibleIndex="1" FieldName="tipoEvaluacionInstitucional">
		                </dxwgv:GridViewDataTextColumn>
		             <dxwgv:GridViewDataTextColumn Caption="Institución" VisibleIndex="1" FieldName="institucion">
		                </dxwgv:GridViewDataTextColumn>
		               <dxwgv:GridViewDataTextColumn Caption="País" VisibleIndex="1" FieldName="lugarPais">
		                </dxwgv:GridViewDataTextColumn>
		               <dxwgv:GridViewDataTextColumn Caption="Ciudad" VisibleIndex="1" FieldName="ciudad">
		                </dxwgv:GridViewDataTextColumn>
		                 <dxwgv:GridViewDataTextColumn Caption="Año" FieldName="anio" VisibleIndex="0" SortIndex="0" SortOrder="Descending"></dxwgv:GridViewDataTextColumn>
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
		        <asp:Button ID="Button3" runat="server" Text="Modificar" CssClass="boton boton-azul"
		            Width="80" Height="25" OnClick="btnModificarEvaluaciones4_Click" />
		    </div>
		    <!-- FIN GRILLA ABM TITULOS GRADO -->
		    <div class="div-clear">
		    </div>
		    </div>
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
                        <asp:Label ID="Label1" runat="server" Text="Organismo o institución convocante: "
                            CssClass="axEtiqueta" Width="215"></asp:Label>
                        <asp:TextBox ID="cmbInstitucion" runat="server" Width="400px"
                            CssClass="axControl"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label27" runat="server" Text="Tipo de evaluación: " CssClass="axEtiqueta"
                            Width="215"></asp:Label>
                        <asp:TextBox ID="cmbExperienciasEvaluacionTiposEvaluacion" runat="server" Width="300px"
                            CssClass="axControl"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label8" runat="server" Text="Año: " CssClass="axEtiqueta" Width="215px"></asp:Label>
                        <asp:TextBox ID="edtExperienciasEvaluacionAnio" runat="server" CssClass="axControl"
                            Width="100px"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Ciudad: " CssClass="axEtiqueta" Width="215"></asp:Label>
                        <asp:TextBox ID="edtExperienciasEvaluacionCiudad" runat="server" CssClass="axControl"
                            Width="400px"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="País: " CssClass="axEtiqueta" Width="215"></asp:Label>
                        <asp:TextBox ID="edtExperienciasEvaluacionPais" runat="server" CssClass="axControl"
                            Width="400px"></asp:TextBox>
                        <br />
                        <br />
                    </div>
                </div>
                <!-- FIN DETALLE -->
                <br />
                <!-- BOTONERA -->
                <div class="divBotonera">
                    <asp:Button ID="btnCancelarExperienciaEvaluacion" runat="server" Text="Cancelar"
                        CssClass="boton boton-rojo" Width="90" Height="25" OnClick="btnCancelarEvaluaciones_Click" />
                </div>
                <!-- FIN BOTONERA -->
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <!-- FIN POPUP EXPERIENCIAS EVALUACION -->

</asp:Content>