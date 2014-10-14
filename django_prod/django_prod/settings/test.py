from __future__ import absolute_import
from .base import *

DEBUG = True
TEMPLATE_DEBUG = DEBUG

TEST_RUNNER = "django_test_exclude.runners.ExcludeTestSuiteRunner"
TEST_EXCLUDE = set(INSTALLED_APPS) - set(LOCAL_APPS)

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.sqlite3",
        "NAME": ":memory:",
    }
}
