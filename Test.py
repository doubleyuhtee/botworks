import unittest

if __name__ == '__main__':
    testsuite = unittest.TestLoader().discover("Test", "*Test.py")
    unittest.TextTestRunner(verbosity=2).run(testsuite)
