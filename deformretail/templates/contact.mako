<%inherit file="base.mako"/>

  <!-- Main Page Content and Sidebar -->

  <div class="row">

    <!-- Contact Details -->
    <div class="large-9 columns">
      % for msg in request.session.pop_flash():
          ${msg}
      % endfor
      <h3>Get in Touch!</h3>
      <p>We'd love to hear from you. You can either reach out to us as a whole and one of our awesome team members will get back to you, or if you have a specific question reach out to one of our staff. We love getting email all day <em>all day</em>.</p>

      <div class="section-container auto" data-section>
        <section class="section">
          <h5 class="title"><a href="#panel1">Contact Our Company</a></h5>
          <div class="content" data-slug="panel1">
            <form formid="contactform" method="post" action="/">
              <div class="row collapse">
                ${self.render_error(form['name'].error)}

                <div class="large-2 columns">
                  <label class="inline">${form['name'].title}</label>
                </div>
                <div class="large-10 columns">
                  ${form['name'].serialize()|n}
                </div>
              </div>
              <div class="row collapse">
              ${self.render_error(form['email'].error)}
                <div class="large-2 columns">
                  <label class="inline">${form['email'].title}</label>
                </div>
                <div class="large-10 columns">
                  ${form['email'].serialize()|n}
                </div>
              </div>
              ${self.render_error(form['comment'].error)}
              <label>${form['comment'].title}</label>
              ${form['comment'].serialize()|n}
              <input type="submit" name="submit" value="Submit" class="radius button"/>
            </form>
          </div>
        </section>
        <section class="section">
          <h5 class="title"><a href="#panel2">Notice</a></h5>
          <div class="content" data-slug="panel2">
            You probably don't need to contact us. This is just a demo form.
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

<%def name="render_error(error)">
% if error:
    % for e in error.messages():
        ${e}
    % endfor
% endif
</%def>