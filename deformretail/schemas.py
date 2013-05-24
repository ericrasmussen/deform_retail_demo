import colander

"""
A very straightforward schema for our contact form.
"""

class ContactSchema(colander.Schema):
    name = colander.SchemaNode(
        colander.String(),
        description='Your name',
    )
    email = colander.SchemaNode(
        colander.Email(),
        description='Your email',
    )
    comment = colander.SchemaNode(
        colander.String(),
        description="What's up?",
    )
