from translationstring import TranslationString

from pyramid.events import subscriber
from pyramid.events import BeforeRender

@subscriber(BeforeRender)
def add_global(event):
    """
    Make our hacky translation filter available to Mako.
    """
    event['trans'] = trans

def trans(text):
    """
    This is a hack to work around the `TranslationString` type sometimes used by
    deform in error messages. Chameleon takes care of rendering them
    automatically, but because mako doesn't, we need an extra filter.

    Note: make sure to use it in conjunction with the "n" filter so mako doesn't
    first wrap it in `Markup` from markupsafe.

    Example:

        ${my_deform_error|n,trans}

    TODO: find a nicer way to work this transparently into mako, if possible.

    """
    if isinstance(text, TranslationString):
        return text.interpolate()
    else:
        return text
