markdown-html-form
================

The purpose of this project is to create the most simple and efficient way to write blog posts and other content on the web.  This is accomplished through an easy to setup markdown to html form element and preview.

<table>
  <tr>
    <td>Author:</td>
    <td>Justin McCandless (www.justinmccandless.com)</td>
  </tr>
  <!-- <tr>
    <td>Demo:</td>
    <td>http://www.justinmccandless.com/demos/jQuery-Open-Carousel/index.html</td>
  </tr>
  <tr>
    <td>Latest Blog Post:</td>
    <td>http://www.justinmccandless.com/blog/Open+Source+jQuery+Carousel</td>
  </tr> -->
  <tr>
    <td>Minimum Dependecies:</td>
    <td>[jQuery](http://www.jquery.com)</td>
  </tr>
  <tr>
    <td></td>
    <td>[Showdown](https://github.com/coreyti/showdown)</td>
  </tr>
  <tr>
    <td>Two-way Dependecies (with Hallojs):</td>
    <td>[to-markdown](https://raw.github.com/domchristie/to-markdown)/td>
  </tr>
  <tr>
    <td></td>
    <td>[Hallojs](https://github.com/bergie/hallo) and all of its dependencies</td>
  </tr>
</table>

## Usage

### HTML Setup

In order to use this project, you must have at least one form with the `.mdhtmlform` class on it.  The direct children of this form will be scanned for elements to sync markdown to (`.mdhtmlform-markdown`) and elements to sync html to (`.mdhtmlform-html`).  So a typical setup might look like this:

    <form class="mdhtmlform">
        <!-- Edit markdown here! -->
        <textarea class="mdhtmlform-md">## Write markdown in the textarea!</textarea>
        <br /><br />
        <!-- Display converted html here! -->
        <div class="mdhtmlform-html"></div>
        <!-- And insert converted html for submission here. -->
        <textarea class="mdhtmlform-html" style="display: none;"></textarea>
        <br /><br />
        <button class="submit">Submit</button>
    </form>

### Javascript Setup

Simply include the `mdhtmlform.js` file found in the `src/` folder after jQuery and Showdown, and you're good to go.

### Initialization

The project will initialize itself and start working automatically, but if you want to initialize it yourself, simply call its constructor and pass in the form you're using:

    new MdHtmlForm($("form#yourForm"))

## Examples

Check out the examples in the `examples/` folder to see some working demos.  Both make use of [HTML5 Boilerplate](http://www.html5boilerplate.com) for their starting points.

### Simple Example

The simple example is probably the most basic use case of the project.  Markdown entered into a form shows a preview in realtime, and on submission of the form submits the converted html via a hidden input.

### Hallojs Example

This example makes use of [hallojs](https://github.com/bergie/hallo) to make the live preview of the markdown editable.  This basically gives you a markdown editor and a WYSIWYG editor kept in sync.

## License

This project is free software licensed under the MIT license.  See LICENSE.md.

