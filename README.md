Venv
=======

[![Build Status](https://travis-ci.org/mignev/venv.png?branch=master)](https://travis-ci.org/mignev/venv)

So the idea behind `venv` is to be just an simple tool that will helps you when you work with [virtualenv.py](http://www.virtualenv.org/). `venv` gives you some aliases that will helps you to `create`, `activate` and `export` your virtual environments with ease :)


`venv` will store all your python virtual environments in `~/.virtualenvs/`. This is good because when you create your virtual environments, they will not be tangle in your project directory.

#Usage examples
So … these are some examples how to use `venv` and what is the difference between the native usage of `virtualenv.py` and `venv`

### How to create new environment

In standard way the syntax is the following:

	python ~/.python/virtualenv.py ~/.virtualenv/mynewenv --no-site-packages

The `venv` way is:

	venv create mynewenv

or the shortest way:

	venv c mynewenv

### How to activate environment

In standard way the syntax is the following:

	source ~/.virtualenv/mynewenv/bin/activate

The `venv` way is:

	venv activate mynewenv

or the shortest way:

	venv a mynewenv

### How to export environment

In standard way the syntax is the following:

	pip freeze -E ~/.virtualenv/mynewenv >  mynewenv-requirements.txt;

The `venv` way is:

	venv export mynewenv

or the shortest way:

	venv e mynewenv

### Get list of all your virtual envs

In standard way the syntax is the following:

	ls ~/.virtualenv

The `venv` way is:

	venv ls

# More shortcuts
if you want to use `venv` for different version of python instead of the default version `venv` gives you some aliases that will helps you to do that. If you want to create new `python 2.7` virtual environment you must just the following:

	venv27 create my_new_py27_env

Available aliases are: `venv25`, `venv26`, `venv27`, `venv30`, `venv31`, `venv32`, `venv33`, `venv34`


#Requirements

* Python 2.6+
* bash-completion

# Installation

    # git clone git@github.com:mignev/venv.git
    # cd venv
    # make install

# Uninstallation

    # cd venv
    # make uninstall

# Venv completions
In `completion` directory you will find file with name `venv-completion.bash`.

There are some useful completions for `venv` commands like: `activate` and `export`.

To install the completions just do the following:

	make installc


# Testing

TODO

# Contributing
Fork the [venv repo on GitHub](https://github.com/mignev/venv), make your super duper awesome changes :) and send me a Pull Request. :)

# TODO
- Add some tests
- Add project to Travis CI
- Add bash auto completions to installer

# CHANGELOG

### 0.2:

- Small documentation
- Add makefile
- small refactoring

### 0.1:

- venv as alias of `python virtualenv.py`
- venv aliases for creating, activating and exporting virtual environments

#Copyright
Copyright (c) 2011 Marian Ignev. See LICENSE for further details.
