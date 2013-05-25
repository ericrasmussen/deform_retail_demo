<%inherit file="base.mako"/>

<%def name="title()">Company Contact Demo</%def>

    <!-- Contact Details -->

      <h3>${self.title()}</h3>
      <p>This demo shows off a snazzy company contact form. Your input will be
      validated by deform using a colander schema. Here are some
      things to try:</p>

      <ul style="list-style-position:inside;">
        <li>Submit the form with one or more blank fields</li>
        <li>Submit the form with a malformed email address (like "me@here")</li>
        <li>Submit the form with a well-formed email address and all fields
            filled in</li>
      </ul>

      ## flash any messages in the session flash queue
      % for msg in request.session.pop_flash():
      <div data-alert class="alert-box success">
          ${msg}
          <a href="#" class="close">&times;</a>
      </div>
      % endfor

      <div class="section-container auto" data-section>
        <section class="section">
          <h5 class="title"><a href="#panel1">Contact Our Company</a></h5>
          <div class="content" data-slug="panel1">
            <form formid="contactform" method="post" action="${request.route_url('contact')}">

              ## fields are keyed by name in deform `Form` objects

              ${render_input_field(form['name'])}

              ${render_input_field(form['email'])}

              ${render_textarea(form['comment'])}

              <input type="submit" name="submit" value="Submit" class="radius button"/>

            </form>
          </div>
        </section>
        <section class="section">
          <h5 class="title"><a href="#panel2">More Options</a></h5>
          <div class="content" data-slug="panel2">
            This is just here to show off the nicely tabbed sections. No more
            options, I'm afraid.
          </div>
        </section>
      </div>

    <!-- End Contact Details -->



## helper function to render a text input field

<%def name="render_input_field(field)">
    ## include the foundation error class if this field had an error
    % if field.error:
        <div class="row collapse error">
    % else:
        <div class="row collapse">
    % endif

        ## display the field's title as a label
          <div class="large-2 columns">
              <label class="inline">${field.title}</label>
          </div>

        ## serialize the field (filter with "|n" so it won't escape the html)
          <div class="large-10 columns">
              ${field.serialize()|n}

              ## render any error messages if present
              ${render_error(field.error)}
          </div>

        </div>
</%def>


## helper function to render a textarea field

<%def name="render_textarea(field)">
    ## include the foundation error class if this field had an error
    % if field.error:
        <div class="row collapse error">
    % else:
        <div class="row collapse">
    % endif

        ## render the label, textarea, and possibly error messages
            <label>${field.title}</label>
            ${form['comment'].serialize()|n}
            ${render_error(field.error)}

        </div>
</%def>


## helper function to render error messages if the field has any errors

<%def name="render_error(error)">
    ## include any error messages if present
    % if error:
        % for e in error.messages():
            <small>${e}</small>
        % endfor
    % endif
</%def>


## template source code link

<%def name="template_source()">https://github.com/ericrasmussen/deform_retail_demo/blob/master/deformretail/templates/contact.mako</%def>
