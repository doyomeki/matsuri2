jQuery ->
  $(".to_button").button().click ->
    upcoming_id = this.id
    $.ajax({
      url: "events/set_upcoming",
      type: "POST",
      beforeSend: (xhr) -> xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')),
      data: {id: this.id},
      dataType: "html"
      success: (response) ->
        $("label").text("×")
        $("label[for=" + upcoming_id + "]").text("○")
      error: (response) -> alert("エラーが発生しました")
    })
 
