eval "$(mise activate zsh)"
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/eduardozamora/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/eduardozamora/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/eduardozamora/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/eduardozamora/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Added by Windsurf
export PATH="/Users/eduardozamora/.codeium/windsurf/bin:$PATH"
