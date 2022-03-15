set -g -x PATH ~/.pyenv/shims /usr/local/opt/php@7.1/bin /usr/local/opt/php@7.1/sbin /Applications/MySqlWorkbench.app/Contents/MacOS /usr/local/bin $PATH
set -g -x GOPATH ~/go-projects
set -g -x GITHUB_SSH_KEY_PATH ~/.ssh/id_rsa
set -g -x gradlehome '{"dir": "/Users/gunnarg/.gradle"}' 
set -g -x VISUAL code -w
set -g -x EDITOR code -w
if status is-interactive
	forcow
end
