import glob
import setuptools
from setuptools import setup, find_packages
from setuptools.dist import Distribution

DRAKE_VERSION = '0.32.0'

# build_wheel/
#   - setup.py
#   - pydrake/
#      - .drake-find_resource-sentinel
#      - doc/
#      - examples/
#      - lib/
#      - manipulation/

pydrake_lib = [
    '../' + f
    for f in glob.iglob("pydrake" + '**/**', recursive=True)
    if '.so' in f
]

docs = [
    '../' + f
    for f in glob.iglob("pydrake/doc" + '**/**', recursive=True)
]

examples = [
    '../' + f
    for f in glob.iglob("pydrake/examples" + '**/**', recursive=True)
]

lib = [
    '../' + f
    for f in glob.iglob("pydrake/lib" + '**/**', recursive=True)
]

manipulation = [
    '../' + f
    for f in glob.iglob("pydrake/manipulation" + '**/**', recursive=True)
]

# Required python packages that will be pip installed along with pydrake
# TODO Can we remove any of these?
python_required = [
  "matplotlib",
  "meshcat",
  "numpy",
  "pydot",
  "pygame",
  "PyYAML",
  "scipy"
]


# Distribution which always forces a binary package with platform name
class BinaryDistribution(Distribution):
    def is_pure(self):
        return False

    def has_ext_modules(self):
        return True


setup(name='pydrake',
      version=DRAKE_VERSION,
      description='Model-based design and verification for robotics',
      long_description='''
Drake ("dragon" in Middle English) is a toolbox maintained by the Robot
Locomotion Group at the MIT Computer Science and Artificial Intelligence
Lab (CSAIL). It is a collection of tools for analyzing the dynamics of
robots and building control systems for them in C++ and Python, with a
heavy emphasis on optimization-based design/analysis.'''.strip(),
      url='https://drake.mit.edu',
      author='Drake Development Team',
      author_email='drake-users@mit.edu',
      classifiers=[
        'Development Status :: 4 - Beta',
        'Environment :: Console',
        'Intended Audience :: Developers',
        'Intended Audience :: Science/Research',
        'License :: OSI Approved :: BSD License',
        'Operating System :: MacOS',
        'Operating System :: POSIX :: Linux',
        'Programming Language :: Python :: 3 :: Only',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
        'Programming Language :: Python :: 3.9',
        'Programming Language :: Python :: Implementation :: CPython',
        'Topic :: Scientific/Engineering',
        'Topic :: Software Development :: Libraries :: Python Modules'],
      distclass=BinaryDistribution,
      # TODO Check this: do we need to add third-party licenses?
      license='BSD 3-Clause License',
      platforms=['linux_x86_64'],
      packages=find_packages(),
      # Add in any packaged data
      include_package_data=True,
      package_data={
        'pydrake': ['../.drake-find_resource-sentinel'] + docs + examples +
        lib + manipulation + pydrake_lib
      },
      python_requires='>=3.6',
      install_requires=python_required,
      ext_modules=[
           setuptools.Extension(name='pydrake',
                                sources=[])],
      zip_safe=False
      )
