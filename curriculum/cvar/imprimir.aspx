<%@ Page Language="C#" MasterPageFile="~/master/sesion-docente.master" AutoEventWireup="true" CodeFile="imprimir.aspx.cs"
    Inherits="_Default" Title="Currículum Docente - CONEAU Global" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">
<style media="screen">#imprimirAjax { display: none } #imprimirEstado { text-align: center; display: block }</style>
<style media="print">#imprimirAjax { display: block } #imprimirEstado { display: none } #divBreak { page-break-before: always }</style>
<div id="imprimirAjax"></div>
<div id="imprimirEstado">
<br />
<br />
<h2 id="hEstado1">Generando versión para imprimir</h2>
<h4 id="hEstado2">Por favor espere...</h4>
<br />
<br />
<img id="imgCargando" src="/coneauglobal/recursos/imagenes/iconos/cargando.gif" title="Cargando..." />
<br />
<button id="btnCerrar" class="boton boton-verde " onclick="window.close()" style="width: 100px; display: none">Cerrar</button>
<br />
</div>

<script type="text/javascript">

    var i = 1;      // Página inicial
    var total = 10; // Total de páginas

    function imprimir() {
        $("#hEstado1").html("Enviado a imprimir");
        $("#hEstado2").html("");
        $("#imgCargando").hide();
        $("#btnCerrar").show();
        window.print();
    }

    function cargarProximaPagina() {
        $("#hEstado2").html("Paso " + i + " de " + total + ". Por favor espere...");
        $.ajax("abm-p" + i + ".aspx").done(function (html) {
            html = html.substring(html.indexOf('<div class="div-full-contenido"'));
            html = html.substring(0, html.indexOf('<div id="divFavorito"'));
            $("#imprimirAjax").html($("#imprimirAjax").html() + html + "</div><div id='divBreak'></div>");
            if (i == total) {
                $("#hEstado1").html("Enviando a imprimir");
                $("#hEstado2").html("Por favor espere...");
                setTimeout("imprimir()", 1000);
            } else {
                i++;
                cargarProximaPagina();
            }
        });
    }

    cargarProximaPagina();

</script>

</asp:Content>