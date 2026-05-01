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

# Colorized help output via bat
if [[ -n ${ZSH_NAME} ]]; then
    alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
    bathelp() { "$@" -h 2>&1 | bat --language=help --style=plain; }
fi
