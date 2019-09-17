#!/usr/bin/env bash

__progname__="jlogin"
__config_shell__=".zshrc" # Usage: .bashrc | .zshrc


function _git_commit(){
    if [[ -d ".git" ]]; then
        git add .
        git commit -m "Update: $(date)"
    fi
}

case $1 in
    build|-b|-B)
        ./$0 clear
        _git_commit
        ./setup.py bdist bdist_wheel
        printf "Compiled!\n"
    ;;
    install|-i|-I)
        ./$0 build
        pip install dist/*.whl --user
        source ~/${__config_shell__}
        ./$0 clear
        printf "Installed!\n"
    ;;
    reinstall|-r|-R)
    ./$0 uninstall
     ./$0 install
    ;;
    clear|-c|-C)
        rm -rf build dist ${__progname__}.egg-info
        printf "Clean!\n"
    ;;
    uninstall|-u|-U)
        pip uninstall ${__progname__} -y
        rm -f $HOME/.local/bin/${__progname__}
        source ~/${__config_shell__}
        printf "Uninstalled!\n"
    ;;
    testpypi|-tp)
        ./$0 build
        # Note: Create ~/.pypirc file to receive "testpypi" header.
        twine upload -r testpypi dist/*
    ;;
    pypi|-p)
        ./$0 build
        # Note: Create ~/.pypirc file to receive "pypi" header.
        twine upload -r pypi dist/*
        # twine upload dist/*
    ;;
    *)
        printf "\nUsage: $0 { install [-i] | uninstall [-u] | reinstall [-r] | build [-b] | clear [-c] | testpypi [-tp] | pypi [-p] }\n"
    ;;
esac
exit 0