from setuptools import find_packages

try:
    from setuptools import setup
except:
    from distutils.core import setup

dependencies = ['docopt', 'click']

setup(
    name='team10x-lab',
    version='0.0.1',
    license='MIT',
    description='TEAM10X-LAB::python tips & test project',
    author='baeksw',
    author_email='dohaskell7@gmail.com',
    long_description=open('README.md').read(),
    install_requires=dependencies,
    package_data={'t10x_lab': ['config/*.yml']},
    entry_points={
        'console_scripts' : [
            't10x_app=t10x_lab.app.run_themother:main'
        ],
    },
    packages=find_packages(exclude=['tests']),
)
 
