import unittest
from pyvirtualdisplay import Display
from selenium import webdriver

class GoogleTest(unittest.TestCase)
    def setUp(self):
        self.display = Display(visible=0, size=(800, 600))
        self.display.start()
        # now Firefox will run in a virtual display.
        # you will not see the browser.
        self.browser = webdriver.Firefox()
        self.browser.get('http://www.google.com')

    def tearDown(self):
        self.browser.quit()
        self.display.stop()

    def google_goes_to_google(self):
        assert "Google" in self.browser.title
