from pyramid.config import Configurator

from pyramid.session import UnencryptedCookieSessionFactoryConfig


def main(global_config, **settings):  # pragma no cover
    """ This function returns a Pyramid WSGI application.
    """
    session_factory = UnencryptedCookieSessionFactoryConfig('not-so-secret')

    config = Configurator(settings=settings, session_factory=session_factory)

    config.add_static_view('static', 'static', cache_max_age=3600)

    config.add_route('home', '/')
    config.add_route('contact', '/contact')
    config.add_route('account', '/account')
    config.add_route('login', '/login')

    config.scan()

    return config.make_wsgi_app()
