<%inherit file="base.mako"/>

  <!-- Main Page Content and Sidebar -->

  <div class="row">

    <!-- Contact Details -->
    <div class="large-9 columns">

      <h3>Get in Touch!</h3>
      <p>We'd love to hear from you. You can either reach out to us as a whole and one of our awesome team members will get back to you, or if you have a specific question reach out to one of our staff. We love getting email all day <em>all day</em>.</p>

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
            <form formid="contactform" method="post" action="/">

              ## fields are keyed by name in deform `Form` objects

              ${render_input_field(form['name'])}

              ${render_input_field(form['email'])}

              ${render_textarea(form['comment'])}

              <input type="submit" name="submit" value="Submit" class="radius button"/>

            </form>
          </div>
        </section>
        <section class="section">
          <h5 class="title"><a href="#panel2">Notice</a></h5>
          <div class="content" data-slug="panel2">
            You probably don't need to contact us. This is just a demo form with
            tabs.
          </div>
        </section>
      </div>

    </div>

    <!-- End Contact Details -->


    <!-- Sidebar -->


    <div class="large-3 columns">
      <h5>Map</h5>
      <!-- Clicking this placeholder fires the mapModal Reveal modal -->
      <p>
        <a href="" data-reveal-id="mapModal"><img src="http://placehold.it/400x280"></a><br />
        <a href="" data-reveal-id="mapModal">View Map</a>
      </p>
      <p>
        123 Awesome St.<br />
        Barsoom, MA 95155
      </p>
    </div>
    <!-- End Sidebar -->
  </div>

  <!-- End Main Content and Sidebar -->


## mako defs

<%def name="title()">Contact Demo</%def>

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

<%def name="render_error(error)">
    ## include any error messages if present
    % if error:
        % for e in error.messages():
            <small>${e}</small>
        % endfor
    % endif
</%def>
