from .base import *

DEBUG = True
TEMPLATE_DEBUG = DEBUG

DATABASES = {
    "default" : {
        "ENGINE": "django.db.backends.postgresql_psycopg2", 
        "NAME": "django_db", 
        "USER": ,
        "PASSWORD": ,
        "HOST": ,
        "PORT": ,
    }        
}

THIRD_PARTY_APPS += ("debug_toolbar",)
MIDDLEWARE_CLASSES += ("debug_toolbar.middleware.DebugToolbarMiddleware",)
