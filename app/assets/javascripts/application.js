// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require dialog-polyfill
//= require_tree .

function sendMessage(){
    if($("#message_content").val().trim().length !== 0){
        App.room.send_message({message: {content: $("#message_content").val(), message_type: $("#menu-dialect").attr("value")}});
        $("#message_content").val('');
    }

}

$(document).ready(function () {


    $("#send_button").click(function () {
        sendMessage();
    });

    $("#message_content").keyup(function(e){
        if(e.keyCode == 13){
            sendMessage();
        }
    });
    
    $(".mdl-menu__item").click(function (e) {
        var dialectValue = $(this).attr("value");
        var dialectText = $(this).text()
        $("#menu-dialect").attr("value",dialectValue);
        $("#menu-dialect").text("Current dialect: " +dialectText);
        $("#menu-dialect").append( " <i class='material-icons'>autorenew</i>");
    });

    var dialog = $("dialog")[0];
    if (! dialog.showModal) {
        dialogPolyfill.registerDialog(dialog);
    }

    $(".dialect-button").click(function (e) {
        var dialectValue = $(this).attr("value");
        var dialectText = $(this).text()
        $("#menu-dialect").attr("value",dialectValue);
        $("#menu-dialect").text("Current dialect: " +dialectText );
        $("#menu-dialect").append( " <i class='material-icons'>autorenew</i>");
        $("#conversation").scrollTop($(document).height());
        dialog.close();
    });

    dialog.showModal();

});