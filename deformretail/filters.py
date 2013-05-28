"""
Additional mako filters to make the demo templates a little nicer.
"""

from pygments import highlight
from pygments.lexers import get_lexer_by_name
from pygments.formatters import HtmlFormatter

from translationstring import TranslationString


def code(block):
    """
    Parses a mako code block into html for nicer syntax highlighting. Used in
    the examples on the home page.
    """
    lexer = get_lexer_by_name('mako')
    formatter = HtmlFormatter(style='monokai')
    return highlight(block, lexer, formatter)

def translate(text):
    """
    Deform uses the `translation.TranslationString` type for some error
    messages.  When converted to unicode they may contain variables such as
    "${var} is not a number".  This filter allows us to check for that type and
    call the `interpolate` method (to substitute the variables) before
    rendering.

    Note: pyramid uses mako's "h" filter (html escaping) by default, so for this
    to work we also need to use the "n" filter to disable html escaping.

    Example:

        ${my_deform_error|n,translate}
    """
    if isinstance(text, TranslationString):
        return text.interpolate()
    else:
        return text
