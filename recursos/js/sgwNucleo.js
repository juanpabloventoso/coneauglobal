var sgwCambiosPendientes = false;          // Cambios pendientes de guardar
var sgwBotonGuardarGeneral = null;         // Botón de guardado general
var sgwEstadoAJAXEtiqueta = "";            // Etiqueta del estado AJAX
var sgwEstadoAJAXPanel = "";               // Panel del estado AJAX
var sgwNavCabeceraActual = "";             // Cabecera actual del navegador
var sgwAppAncho = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
var sgwAppAlto = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
var sgwAppGrande = sgwAppAncho > 1024;
var sgwAppMedia = sgwAppAncho > 768;
var sgwAppChica = !sgwAppGrande && !sgwAppMedia;
var sgwGrillaCookieNombre = "grid";
var sgwSistemaID = 0;
var sgwSistemaNombre = "";
var sgwSistemaSubnombre = "";
var sgwSistemaDesc = "";
var sgwSistemaCodename = "";
var sgwURLActual = "";
var sgwSoloLectura = false;

function sgwParsearInt(str) {
    var retValue = 0;
    if (str !== null) {
        if (str.length > 0) {
            if (!isNaN(str)) {
                retValue = parseInt(str);
            }
        }
    }
    return retValue;
}

function sgwHidePopUp(popup) {
    popup.Hide();
}

function sgwShowPopUp(popup) {
    popup.Show();
}

function sgwConfirmarEliminar() {
    if (sgwSoloLectura) return false;
    return confirm('¿Está seguro que desea eliminar este ítem?');
}

// Abrir una url en un popup con iframe
function sgwAbrirFrame(url) {
    if (document.getElementById('divIFrame') != null) {
        document.getElementById('elemIF').src = url;
        document.getElementById('divIFrame').style.display = 'block';
    } else {
        var elemIF = document.createElement('iframe');
        elemIF.id = 'elemIF';
        elemIF.src = url;
        elemIF.frameBorder = '0';
        elemIF.style.width = '100%';
        elemIF.style.height = '100%';
        var elemDIV2 = document.createElement('div');
        elemDIV2.className = 'div-mostrar-frame';
        elemDIV2.appendChild(elemIF);
        var elemC = document.createElement('img');
        elemC.className = 'div-mostrar-frame-cerrar';
        elemC.src = '/coneauglobal/imagenes/ajax/close.png';
        elemC.title = 'Cerrar';
        elemC.onclick = function () {
            document.getElementById('divIFrame').style.display = 'none';
            document.getElementById('elemIF').src = '';
        };
        var elemDIV = document.createElement('div');
        elemDIV.id = 'divIFrame';
        elemDIV.className = 'divActualizacionAJAXFS';
        elemDIV.style.textAlign = 'center';
        elemDIV.appendChild(elemDIV2);
        elemDIV.appendChild(elemC);
        document.body.appendChild(elemDIV);
    }
}

function sgwObtenerParametroURL(nombre) {
    if (nombre = (new RegExp('[?&]' + encodeURIComponent(nombre) + '=([^&]*)')).exec(location.search))
        return decodeURIComponent(nombre[1]);
}


// Enviar el postback de guardado
function sgwGuardarGeneral() {
    if (sgwBotonGuardarGeneral != null)
        sgwBotonGuardarGeneral.click();
    sgwCambiosPendientes = false;
}

// Manejar errores AJAX
function sgwNucleo_onEndRequest(sender, args) {
    if (args.get_error()) {
        var msg = args.get_error().message;
        $("#pnlEstadoAJAXContenedor").css("display", "block");
        $("#" + sgwEstadoAJAXEtiqueta).html("Hemos encontrado un problema :(<br />" + msg);
        $("#" + sgwEstadoAJAXEtiqueta).css("color", "white");
        $("#lblEstadoAJAXError").show();
        $("#" + sgwEstadoAJAXPanel).css("backgroundColor", "#FF6633");
        setTimeout(function () { $("#pnlEstadoAJAXContenedor").css("display", "none") }, 10000);
        args.set_errorHandled(true);
    }
}

