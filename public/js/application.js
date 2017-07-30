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
      $(response).appendTo($(".answer-block"))
      $(".hidden_form2").hide()
    })
  });

  $('.answer-block').on("click", (".comment-tab"), function(event)  {
    event.preventDefault();
    var hider = $(this).parent().parent().nextAll(".hidden_form2").first()
    $(hider).show()
  });

  $('.answer-block').on("click", (".commentsend"), function(event) {
    event.preventDefault();
    var $this = $(this);
    var $commentTextArea = $this.parent().children(".thecomment")
    var comment = $commentTextArea.val();
    var url = $this.parent().parent().prev().prev().attr("ans-id");

    $.ajax({
      method: "POST",
      url: "/answers/" + url + "/comments",
      data: { content: comment }
    }).done(function(response){
      $(".hidden_form2").hide()
      $this.parent().parent().prev().append(response);
      $commentTextArea.val("");
    })
  });


});
