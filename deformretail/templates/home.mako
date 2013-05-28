<%inherit file="base.mako"/>

<%def name="title()">Home</%def>

      <!-- Main Page Content -->

      <h2>Deform Retail Form Demos</h2>

      <p>This is a very simple site designed to show off the new
      retail form rendering capabilities of deform by Chris McDonough. It's a
      feature that lets you expose individual form fields to your template for
      fine-grained control over how they render, without sacrificing the power
      of colander for schemas and deform for validation.</p>

      <p>This is only a demo site to show off the features, but you can read the
      official deform docs
      <a href="http://deform.readthedocs.org/en/latest/retail.html">here</a>.
      </p>


      <h3>Samples</h3>

      <p>All samples use mako's syntax and assume we have made a deform Form
      object available to our templates with the name "form" (it's not a special
      name).</p>

      ${form_field_example()}

      ${form_iter_example()}

      ${form_nested_example()}

      ${form_errors_example()}


      <h3>Why should I care?</h3>

      <p>Deform uses colander for powerful schemas and makes very nice
      pre-generated forms. The simplicity of it is great for many use cases, but
      as soon as you needed multiple forms with different styles on your page,
      you'd need to write separate form templates for each and override many
      defaults to render them.</p>

      <p>Retail form rendering (named for its main use case: customer facing
      websites such as retail sites) allows you to write exactly the same
      server side code as before, but instead of rendering the form in its
      entirety, you can pass the form object to your template and access the
      fields directly, giving you maximum flexibility over their display but
      without sacrificing any of the library's original features.</p>

      <h3>About this website</h3>

      <p>This site was made to show off example forms rendered using this new
      feature. This site uses pyramid with mako templates. Styling/responsive
      design made using Zurb Foundation.</p>

      <p>-<a href="http://chromaticleaves.com">Eric Rasmussen</a></p>

<%def name="template_source()">https://github.com/ericrasmussen/deform_retail_demo/blob/master/deformretail/templates/home.mako</%def>




<%doc>
  Example code blocks used on this page. The examples are mako so we declare
  them as text blocks to treat them as literals.
</%doc>

<%def name="form_field_example()" filter="n, code">

  <%text>
    ## fields are keyed by name in the form object

    <label>${form['myfield'].title}</label>

    ${form['myfield'].serialize()}

  </%text>

</%def>

<%def name="form_iter_example()" filter="n, code">

  <%text>
    ## you can iterate through the form's fields

    % for field in form:
        ${field.serialize()}
    % endfor
  </%text>

</%def>

<%def name="form_nested_example()" filter="n, code">

  <%text>
    ## you can iterate over nested mappings or access individual fields

    % for field in form['my_nested_mapping']:
        ${field.serialize()}
    % endfor

    ${form['my_nested_mapping']['my_special_field'].serialize()}
  </%text>

</%def>

<%def name="form_errors_example()" filter="n, code">

  <%text>
    ## you can get a list of error messages for a field, if present

    % if field.error:
        % for error in field.error.messages():
            ${error}
        % endfor
    % endif
  </%text>

</%def>
