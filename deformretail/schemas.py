import deform
import colander

# our dummy password checker
from .datasource import UserAccount


class ContactSchema(colander.Schema):
    """
    A very straightforward schema for our demo company contact form.

    Maybe TODO: create an input widget that can use the placeholder tag.
    """

    name = colander.SchemaNode(
        colander.String(),
        title='Your name',
        description='Your name',
        placeholder='Jane Smith',
    )

    email = colander.SchemaNode(
        colander.String(),
        title='Your email',
        description='Your email',
        placeholder='jane@smithco.com',
        validator=colander.Email(),
    )

    comment = colander.SchemaNode(
        colander.String(),
        title="What's up?",
        description='Your comment',
        widget=deform.widget.TextAreaWidget(rows=4),
    )

# constant for our checkbox widget
TEA_CHOICES = (
    ('black', 'Black'),
    ('green', 'Green'),
    ('oolong', 'Oolong'),
    ('white', 'White'),
    ('puerh', 'Puerh'),
    )

class UserPreferencesSchema(colander.Schema):
    """
    Supports the `AccountSchema` by recording a user's preferences.
    """
    tea_type = colander.SchemaNode(
        colander.Set(),
        title='Favorite tea types',
        widget=deform.widget.CheckboxChoiceWidget(values=TEA_CHOICES),
        validator=colander.Length(min=1),
    )

    favorite_number = colander.SchemaNode(
        colander.Integer(),
    )

class AccountSchema(colander.Schema):
    """
    A schema for our demo user account/preferences form. This example shows
    off a nested mapping schema, the `UserPreferencesSchema`.
    """
    name = colander.SchemaNode(
        colander.String(),
        title='Account name',
        description='Account name',
    )

    email = colander.SchemaNode(
        colander.String(),
        title='Account email',
        description='Account email',
        validator=colander.Email(),
    )

    preferences = UserPreferencesSchema()


@colander.deferred
def deferred_password_validator(node, kw):
    """
    Uses colander's `Length` validator to check password length and then uses
    a dummy password checker. This is a common pattern in deform when your
    validator can't be created until you can inspect the node or other values
    bound to the schema at the time it was created.
    """
    length_validator = colander.Length(min=5, max=100)

    user_email = kw.get('user_email')

    # create a colander validator that can access the `user_email`
    def password_validator(node, value):
        if not UserAccount.check_password(user_email, value):
            raise colander.Invalid(node, 'Email or password invalid')

    return colander.All(length_validator, password_validator)


class LoginSchema(colander.Schema):
    """
    A simple login schema for authenticating users.
    """
    email = colander.SchemaNode(
        colander.String(),
        title='Email',
        description='Your email',
        validator=colander.Email(),
    )

    password = colander.SchemaNode(
        colander.String(),
        title='Password',
        validator=deferred_password_validator,
        widget=deform.widget.PasswordWidget(),
        description='Your password',
    )
