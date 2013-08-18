_venv() 
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="create activate export ls --help"
 
    case "${prev}" in
    activate|a|e|export)
        local list=$(find ~/.virtualenvs/ -maxdepth 1 -mindepth 1 -type d -exec basename {} \;) 
        COMPREPLY=( $(compgen -W "${list}" -- ${cur}) )
        return 0
        ;;
    *)
        ;;
    esac
    
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0

}
complete -F _venv venv
