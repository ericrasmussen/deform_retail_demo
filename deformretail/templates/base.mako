## based on http://foundation.zurb.com/page-templates4/contact.html

<!DOCTYPE html>
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8" />

  <!-- Set the viewport width to device width for mobile -->
  <meta name="viewport" content="width=device-width" />

  <link rel="shortcut icon" href="${request.static_url('deformretail:static/foundation/favicon.ico')}" />

  <title>Deform Retail Rendering | ${self.title()}</title>

  <link rel="stylesheet" href="${request.static_url('deformretail:static/foundation/css/normalize.css')}">
  <link rel="stylesheet" href="${request.static_url('deformretail:static/foundation/css/foundation.css')}">

  <script src="${request.static_url('deformretail:static/foundation/js/vendor/custom.modernizr.js')}"></script>

</head>
<body>

 <nav class="top-bar">
    <ul class="title-area">
      <!-- Title Area -->
      <li class="name">
        <h1>
          <a href="#">
            Deform Retail Form Demo
          </a>
        </h1>
      </li>
      <li class="toggle-topbar menu-icon"><a href="#"><span>menu</span></a></li>
    </ul>

    <section class="top-bar-section">
      <!-- Right Nav Section -->
      <ul class="right">
        <li class="divider"></li>
        <li class="has-dropdown">
          <a href="#">Main Item 1</a>
          <ul class="dropdown">
            <li><label>Section Name</label></li>
            <li class="has-dropdown">
              <a href="#" class="">Has Dropdown, Level 1</a>
              <ul class="dropdown">
                <li><a href="#">Dropdown Options</a></li>
                <li><a href="#">Dropdown Options</a></li>
                <li><a href="#">Level 2</a></li>
                <li><a href="#">Subdropdown Option</a></li>
                <li><a href="#">Subdropdown Option</a></li>
                <li><a href="#">Subdropdown Option</a></li>
              </ul>
            </li>
            <li><a href="#">Dropdown Option</a></li>
            <li><a href="#">Dropdown Option</a></li>
            <li class="divider"></li>
            <li><label>Section Name</label></li>
            <li><a href="#">Dropdown Option</a></li>
            <li><a href="#">Dropdown Option</a></li>
            <li><a href="#">Dropdown Option</a></li>
            <li class="divider"></li>
            <li><a href="#">See all &rarr;</a></li>
          </ul>
        </li>
        <li class="divider"></li>
        <li><a href="#">Main Item 2</a></li>
        <li class="divider"></li>
        <li class="has-dropdown">
          <a href="#">Main Item 3</a>
          <ul class="dropdown">
            <li><a href="#">Dropdown Option</a></li>
            <li><a href="#">Dropdown Option</a></li>
            <li><a href="#">Dropdown Option</a></li>
            <li class="divider"></li>
            <li><a href="#">See all &rarr;</a></li>
          </ul>
        </li>
      </ul>
    </section>
  </nav>

  <!-- End Top Bar -->


  ${self.body()}


  <!-- Footer -->

  <footer class="row">
    <div class="large-12 columns">
      <hr />
      <div class="row">
        <div class="large-6 columns">
          <p>&copy; Copyright no one at all. Go to town.</p>
        </div>
        <div class="large-6 columns">
          <ul class="inline-list right">
            <li><a href="#">Link 1</a></li>
            <li><a href="#">Link 2</a></li>
            <li><a href="#">Link 3</a></li>
            <li><a href="#">Link 4</a></li>
          </ul>
        </div>
      </div>
    </div>
  </footer>

  <!-- End Footer -->



  <!-- Map Modal -->

  <div class="reveal-modal" id="mapModal">
    <h4>Where We Are</h4>
    <p><img src="http://placehold.it/800x600" /></p>

    <!-- Any anchor with this class will close the modal. This also inherits certain styles, which can be overriden. -->
    <a href="#" class="close-reveal-modal">&times;</a>
  </div>

  <script src="${request.static_url('deformretail:static/foundation/js/vendor/zepto.js')}"></script>
  <script src="${request.static_url('deformretail:static/foundation/js/foundation.min.js')}"></script>
  <script>
    $(document).foundation();
  </script>
</body>


</html>