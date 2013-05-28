"""
This module makes our custom filters available to mako templates.
"""

from pyramid.events import subscriber
from pyramid.events import BeforeRender

from .filters import (
    code,
    translate,
)

@subscriber(BeforeRender)
def add_global(event):
    """
    Add our two helper filters to the mako context.
    """
    event['translate'] = translate
    event['code'] = code
