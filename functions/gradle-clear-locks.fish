function gradle-clear-locks
    find ~/.gradle/ -name "*.lock" | xargs rm
end
