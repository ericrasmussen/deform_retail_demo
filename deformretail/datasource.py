"""
This is a dummy implementation of a generic data source so this demo's
view code can focus on views. In a real world application you can of course use
real data with your data storage mechanism of choice.
"""

class UserAccount(object):
    """
    We'll say this is what users look like in our database. The `preferences`
    attribute is an instance of class `UserPreferences`.
    """
    def __init__(self, name, email, preferences):
        self.name = name
        self.email = email
        self.preferences = preferences

    def to_appstruct(self):
        """
        Serializes this class's attributes to a dict (a deform appstruct). When
        you want to pre-populate a form with data, you can pass a dict like this
        to `deform.Form` with the `appstruct` keyword argument.
        """
        prefs = {'favorite_number': self.preferences.favorite_number,
                 'tea_type': self.preferences.tea_type}
        return {'name': self.name, 'email': self.email, 'preferences': prefs}

    @classmethod
    def save(cls, request, appstruct):
        """
        Saves the dummy user's updated preferences in the current session.
        """
        request.session['user_appstruct'] = appstruct

    @classmethod
    def get_user(cls, request):
        """
        Tries to get the user from the session or returns the default dummy
        user if not, because this demo is here to show off pre-populating
        fields, even if the data is contrived.
        """
        # if no user data is in the session, return `DUMMY_USER`
        if 'user_appstruct' not in request.session:
            return DUMMY_USER

        # otherwise create the user from the saved appstruct
        appstruct = request.session['user_appstruct']
        name = appstruct['name']
        email = appstruct['email']
        prefs_struct = appstruct['preferences']
        prefs = UserPreferences(prefs_struct['favorite_number'],
                                prefs_struct['tea_type'])
        return UserAccount(name, email, prefs)

    @classmethod
    def check_password(cls, email, password):
        """
        Contrived dummy password checker. As long as the email doesn't equal
        the password it will return True.
        """
        return email != password

class UserPreferences(object):
    """
    Here's a separate storage class (could be a separate table or key in your
    data store) to model a user's preferences.
    """
    def __init__(self, favorite_number, tea_type):
        self.favorite_number = favorite_number
        self.tea_type = tea_type


# Dummy constants

DUMMY_PREFERENCES = UserPreferences(
    '42',
    set(['black', 'puerh', 'oolong']),
)

DUMMY_USER = UserAccount(u'Ima Person', u'email@example.com', DUMMY_PREFERENCES)
