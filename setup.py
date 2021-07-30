
import fnmatch
import os

from setuptools import setup, find_packages


_VERSION = '0.30.0'

def find_files(pattern, root):
  """Return all the files matching pattern below root dir."""
  for dirpath, _, files in os.walk(root):
    for filename in fnmatch.filter(files, pattern):
      yield os.path.join(dirpath, filename)

so_lib_paths = ['pydrake']

matches = []
for path in so_lib_paths:
  matches.extend(['../' + x for x in find_files('*', path) if x.endswith('.so')])


setup(name='pydrake',
      version=_VERSION,
      description='Model-based design and verification for robotics',
      long_description ='''Drake ("dragon" in Middle English) is a toolbox maintained by the Robot
Locomotion Group at the MIT Computer Science and Artificial Intelligence
Lab (CSAIL). It is a collection of tools for analyzing the dynamics of
robots and building control systems for them in C++ and Python, with a
heavy emphasis on optimization-based design/analysis.''',
      url='https://drake.mit.edu',
      author='Drake Development Team',
      author_email='drake-users@mit.edu',
      packages=find_packages(),
      # Add in any packaged data.
      include_package_data=True,
      package_data={
        'pydrake': matches
      },
)
