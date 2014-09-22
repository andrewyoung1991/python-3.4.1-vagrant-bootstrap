from __future__ import absolute_import

from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse_lazy
from django.views import generic

from braces import views

# write your views here
