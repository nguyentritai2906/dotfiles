#!/bin/bash
# pip-fzf
# Functions to offer fuzzy searching while using pip
# Must have pip, fzf, and curl installed
# Usage:
#   `pip install ** [TAB]`
#   `pip uninstall ** [TAB]`

_fzf_complete_pip() {
    # Offer fuzzy completion to `pip isntall` and `pip uninstall`
    # List all packages on PyPI with `pip install`
    # List all installed packages with `pip uninstall`
    if [[ "$@" == 'pip uninstall'* ]]; then
        _fzf_complete --reverse --multi -- "$@" < <(
            command cat <(python3 -m pip list | tail -n +3 | awk '{print $1}')
        )
        eval "zle fzf-redraw-prompt"
    elif [[ "$@" == 'pip install'* ]]; then
        _fzf_complete --reverse --multi -- "$@" < <(
            command curl -s https://pypi.org/simple/ | tail -n +7 | sed 's/<[^>]*>//g' | awk '{print $1}'
        )
        eval "zle fzf-redraw-prompt"
    else
        eval "zle ${fzf_default_completion:-expand-or-complete}"
    fi
}
