import unittest

from pyramid import testing


class ViewTests(unittest.TestCase):
    """
    If you want to write good tests, look no further. No, really, don't look
    down and read any of these. The following tests are the bare minimum to
    keep the demo working, and remember that the view code is written to show
    off deform rather than show off good pyramid practices. In a real project
    you'd likely want to abstract some of the form handling so you could more
    easily test against dummy objects.
    """

    def test_home(self):
        from .views import home
        request = testing.DummyRequest()
        response = home(request)
        self.assertEqual(response, {})

    def test_contact_no_post(self):
        from .views import contact
        import colander
        request = testing.DummyRequest()
        response = contact(request)
        for field in response['form']:
            self.assertEqual(field.cstruct, colander.null)

    def test_contact_bad_post(self):
        from .views import contact
        request = testing.DummyRequest()
        request.POST = dict(name='', email='', comment='', submit=True)
        response = contact(request)
        for field in response['form']:
            self.assertNotEqual(field.error, None)

    def test_contact_good_post(self):
        from .views import contact
        request = testing.DummyRequest()
        request.POST = dict(name='test', email='test@example.com', comment='hi',
                            submit=True)
        request.route_url = lambda x: 'http://example.com/contact'
        response = contact(request)
        self.assertEqual(response.location, 'http://example.com/contact')

    def test_account_no_post(self):
        from .views import account
        from .datasource import DUMMY_USER
        request = testing.DummyRequest()
        response = account(request)
        cstruct = response['form'].cstruct
        self.assertEqual(DUMMY_USER.to_appstruct(), cstruct)

    def test_account_bad_post(self):
        from .views import account
        request = testing.DummyRequest()
        bad_prefs = dict(favorite_number='spam', tea_types=set())
        request.POST = dict(name='', email='', preferences=bad_prefs,
                            submit=True)
        response = account(request)
        for field in response['form']:
            self.assertNotEqual(field.error, None)

    def test_account_good_post(self):
        from .views import account
        from .datasource import DUMMY_USER
        request = testing.DummyRequest()
        controls = DUMMY_USER.to_appstruct()
        controls['submit'] = True
        request.POST = controls
        request.route_url = lambda x: 'http://example.com/account'
        response = account(request)
        self.assertEqual(response.location, 'http://example.com/account')
        self.assertIn('user_appstruct', request.session)

    def test_account_user_from_session(self):
        from .views import account
        from .datasource import DUMMY_USER
        DUMMY_USER.name = 'new name'
        request = testing.DummyRequest()
        request.session['user_appstruct'] = DUMMY_USER.to_appstruct()
        response = account(request)
        saved_user = response['form'].cstruct
        self.assertEqual(saved_user['name'], 'new name')

    def test_login_no_post(self):
        from .views import login
        import colander
        request = testing.DummyRequest()
        response = login(request)
        for field in response['form']:
            self.assertEqual(field.cstruct, colander.null)

    def test_login_bad_post(self):
        from .views import login
        request = testing.DummyRequest()
        request.POST = dict(email='', password='', submit=True)
        response = login(request)
        for field in response['form']:
            self.assertNotEqual(field.error, None)

    def test_login_bad_password(self):
        from .views import login
        request = testing.DummyRequest()
        request.POST = dict(email='foo@example.com', password='foo@example.com',
                            submit=True)
        response = login(request)
        expected_error = response['form']['password'].error
        self.assertNotEqual(expected_error, None)

    def test_login_good_post(self):
        from .views import login
        request = testing.DummyRequest()
        request.POST = dict(email='test@example.com', password='12345',
                            submit=True)
        request.route_url = lambda x: 'http://example.com/login'
        response = login(request)
        self.assertEqual(response.location, 'http://example.com/login')

