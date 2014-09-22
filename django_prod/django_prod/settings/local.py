from .base import *

DEBUG = True
TEMPLATE_DEBUG = DEBUG

DATABASES = {
    "default" : {
        "ENGINE": ,
        "NAME": , 
    }        
}

THIRD_PARTY_APPS += ("debug_toolbar",)
MIDDLEWARE_CLASSES += ("debug_toolbar.middleware.DebugToolbarMiddleware",)
