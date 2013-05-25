<%inherit file="base.mako"/>

<%def name="title()">Home</%def>

      <!-- Main Page Content -->

      <h2>Deform Retail Form Demos</h2>

      <p>Hi there. This is a very simple site designed to show off the new
      retail form rendering capabilities of deform by Chris McDonough. It's a
      feature that lets you expose individual form fields to your template for
      fine-grained control over how they render, without sacrificing the power
      of colander and deform for schemas and validation.</p>

      <p>You can read the official docs
      <a href="http://deform.readthedocs.org/en/latest/retail.html">here</a>.
      </p>

      <h3>Why should I care?</h3>

      <p>In my opinion, deform's two greatest strengths (prior to retail form
      rendering) were:</p>

      <ol>
        <li>integration with colander for powerful schemas</li>
        <li>nice pre-generated forms with great validation/error handling</li>
      </ol>

      <p>The usual catch is that form libraries with pre-generated forms can
      make it hard to customize the form styling/rendering, and deform was no
      exception. Each type of form field (a deform widget) is rendered with its
      own template, and these snippets are then rendered in a larger
      template. There are many use cases where this is exactly what you want,
      but when it isn't, it means overriding a lot of defaults and potentially
      losing some of deform's power.</p>

      <p>Retail form rendering (named for its main use case: customer facing
      websites such as retail sites) allows you to write exactly the same
      server side code as before, but instead of rendering the form in its
      entirety, you can pass the form object to your template. You can iterate
      over the form object to access each of the fields, or access them by name
      (form['myfield']), giving you maximum flexibility over their display but
      without sacrificing any of the library's original features.</p>

      <h3>This website</h3>

      <p>This site was made to show off examples of this new feature. It's
      written in pyramid (although you can use deform with any python library),
      the templates are in mako (but you can of course use your favorite
      templating library too), and the styling is courtesy of Zurb Foundation. I
      know, I know, you probably think I should be using bootstrap. But I like
      Foundation, and since there is already a deform_bootstrap library, I
      wanted to show how you could use retail form rendering with a different
      library.</p>

      <p>-<a href="http://chromaticleaves.com">Eric Rasmussen</a></p>
