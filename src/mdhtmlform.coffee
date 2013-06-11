###
Markdown HTML Form

Copyright (c) 2013 Justin McCandless (justinmccandless.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
###

class MdHtmlForm

  # The form object passed in by the constructor
  form: null

  # Variables to hold the current in-sync md and html as strings
  html: ""
  md: ""

  # Selectors for the necessary elements
  selHtml: ".mdhtmlform-html"
  selMd: ".mdhtmlform-md"

  constructor: (obj) ->
    # Get the initial md
    @md = $(@selMd).val()

    # On Md keyup, rerender the html
    me = @
    $(@selMd).on "keyup", (e) ->
      me.updateMdToHtml()

    # On Html keyup (if using hallojs), rerender the markdown
    $(@selHtml).bind 'hallomodified', (event, data) ->
      me.updateHtmlToMd()

    # Render the md content as html initially
    @updateMdToHtml()

  # Get the md from the view, convert it to html, and rerender
  updateMdToHtml: () ->
    @md = $(@selMd).val()
    @convertMdToHtml()
    @renderHtml()

  # Get the html from the view, convert it to md, and rerender
  updateHtmlToMd: () ->
    @html = $(@selHtml).html()
    @convertHtmlToMd()
    @renderMd()

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

  # Render the current html in the view
  renderHtml: () ->
    $("div" + @selHtml).html(@html)
    @renderTextarea()
  
  # Render the current md in the view
  renderMd: () ->
    $(@selMd).val(@md)
    @renderTextarea()

  # Render the html into a form textarea
  renderTextarea: () ->
    $("textarea" + @selHtml).html(@html)

$ ->
  # Initialize MdHtmlForm
  $("form.mdhtmlform").each () ->
    new MdHtmlForm(this)

