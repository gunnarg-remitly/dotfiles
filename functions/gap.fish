# Defined in - @ line 2
function gap
	gofmt -w ./app
    gofmt -w ./pkg
    git commit -a -m 'gofmt'
    git push
end
