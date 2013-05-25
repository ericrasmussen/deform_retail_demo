import deform

from pyramid.httpexceptions import HTTPFound
from pyramid.view import view_config

from .schemas import (
    ContactSchema,
    AccountSchema,
)


@view_config(route_name='home', renderer='home.mako')
def home(request):
    """
    Our glorious home page. Nothing fancy.
    """
    return {}

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

@view_config(route_name='account', renderer='account.mako')
def account(request):
    """
    An account preferences form that shows off a nested deform schema and
    pre-populates the schema with fake user data. In a real application you
    could pass in the user's real account information and preferences from your
    data source.
    """
    submitted = 'submit' in request.POST
    controls = request.POST.items()
    schema = AccountSchema()
    form = deform.Form(schema)

    # a user submitted the form
    if submitted:
        # if the fields are valid, flash success and return a blank form
        try:
            appstruct = form.validate(controls)
            request.session.flash("Account updated! (but not really)")
            return HTTPFound(location=request.route_url('account'))
        # if the form failed, return it errors and all
        except deform.ValidationFailure, e:
            return {'form': form}

    # otherwise create an appstruct with our fake user's information
    # (in a real application this would be obtained from your data source)
    preferences = {'favorite_number': 42,
                   'tea_type': set(('black', 'puerh', 'oolong'))}
    appstruct = {'name': 'Ima Person', 'email': 'email@example.com',
                 'preferences': preferences}
    populated_form = deform.Form(schema, appstruct=appstruct)
    return {'form': populated_form}
