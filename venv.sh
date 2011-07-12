#!/bin/bash

VIRTUALENV_PATH=~/.python/virtualenv.py
VIRTUALENVS_DIR=~/.virtualenvs

function venv {

    if [ "$1" == "c" ]; then
        if [ -n "$2" ]; then
            name=$2
        else
            echo "Please enter name of the new env";
            return 1;
        fi
            
        _virtualenv $VIRTUALENVS_DIR/$name --no-site-packages;
        return 0;
    fi

    if [ "$1" == "a" ]; then
        if [ -n "$2" ]; then
            name=$2
        else
            echo "Please enter name of the env which wants to activate";
            return 1;
        fi
            
        source $VIRTUALENVS_DIR/$name/bin/activate;
        return 0;
    fi

    _virtualenv;
    return 0;

}

function _virtualenv {
    python $VIRTUALENV_PATH $@
}
