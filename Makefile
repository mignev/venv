all: help

help:
    @echo "  install        to install venv   "
    @echo "  installc       to install venv bash complation   "
    @echo "  test           to run all tests  "
    @echo "  uninstall      to uninstall venv "

install:
    @echo "Installing ..."
    @echo "Making some dirs in you home ..."
    @echo ''

    @if test -d ~/.virtualenvs; then \
        echo "~/.virtualenvs is already exist."; \
    else \
        mkdir -p ~/.virtualenvs; \
        echo "Add .virtualenvs dir in ${HOME}"; \
    fi

    @if test -d ~/.python; then \
        echo "~/.python is already exist."; \
    else \
        mkdir -p ~/.python; \
        echo "Add .python dir in ${HOME}"; \
    fi

    @if test -f ~/.python/virtualenv.py; then \
        echo "~/.python/virtualenv.py is already exist."; \
    else \
        cp scripts/virtualenv.py ~/.python/; \
        echo "~/.python/virtualenv.py is installed successful."; \
    fi

    @if test -d ~/.venv; then \
        echo "~/.venv is already exist."; \
    else \
        mkdir -p ~/.venv; \
        echo "Add .venv dir in ${HOME}"; \
    fi

    @if test -f ~/.venv/venv.sh; then \
        echo "~/.venv/venv.sh is already exist."; \
    else \
        cp venv.sh ~/.venv/; \
        echo "~/.venv/venv.sh is installed successful."; \
        echo ''; \
        echo "Adding venv.sh to bashrc"; \
        echo '\nsource ~/.venv/venv.sh' >> ~/.bashrc; \
    fi

installc:
    @echo "TODO"

test:
    @echo "TODO"

uninstall:
    @echo "Uninstalling venv"
    @echo ""
    @echo "Removing virtualenv.py file"

    @if test -f ~/.python/virtualenv.py; then \
        rm ~/.python/virtualenv.py; \
        echo "~/.python/virtualenv.py is uninstalled successful."; \
    else \
        echo "~/.python/virtualenv.py is not exist."; \
    fi

    @echo "Removing ~/.venv/venv.sh file"

    @if test -f ~/.venv/venv.sh; then \
        rm ~/.venv/venv.sh; \
        sed -ie 's:source ~/.venv/venv.sh::g' ~/.bashrc; \
        echo "~/.venv/venv.sh is uninstalled successful."; \
    else \
        echo "~/.venv/venv.sh is not exist."; \
    fi