function sgwNuevaVentana(url) {
    if (!window.open(url, "_blank"))
        sgwMostrarEstado("No se puede continuar porque las ventanas emergentes no están habilitadas. " +
        "<a href='/coneauglobal/ayuda/tutoriales/ventanas-emergentes.pdf' target='_blank'>Corregir</a>");
}

// Mostrar estado
function sgwMostrarEstado(estado) {
    $("#pnlEstadoAJAXContenedor").css("display", "inline");
    $("#lblEstadoAJAXError").hide();
    $("#" + sgwEstadoAJAXEtiqueta).html(estado);
    setTimeout(function () { $("#pnlEstadoAJAXContenedor").css("display", "none") }, 5000);
}

// Cerrar una ventana emergente de DevExpress
function sgwPopupCerrar(popup) {
    popup.Hide();
}

function sgwPopupResponsive(popup) {
    if (!popup.IsVisible()) return;
    var windowX = window.innerWidth || document.documentElement.clientWidth;
    var windowY = window.innerHeight || document.documentElement.clientHeight;
    var width = windowX - 10;
    var height = windowY - 10;
    if (popup.GetWidth() > width) popup.SetWidth(width);
    if (popup.GetHeight() > height) popup.SetHeight(height);
    popup.UpdateWindowPosition();
}

// Ajustar las grillas full (app consultas)
function sgwInicializarGrillaFull(s, e) {
    sgwAjustarGrillaAlto();
}

function sgwAjustarGrillaAlto() {
    if ($("#divGrillaFull")[0] == null) return;
    var top = $("#divGrillaFull").offset().top;
    $("#divGrillaFull").height(sgwAppAlto - top);
    if (typeof(grid) !== "undefined") grid.SetHeight(sgwAppAlto - top);
}

function sgwGuardarConfiguracionGrilla() {
    grid.PerformCallback();
}

function sgwRestablecerConfiguracionGrilla() {
    ASPxClientUtils.DeleteCookie(sgwGrillaCookieNombre);
    location.reload();
}

function sgwMostrarAgregarFavorito() {
    if (sgwSistemaNombre == "")
        $("#txtFavoritoTitulo").val($(document).find("title").text().trim());
    else {
        if (sgwSistemaSubnombre == "")
            $("#txtFavoritoTitulo").val(sgwSistemaNombre);
        else
            $("#txtFavoritoTitulo").val(sgwSistemaNombre + " - " + sgwSistemaSubnombre);
    }
    $("#txtFavoritoDesc").val(sgwSistemaDesc);
    $("#txtFavoritoURL").val(sgwURLActual);
    if (sgwSistemaCodename != "")
        $("#txtFavoritoIcono").val("/coneauglobal/recursos/imagenes/aplicaciones/iconos/" + sgwSistemaCodename + "/icono-64.png");
    else
        $("#txtFavoritoIcono").val("/coneauglobal/recursos/imagenes/aplicaciones/iconos/otro/icono-64.png");
    $("#divFavoritoMas").hide();
    $("#aFavoritoMas").show();
    $("#divFavorito").fadeIn(200);
}

function sgwMostrarFavoritoMas() {
    $("#divFavoritoMas").show();
    $("#aFavoritoMas").hide();
}

function sgwAgregarFavorito() {
    $.post("/coneauglobal/mainframe/admin/servicio-favoritos.aspx", {
        agregar: "1",
        idSistemas: sgwSistemaID,
        titulo: $("#txtFavoritoTitulo").val(),
        descripcion: $("#txtFavoritoDesc").val(),
        url: $("#txtFavoritoURL").val(),
        icono: $("#txtFavoritoIcono").val()
    }, function (data) {
        sgwMostrarEstado("Se agregó al escritorio.");
        $("#divFavorito").hide();
        $(".a-favorito").addClass("a-favorito-agregado");
    });
}

