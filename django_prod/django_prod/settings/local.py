# andrew young
from __future__ import absolute_import
from .base import *

DEBUG = True
TEMPLATE_DEBUG = DEBUG

DATABASES = {
    "default" : {
        "ENGINE": "django.db.backends.postgresql_psycopg2", 
        "NAME": "django_db", 
        "USER": "django_user",
        "PASSWORD": "check",
        "HOST": "127.0.0.1",
    }        
}

THIRD_PARTY_APPS += ("debug_toolbar",)
MIDDLEWARE_CLASSES += ("debug_toolbar.middleware.DebugToolbarMiddleware",)
