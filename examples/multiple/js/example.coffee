###
  mdhtmlform - Simple Example
  This file just handles form submissions for this example.
###

$ ->
  # Add a click event for the submit button
  $("button.submit").on "click", (e) ->
    e.preventDefault()

    # Get the html from the hidden form input
    html = $("textarea.mdhtmlform-html").val()

    # Alert it to the user
    alert("Easily keep the raw html in a hidden form input and get it on submission: " + html)

