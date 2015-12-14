#!/bin/bash

VIRTUALENV_PATH=~/.python/virtualenv.py
VIRTUALENVS_DIR=~/.virtualenvs
VENV_VERSION="0.2"

function venv {

   local thecmd=$1;
   local name="";

    local aliases=( "c:create" "a:activate" "e:export" )
    for alias_dict in ${aliases[@]}
    do
        local alias=$(echo $alias_dict|awk -F ':' '{print $1}');
        if [ "$thecmd" == "$alias" ]; then
            local cmd=$(echo $alias_dict|awk -F ':' '{print $2}');
        fi
    done

    if [ -z "$cmd" ]; then
        local cmd="$thecmd";
    fi

    if [ "$cmd" == "create" ]; then
        if [ -n "$2" ]; then
            name=$2
        else
            echo "Please enter name of the new env";
            return 1;
        fi

        _virtualenv $VIRTUALENVS_DIR/$name --no-site-packages;
        return 0;
    fi

    if [ "$cmd" == "activate" ]; then
        if [ -n "$2" ]; then
            name=$2
        else
            echo "Please enter name of the env which wants to activate";
            return 1;
        fi

        source $VIRTUALENVS_DIR/$name/bin/activate;
        return 0;
    fi

    if [ "$cmd" == "export" ]; then
        if [ -n "$2" ]; then
            name=$2
        else
            echo "Please enter name of the env which wants to export";
            return 1;
        fi

        pip freeze $VIRTUALENVS_DIR/$name >  $name-requirements.txt;
        return 0;
    fi

    if [ "$cmd" == "ls" ]; then
        find $VIRTUALENVS_DIR/ -maxdepth 1 -mindepth 1 -type d -exec basename {} \;
        return 0;
    fi

    if [ "$cmd" == "version" ]; then
        echo $VENV_VERSION;
        return 0;
    fi

    _virtualenv;
    return 0;

}

function _virtualenv {
    local py_ver=$1;
    local all_but_first="${*:2}"
    local py=`which python$py_ver`;
    if [ -z $py ]; then
        echo "Python $py_ver is not installed."
    else
        $py $VIRTUALENV_PATH $all_but_first
        return 0;
    fi
}

alias venv25="_virtualenv 2.5"
alias venv26="_virtualenv 2.6"
alias venv27="_virtualenv 2.7"
alias venv30="_virtualenv 3.0"
alias venv31="_virtualenv 3.1"
alias venv32="_virtualenv 3.2"
alias venv33="_virtualenv 3.3"
alias venv34="_virtualenv 3.4"
alias venv35="_virtualenv 3.5"
