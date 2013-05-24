import deform
import colander

"""
A very straightforward schema for our contact form.
"""

class ContactSchema(colander.Schema):
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

