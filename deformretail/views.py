import deform

from .schemas import ContactSchema

from pyramid.httpexceptions import HTTPFound
from pyramid.view import view_config


@view_config(route_name='contact', renderer='contact.mako')
def contact(request):
    """
    A basic contact form with field validation by deform.
    """
    submitted = 'submit' in request.POST
    controls = request.POST.items()
    schema = ContactSchema()
    form = deform.Form(schema)

    # a user submitted the form
    if submitted:
        # if the fields are valid, flash success and return a blank form
        try:
            appstruct = form.validate(controls)
            request.session.flash("We'll respond eventually -- thanks!")
            return HTTPFound(location=request.route_url('contact'))
        # if the form failed, return it errors and all
        except deform.ValidationFailure, e:
            return {'form': form}

    # otherwise render the blank form
    return {'form': form}
