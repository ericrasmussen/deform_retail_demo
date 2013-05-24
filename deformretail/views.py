from pyramid.view import view_config


@view_config(route_name='contact', renderer='contact.mako')
def contact(request):
    """
    A basic contact form with field validation by deform.
    """
    return {}
