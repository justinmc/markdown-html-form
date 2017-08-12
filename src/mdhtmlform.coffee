###
Markdown HTML Form

Copyright (c) 2013 Justin McCandless (justinmccandless.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
###

window.MdHtmlForm = class MdHtmlForm

  # The form object passed in by the constructor
  form: null

  # Variables to hold the current in-sync md and html as strings
  html: ""
  md: ""

  # The anchor md object for this mdhtmlform group
  objMd: null

  # The id of this group
  group: ""

  # Configuration
  dataGroup: "mdhtmlform-group"
  selHtml: ".mdhtmlform-html"
  selMd: ".mdhtmlform-md"

  constructor: (obj) ->
    # Save a reference to the md object
    @objMd = obj

    # Get the group id, if it was given, and update the selectors with it
    @group = $(@objMd).data(@dataGroup)
    if @group?
      @selHtml = @selHtml + "[data-" + @dataGroup + "=" + @group + "]"
      @selMd = @selMd + "[data-" + @dataGroup + "=" + @group + "]"

    # Get the initial md
    @md = $(@objMd).val()

    # On Md keyup, rerender the html
    $inp = $(@objMd)
    if "oninput" of $inp[0]  # do we support the HTML 5 input event?
      $inp[0].addEventListener "input", (=>
        @updateMdToHtml()
      ), false
    else
      # IE 8 doesn't support the oninput event so we fall back to keyup and paste
      # using a jquery event handler here in order to avoid having to use attachEvent in IE
      $inp.on "keyup paste", =>
        # if a paste event is what we got we'll let the event loop go so that our paste has a chance to happen
          setTimeout =>
            @updateMdToHtml()
          , 0
          return

    # On Html textarea keyup, rerender the markdown
    $("textarea" + @selHtml).bind "keyup", (e) =>
      @updateHtmlToMd(false)

    # On Hallojs keyup, rerender the markdown
    $(@selHtml).bind "hallomodified", (event, data) =>
      @updateHtmlToMd(true)

    # Render the md content as html initially
    @updateMdToHtml()

  # Get the md from the view, convert it to html, and rerender
  updateMdToHtml: () ->
    @md = $(@objMd).val()
    @convertMdToHtml()
    @render(false)

  # Get the html from the view, convert it to md, and rerender
  updateHtmlToMd: (ignoreHallo) ->
    # Get the html from a Hallo first, otherwise a regular textarea
    if $("div" + @selHtml).hallo?
      @html = $("div" + @selHtml).html()
    else
      @html = $("textarea" + @selHtml).val()
    @convertHtmlToMd()
    @render(ignoreHallo)

  # Convert the md to html
  convertMdToHtml: () ->
    if window.hasOwnProperty("Showdown")
      converter = new Showdown.converter()
      @html = converter.makeHtml(@md)
    else
      console.log "Error: mdhtmlform: Showdown not properly included"

  # Convert the html to md
  convertHtmlToMd: () ->
    if window.hasOwnProperty("toMarkdown")
      @md = toMarkdown(@html)
    else
      console.log "Error: mdhtmlform: to-markdown not properly included"

  # Render the html and md
  render: (ignoreHallo) ->
    # Render the html preview div
    if !$("div" + @selHtml).hallo? or !ignoreHallo
      $("div" + @selHtml).html(@html)

    # Render the current md in the view
    $(@objMd).val(@md)

    # Render the html into a form textarea
    $("textarea" + @selHtml).val(@html)

$ ->
  # Initialize MdHtmlForm on every Markdown input
  $(".mdhtmlform-md").each () ->
    new MdHtmlForm(this)

