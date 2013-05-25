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

