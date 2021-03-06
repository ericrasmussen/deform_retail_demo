<%inherit file="base.mako"/>

<%def name="title()">Login Demo</%def>

    <!-- Login Details -->

      <h3>${self.title()}</h3>

      ## flash any messages in the session flash queue
      % for msg in request.session.pop_flash():
      <div data-alert class="alert-box success">
          ${msg}
          <a href="#" class="close">&times;</a>
      </div>
      % endfor

      <form formid="loginform" method="post" action="${request.route_url('login')}">

        <div>
            <h5 class="title">Sign-in Here</h5>
            <div>


              ## fields are keyed by name in deform `Form` objects

              ${render_input_field(form['email'])}

              ${render_input_field(form['password'])}

              <input type="submit" name="submit" value="Sign in" class="radius button"/>

            </div>
        </div>

      </form>

      <p>This demo shows off a basic login form. We use a deferred password
      validator to let deform check the submitted email/password with
      any password checker function. Try submitting the form with:</p>

      <ul style="list-style-position:inside;">
        <li>missing fields</li>
        <li>a malformed email address</li>
        <li>a password length < 5 or length > 100</li>
        <li>the email address as the password</li>
        <li>a valid email with a made up password between 5-100 characters</li>
      </ul>

    <!-- End Login Details -->



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

<%def name="template_source()">https://github.com/ericrasmussen/deform_retail_demo/blob/master/deformretail/templates/login.mako</%def>
