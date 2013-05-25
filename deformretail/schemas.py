import deform
import colander


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

