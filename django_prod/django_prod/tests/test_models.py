from django.test import TestCase

class SmokeTest(TestCase):
    def try_bad_math(self):
        self.assertEqual(3 + 2, 7)
