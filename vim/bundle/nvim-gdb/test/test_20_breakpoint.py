#!/usr/bin/env python

import os
import unittest
import engine


eng = engine.Engine()
subtests = {"gdb": [' dd', '\n'], "lldb": [' dl', '\n']}


class TestBreakpoint(unittest.TestCase):

    def test_10_detect(self):
        ''' => Verify manual breakpoint is detected '''
        for k in subtests['gdb']:
            eng.KeyStroke(k)
        eng.KeyStroke('break main\n')

        self.assertEqual(1, eng.Eval('len(t:gdb._breakpoints)'))
        self.assertEqual({'16': '1'}, eng.Eval('t:gdb._breakpoints["%s"]' % os.path.abspath('src/test.cpp')))

        eng.KeyStrokeL('<esc>')
        eng.KeyStrokeL('ZZ')

    def test_20_cd(self):
        ''' => Verify manual breakpoint is detected from random directory '''
        exe_path = os.path.abspath('a.out')
        old_cwd = os.getcwd()

        try:
            eng.KeyStroke(':cd /tmp\n')
            eng.KeyStroke(':GdbStart gdb -q -f %s\n' % exe_path)
            eng.KeyStroke('break main\n')

            self.assertEqual(1, eng.Eval('len(t:gdb._breakpoints)'))
            self.assertEqual({'16': '1'}, eng.Eval('t:gdb._breakpoints["%s"]' % os.path.abspath('src/test.cpp')))

            eng.KeyStrokeL('<esc>')
            eng.KeyStrokeL('ZZ')
        finally:
            eng.KeyStroke(':cd %s\n' % old_cwd)


if __name__ == "__main__":
    unittest.main()
