###
  mdhtmlform - Simple Example
  This file just handles form submissions for this example.
###

$ ->
  # Add a click event for the submit button
  $("button.submit").on "click", (e) ->
    e.preventDefault()

    # Get the html from the hidden form input and alert it, for each input
    count = 1
    $("textarea.mdhtmlform-html").each () ->
      html = $(this).val()

      # Alert it to the user
      alert("You can submit multiple textareas, here is # " + count + ": " + html)

      count++

