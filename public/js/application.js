$(document).ready(function() {
  var button = $("#sendbutton")
  var content = $("#submitanswer")
  var link  = $("#dropbox")
  button.on("click", function(event) {
    event.preventDefault();
    $.ajax( {
      method: "POST",
      url: "/questions/1/answers", //get correct id
      data: { content: $("#theanswer").val()} //capture correct input
    }).done(function(response) {
      content.hide();

      $(response).appendTo($("#dropbox"))
    })
  });

});
