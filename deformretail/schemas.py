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

