set -l SCRIPT_DIR (realpath (dirname (status -f)))
set -g -x GOPRIVATE github.com/Remitly,github.com/remitly
set -g -x GOPATH $HOME/go-projects
set -g -x PATH $HOME/.pyenv/shims /usr/local/opt/php@7.1/bin /usr/local/opt/php@7.1/sbin /Applications/MySqlWorkbench.app/Contents/MacOS /usr/local/bin /opt/homebrew/bin /Users/gunnarg/code/metrics-decks/bin $GOPATH/bin $PATH
set -g -x GITHUB_TOKEN (forge auth github)
set -g -x GITHUB_SSH_KEY_PATH $HOME/.ssh/id_rsa
set -g -x github '{"username": "gunnarg-remitly", "accessToken": "'$GITHUB_TOKEN'"}'
set -g -x gradlehome "{\"dir\": \"$HOME/.gradle\"}"
set -g -x VISUAL code -w
set -g -x EDITOR code -w
set -g -x AWS_REGION us-west-2
set -g -x SSO_USER_EMAIL gunnarg@remitly.com
set -g -x BUGSNAG_PAT (cat $SCRIPT_DIR/secure/bugsnag)
if status is-interactive
	forcow
end
