<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="base.master" CodeFile="revisar-vinculacion.aspx.cs" Inherits="form_inicio" Title="Revisar vinculación | Currículum docente - CONEAU Global" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Cabecera" runat="server">
Revisar vinculación
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">

<div style="padding: 6px">

 <asp:Panel ID="pnlNoAnda" runat="server"  Visible="false">
    <br />
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
</asp:Panel>
        

<asp:Literal ID="lblBienvenido" runat="server" />. Si Ud. no es <asp:Literal ID="lblNombre" runat="server" />, por favor ignore este pedido y el correo electrónico asociado.<br />
Ha recibido un mensaje debido a que la institución <asp:Literal ID="lblInstitucion" runat="server" /> indicó que Ud. tiene una vinculación con una solicitud de acreditación de carreras.
<br />
<br />

<div style="text-align: center">
<div style="text-align: left; max-width: 800px; margin: 0 auto; background: white; background: #f9f9f9; box-shadow: 0 1px 4px rgba(0,0,0,0.3); padding: 10px;">

<asp:Panel ID="pnlVinculacionCargo" runat="server">
    <div class="div-no-carga" style="text-align: left">
    Revise la información de la vinculación que completó la institución. Si todos los datos son <b>correctos</b>, apruébelo haciendo clic en el botón "Aprobar".
    <br />
    Si encuentra información <b>incorrecta</b>, haga clic en "Rechazar" e ingrese una descripción de la información que detectó como incorrecta o faltante.
    </div>
    <br />

    Institución que realizó la vinculación:<br />
    <asp:TextBox ID="txtInstitucion" runat="server" CssClass="axControl" BackColor="#eeeeee" ReadOnly="true" style="width: 100%; max-width: 500px"></asp:TextBox>
    <br />
    <br />
    Unidad Académica/Sede:<br />
    <asp:TextBox ID="txtUnidadAcademica" runat="server" CssClass="axControl" BackColor="#eeeeee" ReadOnly="true" style="width: 100%; max-width: 500px"></asp:TextBox>
    <br />
    <br />
    <asp:Panel ID="pnlCargoGrado" runat="server">
        Cargo:<br />
        <asp:TextBox ID="txtTipoCargo" runat="server" CssClass="axControl" BackColor="#eeeeee" ReadOnly="true" style="width: 100%; max-width: 300px"></asp:TextBox>
        <br />
        <br />
        Designación:<br />
        <asp:TextBox ID="txtDesignacion" runat="server" CssClass="axControl" BackColor="#eeeeee" ReadOnly="true" style="width: 100%; max-width: 200px"></asp:TextBox>
        <br />
        <br />
    </asp:Panel>
    <asp:Panel ID="pnlCargoPosgrado" runat="server">
        Carrera:<br />
        <asp:TextBox ID="txtCargoCarrera" runat="server" CssClass="axControl" BackColor="#eeeeee" ReadOnly="true" style="width: 100%; max-width: 500px"></asp:TextBox>
        <br />
        <br />
        Tipo de vínculo:<br />
        <asp:TextBox ID="txtTipoVinculo" runat="server" CssClass="axControl" BackColor="#eeeeee" ReadOnly="true" style="width: 100%; max-width: 150px"></asp:TextBox>
        <br />
        <br />
        <asp:Panel ID="pnlCargoDistancia" runat="server">
            Pertenencia:<br />
            <asp:TextBox ID="txtPertenencia" runat="server" CssClass="axControl" BackColor="#eeeeee" ReadOnly="true" style="width: 100%; max-width: 250px"></asp:TextBox>
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
        Fecha de designación:<br />
        <asp:TextBox ID="txtFechaDesignacion" runat="server" CssClass="axControl" BackColor="#eeeeee" ReadOnly="true" style="width: 100%; max-width: 120px"></asp:TextBox>
        <br />
        <br />
    </asp:Panel>
                        
                        
    Dedicación de la vinculación para cada tipo de actividad llevada a cabo.
    <div style="overflow-x: auto">
    <table class="tabla-color">
        <tr style="text-align: center">
            <td><b>Tipo de actividad</b></td>
            <td><b>Dedicación<br />semanal</b></td>
            <td><b>Modalidad</b></td>
            <td style="display: <%= esGrado ? "table-cell" : "none" %>"><b>Dedicación<br />promedio anual</b></td>
        </tr>
        <tr>
            <td style="text-align: right">Docencia</td>
            <td><asp:TextBox ID="txtDedicacion1" Text="0" runat="server" CssClass="axControl" Width="80" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
            <td><asp:DropDownList ID="ddlModalidad1" runat="server" CssClass="axControl" Enabled="false" BackColor="#eeeeee" Width="150" /></td>
            <td style="display: <%= esGrado ? "table-cell" : "none" %>"><asp:TextBox ID="txtDedicacionP1" Text="0" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
        </tr>
        <tr>
            <td style="text-align: right">Investigación</td>
            <td><asp:TextBox ID="txtDedicacion2" Text="0" runat="server" CssClass="axControl" Width="80" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
            <td><asp:DropDownList ID="ddlModalidad2" runat="server" CssClass="axControl" Enabled="false" BackColor="#eeeeee" Width="150" /></td>
            <td style="display: <%= esGrado ? "table-cell" : "none" %>"><asp:TextBox ID="txtDedicacionP2" Text="0" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
        </tr>
        <tr>
            <td style="text-align: right">Gestión</td>
            <td><asp:TextBox ID="txtDedicacion3" Text="0" runat="server" CssClass="axControl" Width="80" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
            <td><asp:DropDownList ID="ddlModalidad3" runat="server" CssClass="axControl" Enabled="false" BackColor="#eeeeee" Width="150" /></td>
            <td style="display: <%= esGrado ? "table-cell" : "none" %>"><asp:TextBox ID="txtDedicacionP3" Text="0" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
        </tr>
        <tr>
            <td style="text-align: right">Vinculación con el medio</td>
            <td><asp:TextBox ID="txtDedicacion7" Text="0"  runat="server" CssClass="axControl" Width="80" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
            <td><asp:DropDownList ID="ddlModalidad7" runat="server" CssClass="axControl" Enabled="false" BackColor="#eeeeee" Width="150" /></td>
            <td style="display: <%= esGrado ? "table-cell" : "none" %>"><asp:TextBox ID="txtDedicacionP7" Text="0" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
        </tr>
        <tr>
            <td style="text-align: right">Dirección de tesis</td>
            <td><asp:TextBox ID="txtDedicacion4" Text="0"  runat="server" CssClass="axControl" Width="80" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
            <td><asp:DropDownList ID="ddlModalidad4" runat="server" CssClass="axControl" Enabled="false" BackColor="#eeeeee" Width="150" /></td>
            <td style="display: <%= esGrado ? "table-cell" : "none" %>"><asp:TextBox ID="txtDedicacionP4" Text="0" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
        </tr>
        <tr>
            <td style="text-align: right">Tutorías</td>
            <td><asp:TextBox ID="txtDedicacion5" Text="0" runat="server" CssClass="axControl" Width="80" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
            <td><asp:DropDownList ID="ddlModalidad5" runat="server" CssClass="axControl" Enabled="false" BackColor="#eeeeee" Width="150" /></td>
            <td style="display: <%= esGrado ? "table-cell" : "none" %>"><asp:TextBox ID="txtDedicacionP5" Text="0" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
        </tr>
        <tr>
            <td style="text-align: right">Otras</td>
            <td><asp:TextBox ID="txtDedicacion6" Text="0" runat="server" CssClass="axControl" Width="80" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
            <td><asp:DropDownList ID="ddlModalidad6" runat="server" CssClass="axControl" Enabled="false" BackColor="#eeeeee" Width="150" /></td>
            <td style="display: <%= esGrado ? "table-cell" : "none" %>"><asp:TextBox ID="txtDedicacionP6" Text="0" runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
        </tr>
        <tr>
            <td style="text-align: right"><b>Total</b></td>
            <td><asp:TextBox ID="txtDedicacionTotal" Text="0" runat="server" CssClass="axControl" Width="80" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
            <td></td>
            <td style="display: <%= esGrado ? "table-cell" : "none" %>"><asp:TextBox ID="txtDedicacionPTotal" Text="0"  runat="server" CssClass="axControl" Width="100" ReadOnly="true" BackColor="#eeeeee" style="text-align: center" /></td>
        </tr>
    </table>
    </div>
    <br />
    <asp:Panel ID="pnlCargoPosgrado2" runat="server">
        Descripción de las actividades señaladas en el cuadro de arriba:<br />
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
                    
                    
    <div style="text-align: center">
    <br />
    <hr />
    <br />
    <br />
    <b>¿Es correcta la información?</b> Si es así, presione Aprobar. Si encuentra errores ú omisiones, presione Rechazar y detalle los motivos en el cuadro que aparecerá luego.
    <br />
    <br />
    <br />
    <asp:Button ID="btnAceptarCargo" runat="server" Text="Aprobar" CssClass="boton boton-verde" Width="110" OnClick="btnAceptarCargo_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnCancelarCargo" runat="server" Text="Rechazar" CssClass="boton boton-rojo" Width="110" OnClick="btnCancelarCargo_Click" />
    </div>
    <br />
    <br />

