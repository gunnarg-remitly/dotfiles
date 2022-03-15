# Defined in - @ line 1
function lap
	./gradlew fix && git commit -a -m 'lint' && git push
end
