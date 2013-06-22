markdown-html-form
================

<table>
  <tr>
    <td>Author:</td>
    <td>Justin McCandless (www.justinmccandless.com)</td>
  </tr>
  <tr>
    <td>Simple Demo:</td>
    <td>http://justinmccandless.com/demos/markdown-html-form/examples/simple/index.html</td>
  <tr>
    <td>Demo with Hallo:</td>
    <td>http://justinmccandless.com/demos/markdown-html-form/examples/hallo/index.html</td>
  </tr>
  <tr>
    <td>Minimum Dependecies:</td>
    <td><a href="http://www.jquery.com">jQuery</a></td>
  </tr>
  <tr>
    <td></td>
    <td><a href="https://github.com/coreyti/showdown">Showdown</a></td>
  </tr>
  <tr>
    <td>Two-way Dependecies:</td>
    <td><a href="https://github.com/domchristie/to-markdown">to-markdown</a><td>
  </tr>
</table>

The purpose of this project is to create the most simple and efficient way to write blog posts and other content on the web.  This is accomplished through an easy to setup markdown to html form element and preview.

## Usage

### HTML Setup

In order to use this project, you must have at least one textarea tag with the `.mdhtmlform-md` class on it.  All markdown input into this field will be converted to html and kept in sync with with any divs or textareas with the `.mdhtmlform-html` on them.  So a typical setup might look like this:

```html
<!-- Edit markdown here! -->
<textarea class="mdhtmlform-md">## Write markdown in the textarea!</textarea>
<br /><br />

<!-- Display converted html here! -->
<div class="mdhtmlform-html"></div>
<br /><br />

<!-- And insert converted html for submission here. -->
<textarea class="mdhtmlform-html" style="display: none;"></textarea>
```

### Javascript Setup

Simply include the `mdhtmlform.js` file found in the `src/` folder after jQuery and Showdown, and you're good to go.

### Two-way Conversion

I've shown how to sync the Markdown to an HTML preview div or textarea, but if you also want the HTML textarea to sync back to Markdown then that's easy too.  Just make sure you also include [to-markdown](https://github.com/domchristie/to-markdown) before mdhtmlform and the HTML will sync back automatically.  Don't forget your HTML textarea still needs the `mdhtmlform-html` class.  Check out `examples/two-way` for an example.

### Multiple Instances

If you need multiple Markdown textareas syncing their HTML to separate elements on the same page, this is also easily accomplished.  Just add a unique `data-mdhtmlform-group` data attribute to the elements of each instance you need.  Here's an example:

```html
<!-- The first Markdown input -->
<textarea class="mdhtmlform-md" data-mdhtmlform-group="0">## Write markdown in the textarea!</textarea>
<br /><br />

<!-- HTML preview of whatever is in the first Markdown input -->
<div class="mdhtmlform-html" data-mdhtml-group="0"></div>
<br /><br />

<!-- The second Markdown input -->
<textarea class="mdhtmlform-md" data-mdhtmlform-group="1">## Write completely different markdown in this textarea!</textarea>
<br /><br />

<!-- HTML preview of whatever is in the second Markdown input -->
<div class="mdhtmlform-html" data-mdhtml-group="1"></div>
```

Check out the `examples/multiple/` folder for a full working example.

### Initialization

The project will initialize itself and start working automatically when jQuery is ready, but if you want to initialize it yourself at a differnt time, simply call its constructor and pass in the Markdown textarea you're using:

```coffeescript
new MdHtmlForm($("textarea.mdhtmlform-md"))
```

## Examples

Check out the examples in the `examples/` folder to see some working demos.  All make use of [HTML5 Boilerplate](http://www.html5boilerplate.com) for their starting points.

### Simple Example

Live at: http://justinmccandless.com/demos/markdown-html-form/examples/simple/index.html

The simple example is probably the most basic use case of the project.  Markdown entered into a form shows a preview in realtime, and on submission of the form submits the converted html via a hidden input.

### Two-way Example

Live at: http://justinmccandless.com/demos/markdown-html-form/examples/two-way/index.html

This examples shows how to sync in both directions, with a raw HTML textarea syncing with a Markdown textarea and a preview div.

### Multiple Example

Live at: http://justinmccandless.com/demos/markdown-html-form/examples/multipe/index.html

This examples shows how to get two independent instances of the project working on the same page.  Convert two differnt Markdown textareas to two differnt HTML previews.

### Hallo Example

Live at: http://justinmccandless.com/demos/markdown-html-form/examples/hallo/index.html

This example makes use of [Hallo](https://github.com/bergie/hallo) to make the live preview of the markdown editable.  This basically gives you a markdown editor and a WYSIWYG editor kept in sync.

## License

This project is free software licensed under the MIT license.  See LICENSE.md.

