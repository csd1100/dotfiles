# microsoft terminal keybinds
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down
bindkey '^[OC' forward-char
bindkey '^[OD' backward-char

# CWD
keep_current_path() {
    printf "\e]9;9;%s\e\\" "$(wslpath -w "$PWD")"
}
chpwd_functions+=(keep_current_path)

mark_prompt_start() {
  printf "\e]133;A\e\\"
}

mark_command_start() {
  # Only emit mark if at the start of a command line
  if [[ $CONTEXT == "start" ]]; then
    printf "\e]133;B\e\\"
  fi
}

mark_command_executed() {
  printf "\e]133;C\e\\"
}

mark_command_finished() {
  # The special variable ? expands to the exit status of the last command
  printf "\e]133;D;%s\e\\" $?
}

# Before each prompt, emit a mark for the end of the previous command
# And after that, a mark for the start of the prompt
precmd_functions+=(mark_command_finished mark_prompt_start)

# Starting to read new line of input
zle -N zle-line-init mark_command_start

# Command has been read and is about to be executed
preexec_functions+=(mark_command_executed)