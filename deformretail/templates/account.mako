<%inherit file="base.mako"/>

<%def name="title()">Account Preferences Demo</%def>

    <!-- Account Details -->

      <h3>${self.title()}</h3>
      <p>Here's a demo form for managing account information and preferences.
      The preferences are in their own tab only for demonstration purposes, but
      they are also a separate mapping in the deform account schema.
      </p>

      ## flash any messages in the session flash queue
      % for msg in request.session.pop_flash():
      <div data-alert class="alert-box success">
          ${msg}
          <a href="#" class="close">&times;</a>
      </div>
      % endfor

      <form formid="contactform" method="post" action="${request.route_url('account')}">

        <div class="section-container auto" data-section>
          <section class="section">
            <h5 class="title"><a href="#panel1">Account Information</a></h5>
            <div class="content" data-slug="panel1">


              ## fields are keyed by name in deform `Form` objects

              ${render_input_field(form['name'])}

              ${render_input_field(form['email'])}

              <input type="submit" name="submit" value="Save" class="radius button"/>

            </div>
          </section>
          <section class="section">
            <h5 class="title"><a href="#panel2">Preferences</a></h5>
            <div class="content" data-slug="panel2">

              ## declare the start of a mapping for a nested schema
              ${form.start_mapping('preferences')}

              ## you can iterate over the nested fields in a mapping
              % for field in form['preferences']:

                  % if field.error:
                      <div class="row collapse error">
                  % else:
                      <div class="row collapse">
                  % endif

                      ## display the field's title as a label
                          <div class="large-2 columns">
                              <label class="inline">${field.title}</label>
                          </div>

                      ## serialize the field
                          <div class="large-10 columns deform">
                              ${field.serialize()|n}

                      ## render any error messages if present
                              ${render_error(field.error)}
                          </div>

                      </div>

              % endfor

              ## declare the end of a mapping for a nested schema
              ${form.end_mapping('preferences')}

              <input type="submit" name="submit" value="Update" class="radius button"/>
            </div>
          </section>
        </div>

      </form>

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


## helper function to render error messages if the field has any errors

<%def name="render_error(error)">
    ## include any error messages if present
    % if error:
        % for e in error.messages():
            <small>${e|n}</small>
        % endfor
    % endif
</%def>


## template source code link

<%def name="template_source()">https://github.com/ericrasmussen/deform_retail_demo/blob/master/deformretail/templates/account.mako</%def>
