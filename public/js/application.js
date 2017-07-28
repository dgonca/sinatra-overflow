$(document).ready(function() {
    $(".logout").on("click", function(event){
    event.preventDefault();

    $.ajax({
      method: "DELETE",
      url: "/sessions"
    })
    .done(function(){
      location.reload(true);
    })
  })
  $(".hidden_form2").hide()
  var button = $("#sendbutton")
  var content = $("#submitanswer")
  var link  = $("#dropbox")
  content.hide();

  link.on("click", function(event){
    event.preventDefault();
    content.show();
  })
  button.on("click", function(event) {
    event.preventDefault();
    var $thisId = $(this).closest(".question-lg").attr("cool");

    $.ajax( {
      method: "POST",
      url: "/questions/" + $thisId + "/answers",
      data: { content: $("#theanswer").val()}
    }).done(function(response) {
      content.hide();

      $(response).appendTo($(".question-lg"))
    })
  });

  $('.comment-tab').on("click", function(event) {
    event.preventDefault();
    $cool = $(".hidden_form2")
    $(this).parent().parent().next().show()
  });

  $('.commentsend').on("click", function(event) {
    event.preventDefault();
    var comment = $(this).parent().children().first().val()
    $.ajax({
      method: "POST",
      url: "/answers/" + "1" + "/comments",
      data: { content: comment }
    }).done(function(response){
      $(".hidden_form2").hide()
    })
  })
});
