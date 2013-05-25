"""
These views are designed to show off custom styled forms with the `deform`
library. To keep things simple and show how you could make a working example,
there is some boilerplate in each of these views. In a real world application
it would be better to factor out the common code into helper functions.
"""

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
    A basic contact form with field validation by deform. We have to handle
    three conditions:

    1) Page visit with no POST request: display a blank form
    2) POST request that fails validation: return the form with errors
    3) Successful POST request: flash a success message and redirect
    """
    # see if a user submitted the form
    submitted = 'submit' in request.POST

    # get the form control field names and values as a list of tuples
    controls = request.POST.items()

    # instantiate our colander schema
    schema = ContactSchema()

    # create a deform form object from the schema
    form = deform.Form(schema)

    # if this is a POST request and the user submitted information:
    if submitted:
        # try to validate the form and redirect with a success message
        try:
            appstruct = form.validate(controls)
            request.session.flash("We'll respond eventually! (not really)")
            return HTTPFound(location=request.route_url('contact'))
        # if validation failed, the form object will now contain error messages
        except deform.ValidationFailure, e:
            return {'form': form}

    # otherwise return the blank form object
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
