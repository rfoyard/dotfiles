alias v="nvim"
alias vim="nvim"
alias rm="rm -i"
alias ls="eza"
alias ll="eza -lg"
alias la="eza -lag"
alias tree="eza --tree"
alias top="htop"

alias gl="git log --graph --decorate --pretty=format:'%Cred%h%Creset - %Cgreen(%cr)%Creset %s - %C(blue)%an%Creset %C(yellow)%d%Creset' --abbrev-commit --all"
alias kafka-console-producer.sh="kafka-console-producer.sh --producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner"

# paths
fish_add_path $HOME/Development/sdks/go/bin
fish_add_path $HOME/Development/sdks/kafka_2.13-3.4.0/bin

# parameters
set -g fish_key_bindings fish_vi_key_bindings

# environment variables
set -gx EDITOR nvim
set -gx GIT_EDITOR nvim
set -g -x CDPATH "$HOME/Development/clients"
set -gx GOPATH "$HOME/Development/sdks/go"
set -gx GOPRIVATE "github.com/toggleglobal/*"
set -gx LIMA_HOME "$HOME/Library/Application Support/Lima"

# 1password environment
set -gx OP_ACCOUNT "togglesoftwareservicesuk"
set -gx OPENAPI_KEY "op://Private/OpenAI/credential"
set -gx ANTHROPIC_API_KEY "op://Private/Anthropic/credential"

# homebrew environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# gcloud environment and completions
source "/Users/romain/Development/sdks/google-cloud-sdk/path.fish.inc"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    # Do nothing
end