function sgwEliminarFavorito(id) {
    $.post("/coneauglobal/mainframe/admin/servicio-favoritos.aspx", {
        eliminar: "1",
        id: id
    }, function (data) {
        sgwMostrarEstado("Se eliminó del escritorio.");
        $(".a-favorito").removeClass("a-favorito-agregado");
    });
}

function sgwLeerCookie(nombre) {
    return (nombre = new RegExp('(?:^|;\\s*)' +
	('' + nombre).replace(/[-[\]{}()*+?.,\\^$|#\s]/g, '\\$&') +
	'=([^;]*)').exec(document.cookie)) && nombre[1];
}

function sgwGuardarCookie(nombre, valor) {
    document.cookie = escape(nombre) + "=" + escape(valor) +
	";max-age=2147483647;expires=Fri, 31 Dec 9999 23:59:59 GMT;path=/";
}



function sgwEstadoAJAX(etiqueta, panel) {
    sgwEstadoAJAXEtiqueta = etiqueta;
    sgwEstadoAJAXPanel = panel;
}


// Código que se ejecuta al salir de la página
function sgwAlSalir() {
    if ((sgwCambiosPendientes) && (sgwBotonGuardarGeneral != null)) {
        return "Está por salir de la página sin guardar todos los cambios.";
    }
}

function sgwGuardarGeneral() {
    if ($("#img-botonera-cargando")[0] != null)
        $("#img-botonera-cargando").show();
    $(sgwBotonGuardarGeneral).val("Guardando...");
}

// Preparar los navegadores
function sgwPrepararNavegadores() {
    var encontrada = false;
    $('.nav-cabecera').each(function () {
        var cabecera = $(this);
        var ul = cabecera.children('ul').first();
        if (ul.length == 0)
            var ul = cabecera.children('div').first();
        if (window.location.href.toLowerCase().indexOf(cabecera.data("url")) < 0)
            ul.hide();
        else {
            encontrada = true;
            ul.show();
            cabecera.addClass("nav-cabecera-activa");
            sgwNavCabeceraActual = cabecera.find('span').html();
            ul.find('a').each(function () {
                var a = $(this);
                if (window.location.href.toLowerCase().indexOf(a.data("url")) >= 0) {
                    if (!$(this).parent().children('ul').length)
                        a.addClass("nav-item-activo");
                    else
                        a.addClass("nav-subitem-activo");
                    a.parent().children('ul').first().show();
                    var label = $('#lblNavSeccion');
                    if (label.length)
                        label.html(sgwNavCabeceraActual + " - " + a.html());
                }
            });
        }
        cabecera.find('a').each(function () {
            if (($(this).attr("href").indexOf("javascript") < 0) && (window.location.search.indexOf("soloLectura=1") > -1))
                $(this).attr("href", $(this).attr("href") + "?soloLectura=1");
            if (!$(this).parent().children('ul').length)
                $(this).append('<span></span>');
        });
        $(cabecera.find('span')[0]).on('click', function () {
            if (ul != null) {
                ul.data("expandido", ul.css("display") != "none" ? "1" : "0");
                ul.toggle();
            }
        });
    });
    if (!encontrada) {
        var cabecera = $('.nav-cabecera');
        cabecera.find('ul').show();
        cabecera.find('a').each(function () {
            var a = $(this);
            if (window.location.href.toLowerCase().indexOf(a.data("url")) >= 0) {
                a.addClass("nav-item-activo");
                var label = $('#lblNavSeccion');
                if (label.length)
                    label.html(sgwNavCabeceraActual + " - " + a.html());
            }
        });
    }
}

function sgwAvisoProgramado() {
    var date = new Date();
    if (((date.getDate()) != sgwNucleoCorteDia) || ((date.getMonth() + 1) != sgwNucleoCorteMes) || (date.getFullYear() != sgwNucleoCorteAnio)) return;
    if (date.getHours() >= sgwNucleoCorteHora) return;
    var dif = 'Falta menos de una hora';
    var difHoras = sgwNucleoCorteHora - date.getHours();
    if (difHoras == 1)
        dif = 'Falta menos de una hora';
    if (difHoras > 1)
        dif = 'Falta menos de ' + difHoras + ' horas';
    var div = document.createElement('div');
    div.id = 'divAviso';
    div.style.width = '800px';
    div.style.height = '36px';
    div.style.position = 'fixed';
    div.style.bottom = '25px';
    div.style.zIndex = '10000000';
    div.style.left = '50%';
    div.style.marginLeft = '-400px';
    div.style.backgroundColor = 'rgba(255,255,210,0.5)';
    div.style.color = '#333';
    div.style.fontFamily = 'Roboto';
    div.style.padding = '5px';
    div.style.textAlign = 'center';
    div.style.borderRadius = '4px';
    div.style.boxShadow = 'rgba(0, 0, 0, 0.298039) 0px 3px 10px';
    div.innerHTML = 'CONEAU Global será interrumpido por 30 a 40 minutos a las ' + sgwNucleoCorteHora + ':00 horas debido a actualizaciones programadas.<br /> ' + dif + ' para el corte. ¡Sepa disculpar las molestias!';
    div.onclick = function () { this.style.display = 'none'; }
    document.body.appendChild(div);
}

function sgwActualizarEncabezado() {
    $(".div-contenido").css("top", $(".div-cabecera").outerHeight() + 1);
    if (($(".div-lateral")[0] == null) || ($(".div-lateral").children().length == 0)) return;
    $(".div-lateral").css("top", $(".div-cabecera").outerHeight() + 1);
    if (sgwAppChica) {
        $(".div-encabezado").css("background-image", "none");
        $(".div-encabezado").css("text-indent", "0");
        $(".div-lateral").css("display", "none");
        $(".div-full-contenido").css("margin-left", "");
    } else {
        $(".div-encabezado").css("background-image", "");
        $(".div-encabezado").css("background-position-x", "64px");
        $(".div-encabezado").css("text-indent", "");
        $(".div-lateral").css("display", "block");
        $(".div-full-contenido").css("margin-left", "300px");
    }
    if ($(".a-menu-lateral")[0] == null) {
        var aMenu = document.createElement("a");
        aMenu.className = "a-menu-lateral";
        aMenu.onclick = function () { sgwAlternarEncabezado(); };
        $(".div-encabezado")[0].insertBefore(aMenu, $(".div-encabezado")[0].firstChild);
    }
}

function sgwAlternarEncabezado() {
    if ($(".div-lateral").is(":visible")) {
        $(".div-lateral").hide("slide", { direction: "left" }, 200);
        if (!sgwAppChica) {
            $(".div-full-contenido").css("margin-left", "");
            if (($("#divGrillaFull")[0] != null) && (typeof (grid) !== "undefined")) {
                grid.SetWidth($("#divGrillaFull").outerWidth());
                grid.AdjustControl();
            }
        }
             
    }
    else {
        $(".div-lateral").show("slide", { direction: "left" }, 200);
        if (!sgwAppChica) {
            $(".div-full-contenido").css("margin-left", "300px");
            if (($("#divGrillaFull")[0] != null) && (typeof (grid) !== "undefined")) {
                grid.SetWidth($("#divGrillaFull").outerWidth());
                grid.AdjustControl();
            }
        }
    }
}

function sgwVerificarSoloLectura() {
    if (!sgwSoloLectura) return;
    $(".fullform-botonera-inferior").css("display", "none");
    $('.dxgvCommandColumn_Glass').find('img[src$="editar-gris.png"]').each(function () { this.src = "/coneauglobal/recursos/imagenes/iconos/detalles-gris.png"; });
    $('.dxgvCommandColumn_Glass').find('img[src$="eliminar-gris.png"]').each(function () { $(this).hide(); });
}


// Inicialización del núcleo de SGW
function sgwNucleoIniciar() {

    // Aplicar cambios generales
    if ((sgwObtenerParametroURL("soloLectura") == "1") || (sgwObtenerParametroURL("SoloLectura") == "1"))
        sgwSoloLectura = true;

    sgwVerificarSoloLectura();
    sgwActualizarEncabezado();
    sgwPrepararNavegadores();

    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(sgwNucleo_onEndRequest);

    // Abrir en frame todos los enlaces con rel=frame
    $('body').find('a[rel=frame]').click(function () {
        event.preventDefault();
        sgwAbrirFrame(this.href);
    });

    // Buscar y guardar el botón de guardado general si existe
    $('*[id*=btnGuardarDatosGenerales]').each(function () {
        sgwBotonGuardarGeneral = this;
        $(sgwBotonGuardarGeneral).click(function () {
            sgwCambiosPendientes = false;
            sgwGuardarGeneral();
        });
    });

    // Enlazar los cuadros de texto al detector de cambios
    $('body').find('textarea').on('change keyup paste', function () {
        sgwCambiosPendientes = true;
    });

    // Adaptar el alto de los cuadros de texto multilínea
    window.setTimeout(function () {
        $('body').find('textarea[readonly="readonly"]').each(function () {
            if ($(this).val().length < 10)
                $(this).height(28);
            else
                $(this).height(Math.min(600, Math.max($(this).height(), $(this)[0].scrollHeight)));
        });
    }, 1);


    // Aplicar el tamaño máximo a los TextArea que lo tengan dispuesto
    $("textarea[maxsize]").each(function () {
        $(this).attr('maxlength', $(this).attr('maxsize'));
        $(this).removeAttr('maxsize');
        var disp = ($(this).attr('maxlength') - $(this).val().length);
        var dispdesc = ' restantes';
        if (disp == 1) dispdesc = ' restante';
        $(this).attr('title', $(this).attr('maxlength') + ' caracteres (' + disp + dispdesc + ')');
    });

    // Enlazar los cuadros de texto al detector de cambios
    $('body').find('textarea').on('change keyup paste', function () {
        sgwCambiosPendientes = true;
        if ($(this).attr('maxlength') == null) return;
        var disp = ($(this).attr('maxlength') - $(this).val().length);
        var dispdesc = ' restantes';
        if (disp == 1) dispdesc = ' restante';
        $(this).attr('title', $(this).attr('maxlength') + ' caracteres (' + disp + dispdesc + ')');
    });

    // Enlazar el evento antes de salir de la página
    $(window).bind('beforeunload', function () {
        return sgwAlSalir();
    });

    $(window).resize(function () {
        sgwAppAncho = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
        sgwAppAlto = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
        sgwAppGrande = sgwAppAncho > 1024;
        sgwAppMedia = sgwAppAncho > 768;
        sgwAppChica = !sgwAppGrande && !sgwAppMedia;
        sgwActualizarEncabezado();
        if (typeof sgwNucleo_alCambiarTamanio == 'function') { sgwNucleo_alCambiarTamanio(); }
        if (typeof sgwNucleo_alCambiarTamanio2 == 'function') { sgwNucleo_alCambiarTamanio2(); }
        if (typeof sgwNucleo_alCambiarTamanio3 == 'function') { sgwNucleo_alCambiarTamanio3(); }
        if (typeof sgwNucleo_alCambiarTamanio4 == 'function') { sgwNucleo_alCambiarTamanio4(); }
    });

    $(document).mouseup(function (e) {
        var container = $("#divFavorito");
        if (!container.is(e.target) && container.has(e.target).length === 0) container.hide();
    });

    // Llamar al evento de inicialización Javascript de la página si existe
    if (typeof sgwNucleo_alIniciar == 'function') { sgwNucleo_alIniciar(); }
    if (typeof sgwNucleo_alIniciar2 == 'function') { sgwNucleo_alIniciar2(); }
    if (typeof sgwNucleo_alIniciar3 == 'function') { sgwNucleo_alIniciar3(); }
    if (typeof sgwNucleo_alIniciar4 == 'function') { sgwNucleo_alIniciar4(); }

}