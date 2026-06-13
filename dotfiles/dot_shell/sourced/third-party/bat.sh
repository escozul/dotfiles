# Theming for bat and delta
export BAT_THEME="DarkNeon"

# Pass all help (-h, --help) output through bat
# This Caused a lot of issues that used actual -h arguments like du -h So I removed it.
# if [[ -n ${ZSH_NAME} ]]; then
#     alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
#     alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
# fi

# Colorized help output via bat
# Another solution that did not work... :( disabling it and keeping the last clean solution that does not intercept -h
# if [[ -n ${ZSH_NAME} ]]; then
#     alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
#     alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
#     bathelp() { "$@" --help 2>&1 | bat --language=help --style=plain; }
# 
#     # Commands where -h means human-readable, not help
#     for cmd in du df ls free curl wc sort cut head tail numfmt; do
#         eval "${cmd}() { command ${cmd} \"\$@\"; }"
#     done
# fi

# Colorized help output via bat.
# bat highlights against a named syntax; older bat builds (e.g. 0.19) ship no
# "help" syntax and abort with "[bat error]: unknown syntax: 'help'", which
# swallows all --help output on those machines. Probe what this box's bat can
# actually do (--color=always forces the highlight path even off a TTY) and fall
# back to the always-bundled "man" syntax when "help" is unavailable, so that
# `<cmd> --help` works on every server regardless of bat version.
if [[ -n ${ZSH_NAME} ]] && command -v bat >/dev/null 2>&1; then
    if printf 'x\n' | bat --language=help --color=always >/dev/null 2>&1; then
        alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
    else
        alias -g -- --help='--help 2>&1 | bat --language=man --style=plain'
    fi

    bathelp() {
        "$@" -h 2>&1 | bat --style=plain --language=man
    }
fi
