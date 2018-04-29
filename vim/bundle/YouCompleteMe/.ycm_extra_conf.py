
def FlagsForFile(filename, **kwargs):
    return { 'flags': [
        '-x', 'c++',
        '-Wall',
        '-Wpedantic',
        '-Werror',
#        '-Wno-long-long',
#        '-Wno-variadic-macros',
        '-fexceptions',
        '-std=c++11',
        '-I', 'include'
    ]}

