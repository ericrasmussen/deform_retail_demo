"""
These views are designed to show off custom styled forms with the `deform`
library. To keep things simple and show how you could make a working example,
there is some boilerplate in each of these views. In a real world application
it would be better to factor out the common code into helper functions.
"""

import deform

from pyramid.httpexceptions import HTTPFound
from pyramid.view import view_config

from .datasource import UserAccount

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
    # see if a user submitted the form
    submitted = 'submit' in request.POST

    # get the form control field names and values as a list of tuples
    controls = request.POST.items()

    # instantiate our colander schema
    schema = AccountSchema()

    # create a deform form object from the schema
    form = deform.Form(schema)

    # if this is a POST request and the user submitted information:
    if submitted:
        # try to validate the form and save the user/redirect on success
        try:
            appstruct = form.validate(controls)
            UserAccount.save(request, appstruct)
            request.session.flash("Account updated! (this session only)")
            location = request.route_url('account')
            return HTTPFound(location=location)
        # if the form failed, return it with errors and don't save changes
        except deform.ValidationFailure, e:
            return {'form': form}

    # otherwise retrieve the user from dummy storage
    user = UserAccount.get_user(request)

    # get the user data as an appstruct (in our case a dict)
    user_appstruct = user.to_appstruct()

    # pass the appstruct to the form to pre-populate the fields
    populated_form = deform.Form(schema, appstruct=user_appstruct)

    return {'form': populated_form}
