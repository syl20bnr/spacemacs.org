function startFakeXpra(_) {

  $('#launchXpra').html("&nbsp;<span class=\"fa fa-wheelchair\"></span>Compiling Emacs to JS&nbsp;")
    .switchClass("btn-warning", "btn-danger", 1000, "easeInOutQuad")
    .addClass("btn-blinky")
    .css("cursor", "default");

  setTimeout(function() {
    $('#xpra-wrapper').html("<div id=\"screen\" style=\"width: 100%; height:100%; position: absolute;\">    <div id=\"1\" class=\"window window-NORMAL ui-draggable ui-draggable-handle ui-resizable windowinfocus\" style=\"width: 818px; height: 865px; left: 5px; top: 0px; cursor: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAQCAYAAADESFVDAAAAT0lEQVR4nOVSOQ4AIAijhP9/uS6WYOPgLhP0ICQFJBmjAMCx2kQDJGlzHC4nG58bJJQA25XzFr9NfcZDfSLyvI4kXmJJkRKMSBord91eZQFDwTYa38So+QAAAABJRU5ErkJggg==&quot;), default;\"><div id=\"spinner1\" class=\"spinneroverlay\" style=\"display: none;\"><div class=\"spinnermiddle\"><div class=\"spinner\"></div></div></div><div id=\"head1\" class=\"windowhead\"> <span class=\"windowicon\"><img src=\"data:image/png;base64,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\" id=\"windowicon1\"></span> <span class=\"windowtitle\" id=\"title1\">emacs@dbf599fc8d96</span> <span class=\"windowbuttons\"> <span id=\"maximize1\"><img src=\"../icons/maximize.png\"></span> <span id=\"close1\"><img src=\"../icons/close.png\"></span> </span></div><div width=\"818\" height=\"835\" style=\"overflow:hidden;\"><img src=\"/img/fakemax.png\"></img></div><div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90;\"></div><div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90;\"></div><div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90;\"></div></div></div>");
    $('#xpra-wrapper').show();
    $('#launchXpra').html("&nbsp;<span class=\"fa fa-ambulance\"></span>&nbsp;Compilation error!&nbsp;")
      .removeClass("btn-blinky")
      .css("cursor", "default");

    $("#close1").on('click', function(_) {
      $('#xpra-wrapper').hide();
      $('#launchXpra').html("&nbsp;<span class=\"fa fa-arrow-circle-right\"></span>Install&nbsp;")
        .switchClass("btn-danger", "btn btn-secondary-outline m-b-md", 1000, "easeInOutQuad")
        .css("cursor", "pointer")
        .on('click', function() {
          $("#code").fadeToggle("slow");
          $("#copy-btn").fadeToggle("slow");
        });
      return false;
    });

    $(".ui-draggable").draggable();

  }, 5000);

  return false;
}