</asp:Panel>    
 

<asp:Panel ID="pnlEscribir" runat="server" Visible="false">
    <b>Ingrese el motivo por el cual ha rechazado la vinculación</b> (ej: Tipo de cargo incorrecto, falta vincular a una materia, etc.) y haga clic en Aceptar para guardar los cambios.
    <br />
    <br />
    <asp:TextBox ID="txtEscribir" runat="server" TextMode="MultiLine" CssClass="axControl" style="width: 100%"></asp:TextBox>
    <div style="text-align: center">
    <br />
    <hr />
    <br />
    <br />
    <asp:Button ID="btnAceptarEscribir" runat="server" Text="Aceptar" CssClass="boton boton-verde" Width="110" OnClick="btnAceptarEscribir_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnCancelarEscribir" runat="server" Text="Cancelar" CssClass="boton boton-rojo" Width="110" OnClick="btnCancelarEscribir_Click" />
    </div>
    <br />
    <br />
</asp:Panel>


<asp:Panel ID="pnlVinculacionOtro" runat="server">

    <div class="div-no-carga" style="text-align: left">
    Revise la información de la vinculación que completó la institución. Si todos los datos son <b>correctos</b>, apruébelo haciendo clic en el botón "Aprobar".
    <br />
    Si encuentra información <b>incorrecta</b>, haga clic en "Rechazar".
    </div>
    <br />

    Institución que realizó la vinculación:<br />
    <asp:TextBox ID="txtOtroInstitucion" runat="server" CssClass="axControl" BackColor="#eeeeee" ReadOnly="true" style="width: 100%; max-width: 500px"></asp:TextBox>
    <br />
    <br />
    Tipo de vinculación:<br />
    <asp:TextBox ID="txtOtroTipo" runat="server" CssClass="axControl" BackColor="#eeeeee" ReadOnly="true" style="width: 100%; max-width: 500px"></asp:TextBox>
    <br />
    <br />
    Vinculado a:<br />
    <asp:TextBox ID="txtOtroVinculado" runat="server" CssClass="axControl" BackColor="#eeeeee" TextMode="MultiLine" ReadOnly="true" style="width: 100%; max-width: 500px"></asp:TextBox>
    <br />
    <br />

    <div style="text-align: center">
    <br />
    <hr />
    <br />
    <br />
    <b>¿Es correcta la información?</b> Si es así, presione Aprobar. Si encuentra errores ú omisiones, presione Rechazar.
    <br />
    <br />
    <br />
    <asp:Button ID="btnOtroAprobar" runat="server" Text="Aprobar" CssClass="boton boton-verde" Width="110" OnClick="btnOtroAprobar_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnOtroRechazar" runat="server" Text="Rechazar" CssClass="boton boton-rojo" Width="110" OnClick="btnOtroRechazar_Click" />
    </div>
    <br />
    <br />

</asp:Panel>


    
</asp:Content>
