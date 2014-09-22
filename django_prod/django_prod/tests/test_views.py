import unittest
from selenium import webdriver

class HomePageTest(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.FireFox()      

    def tearDown(self):
        self.browser.quit()

    def test_if_title_is_correct(self):
        self.driver.get("http://dev:8000")
        self.driver.assertIn("Django", self.driver.title)

if __name__ == '__main__':
    unittest.main(warnings='ignore')
