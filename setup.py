#!/usr/bin/env python
# -*- coding: utf-8 -*-

from setuptools import setup, find_packages
from os.path import dirname, abspath, join


with open('README.md') as f:
    long_description = f.read()

ROOT = dirname(abspath(__file__))
requirements_dev = join(ROOT, 'requirements-dev.txt')
extras_require = {}
with open(requirements_dev) as f:
    extras_require['dev'] = [i.strip().split('#', 1)[0].strip()
                             for i in f.read().strip().split('\n')]

setup(
    name='jlogin',
    version='1.0.0',
    description='Example system login',
    author='William Canin',
    author_email='william.costa.canin@gmail.com',
    license='MIT Licenses',
    maintainer='William Canin',
    long_description_content_type='text/markdown',
    long_description=long_description,
    url='https://github.com/williamcanin/jlogin',
    packages=find_packages(),
    platforms='any',
    extras_require=extras_require,
    classifiers=[
        'Programming Language :: Python :: 3',
        'License :: OSI Approved :: MIT License',
        'Operating System :: MacOS :: MacOS X',
        'Operating System :: Microsoft :: Windows',
        'Operating System :: POSIX',
        'Operating System :: POSIX :: Linux',
    ],
    python_requires='>= 3.6',
    keywords='example jlogin',
    entry_points={'console_scripts': ['jlogin=jlogin.jlogin:JLogin']},
    package_data={'': ['LICENSE', 'requirements-dev.txt', 'README.md']}
)
