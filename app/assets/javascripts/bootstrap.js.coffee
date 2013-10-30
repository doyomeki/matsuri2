jQuery ->
  $(".to_button").button().click ->
    $("label").text("×")
    $("label[for=" + this.id + "]").text("○")
