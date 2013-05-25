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
          <a href="${request.route_url('home')}">
            Deform Retail Form Demos
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
          <a href="#">Links</a>
          <ul class="dropdown">
            <li><label>Deform</label></li>
            <li><a href="http://deform.readthedocs.org/">Deform Docs</a></li>
            <li><a href="http://deformdemo.repoze.org/">Deform Demo Site</a></li>
            <li><a href="http://deform.readthedocs.org/en/latest/retail.html">Deform Retail Rendering</a></li>
            <li class="divider"></li>
            <li><label>Software used on this page</label></li>
            <li><a href="http://www.pylonsproject.org/">Pyramid</a></li>
            <li><a href="http://www.makotemplates.org/">Mako</a></li>
            <li><a href="http://foundation.zurb.com/">Foundation</a></li>
          </ul>
        </li>
        <li class="divider"></li>
        <li class="has-dropdown">
          <a href="#">More</a>
          <ul class="dropdown">
            <li><a href="https://github.com/ericrasmussen/deform_retail_demo">Github Source</a></li>
            <li><a href="http://chromaticleaves.com">Chromatic Leaves (blog)</a></li>
          </ul>
        </li>
      </ul>
    </section>
  </nav>

  <!-- End Top Bar -->


  <!-- Main Page Content and Sidebar -->

  <div class="row">

    <div class="large-9 columns">

      ${self.body()}

      <p><a href="${self.template_source()}">Template source code</a></p>

    </div>

    <!-- Sidebar -->

    <div class="large-3 columns">
      <h3>Example Forms</h3>
      <ul class="no-bullet">
        <li><a href="${request.route_url('contact')}">Contact</a></li>
        <li><a href="">Account Preferences</a></li>
      </ul>
    </div>

    <!-- End Sidebar -->

  </div>

  <!-- End Main Content and Sidebar -->

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


  <script src="${request.static_url('deformretail:static/foundation/js/vendor/zepto.js')}"></script>
  <script src="${request.static_url('deformretail:static/foundation/js/foundation.min.js')}"></script>
  <script>
    $(document).foundation();
  </script>
</body>


</html>