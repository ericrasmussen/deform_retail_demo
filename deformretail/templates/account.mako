<%inherit file="base.mako"/>

<%def name="title()">Account Preferences Demo</%def>

    <!-- Account Details -->

      <h3>${self.title()}</h3>

      ## flash any messages in the session flash queue
      % for msg in request.session.pop_flash():
      <div data-alert class="alert-box success">
          ${msg}
          <a href="#" class="close">&times;</a>
      </div>
      % endfor

      <form formid="accountform" method="post" action="${request.route_url('account')}">

        <div>
            <h5 class="title">Account Information</h5>
            <div>


              ## fields are keyed by name in deform `Form` objects

              ${render_input_field(form['name'])}

              ${render_input_field(form['email'])}

            </div>
            <div>

              <fieldset>
                  <legend>Preferences</legend>

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

              </fieldset>

              <input type="submit" name="submit" value="Save changes" class="radius button"/>

            </div>
        </div>

      </form>

      <p>In this demo, everything in the "Preferences" fieldset is part of a nested
      mapping in our main account schema (and it has its own class in our dummy
      model). Try submitting the form with:</p>

      <ul style="list-style-position:inside;">
        <li>missing fields</li>
        <li>a bad email address or a bad number (like "A")</li>
        <li>all tea types unchecked</li>
        <li>valid data (will be persisted for the session)</li>
      </ul>

      <p>
        <span class="label">Note:</span>
        Any data you submit will be stored in an unencrypted cookie
        session for demo purposes only.
      </p>

    <!-- End Account Details -->


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
    <%doc>
      Note: we use our own translate filter here to handle deform error messages
      with the TranslationString type (they require additional processing
      before rendering).
    </%doc>

    ## include any error messages if present
    % if error:
        % for e in error.messages():
            <small>${e|n,translate}</small>
        % endfor
    % endif
</%def>


## template source code link

<%def name="template_source()">https://github.com/ericrasmussen/deform_retail_demo/blob/master/deformretail/templates/account.mako</%def>

