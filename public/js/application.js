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
  });

  $(".voteable-container").on("click", ".votes", function(event){
    event.preventDefault();
    var $scoreToChange = $(this).closest('.vote-buttons').find('.voteable-score');
    var voteableType = $(this).closest('.voteable-container').attr("type");
    var voteableId = $(".down-vote").closest('.voteable-container').attr("id");
    var voteUrl = "/" + voteableType + "/" + voteableId + "/votes";
    var voteValue;
    if ($(this).hasClass('up-vote')) {
      voteValue = 1;
    }else if ($(this).hasClass('down-vote')) {
      voteValue = -1;
    };
    var request = $.ajax( {
      method: "POST",
      url: voteUrl,
      data: {value: voteValue}
    });
    request.done(function(newScore) {
      $scoreToChange.text(newScore);
    })
    request.fail(function( jqXHR, textStatus ) {
      if (jqXHR.status === 401){
        $scoreToChange.closest(".shake-container").effect("shake", {distance:3});
      }

    });
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
