###
  mdhtmlform - Simple Example
  This file just handles form submissions for this example.
###

$ ->
  # Initialize hallojs
  $("div.mdhtmlform-html").hallo
    plugins: {
      'halloformat': {},
      'halloheadings': {},
      'hallolists': {},
      'halloreundo': {}
    }
    toolbar: 'halloToolbarFixed'

  # Add a click event for the submit button
  $("button.submit").on "click", (e) ->
    e.preventDefault()

    # Get the html from the hidden form input
    html = $("textarea.mdhtmlform-html").val()

    # Alert it to the user
    alert("Easily keep the raw html in a hidden form input and get it on submission: " + html)

  ###
 var markdownize = function(content) {
    var html = content.split("\n").map($.trim).filter(function(line) { 
      return line != "";
    }).join("\n");
    return toMarkdown(html);
  };

  var converter = new Showdown.converter();
  var htmlize = function(content) {
    return converter.makeHtml(content);
  };

  // Method that converts the HTML contents to Markdown
  var showSource = function(content) {
    var markdown = markdownize(content);
    if (jQuery('#source').get(0).value == markdown) {
      return;
    }
    jQuery('#source').get(0).value = markdown;
  };


  var updateHtml = function(content) {
    if (markdownize(jQuery('.editable').html()) == content) {
      return;
    }
    var html = htmlize(content);
    jQuery('.editable').html(html); 
  };

  // Update Markdown every time content is modified
  jQuery('.editable').bind('hallomodified', function(event, data) {
    showSource(data.content);
  });
  jQuery('#source').bind('keyup', function() {
    updateHtml(this.value);
  });
  showSource(jQuery('.editable').html()); 
  ###
