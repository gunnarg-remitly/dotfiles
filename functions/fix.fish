# Defined in /var/folders/j5/wvy0_60111v2tsfmp0pvxvk80000gn/T//fish.HAcCWN/fix.fish @ line 2
function fix
    if test -e ./build.gradle
        ./gradlew fix && git commit -a -m 'fix lint' && git push
    else if test -e ./package.json
        yarn run fix && git commit -a -m 'fix lint' && git push
    else
        echo "Can't fix this chief"
    end
end
