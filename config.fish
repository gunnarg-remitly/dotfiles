set -l SCRIPT_DIR (realpath (dirname (status -f)))
set -g -x PATH ~/.pyenv/shims /usr/local/opt/php@7.1/bin /usr/local/opt/php@7.1/sbin /Applications/MySqlWorkbench.app/Contents/MacOS /usr/local/bin $PATH
set -g -x GOPATH ~/go-projects
set -g -x GITHUB_SSH_KEY_PATH ~/.ssh/id_rsa
set -g -x github (cat $SCRIPT_DIR/secure/github)
set -g -x gradlehome '{"dir": "/Users/gunnarg/.gradle"}' 
set -g -x VISUAL code -w
set -g -x EDITOR code -w
set -g -x AWS_REGION us-west-2
set -g -x AWS_ACCESS_KEY_ID (grep aws_access_key_id $HOME/.aws/credentials | sed 's/.*= *//g')
set -g -x AWS_SECRET_ACCESS_KEY (grep aws_secret_access_key $HOME/.aws/credentials | sed 's/.*= *//g')
set -g -x aws "{\"accessKeyId\": \"$AWS_ACCESS_KEY_ID\", \"secretAccessKey\": \"$AWS_SECRET_ACCESS_KEY\", \"region\":\"us-west-2\"}"
if status is-interactive
	forcow
end
