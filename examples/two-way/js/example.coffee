###
  mdhtmlform - Two-way Example
  This file just handles form submissions for this example.
###

$ ->
  # Add a click event for the submit button
  $("button.submit").on "click", (e) ->
    e.preventDefault()

    # Get the html from the form input
    html = $("textarea.mdhtmlform-html").val()

    # Alert it to the user
    alert("Submit the raw html textarea: " + html)

