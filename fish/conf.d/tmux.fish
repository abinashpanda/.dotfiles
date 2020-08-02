set LANG en_US.UTF-8
set LC_CTYPE en_US.UTF-8

if not set -q TMUX
    set -g TMUX tmux new-session -d -s base
    eval $TMUX
    tmux attach-session -d -t base
end

