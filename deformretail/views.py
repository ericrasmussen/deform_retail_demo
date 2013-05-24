from pyramid.view import view_config


@view_config(route_name='home', renderer='templates/mytemplate.pt')
def my_view(request):
    return {'project': 'deformretail'}


@view_config(route_name='contact', renderer='templates/contact.mako')
def contact(request):
    """
    A basic contact form with field validation by deform.
    """
    return {}
