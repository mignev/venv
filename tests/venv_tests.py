import os
import subprocess
import unittest
import re

class VenvExecutableTest(unittest.TestCase):

    def cmd(self, *args):
        process = subprocess.Popen(*args, shell=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        output = process.communicate()[0]
        return_code = process.wait()
        result = { "output": output, "return_code": return_code }
        return result

    def test_is_installed_correctly(self):
        pass

if __name__ == "__main__":
    unittest.main()