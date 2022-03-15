# Defined in /var/folders/j5/wvy0_60111v2tsfmp0pvxvk80000gn/T//fish.suJWd7/roll.fish @ line 2
function roll --description 'roll some dice'
    set -l helpText 'Description'\n'========'\n'roll uses dice notation to roll n dice of m sides, eg 1d6 rolls one die with 6 sides'\n'roll optionally takes flags to alter the result before the dice notation'\n\n'Flags'\n'-----'\n'The output may be modified by including a variety of flags prior to the argument'\n'The flags may not be combined'\n\n'-s'\n'sums the the result of the dice roll'\n\n'-c'\n'counts the number of dice that pass a test (eg how many dice were greater than 4?)'\n'takes two arguments, a test flag (-lt, -le, -eq, -ne, -ge, -gt) and an integer value to test against'\n\n'-f'\n'filters for dice that pass a test (eg return only the dice that were greater than 4)'\n'takes two arguments, a test flag (-lt, -le, -eq, -ne, -ge, -gt) and an integer value to test against'\n\n'Examples'\n'--------'\n\n'### Roll one six-sided dice'\n'`roll 1d6`'\n\n'### Sum ten twenty-sided dice'\n'`roll -s 10d20`'\n\n'### Count the dice that are greater than or equal to 5 in a roll of fifty six-sided dice'\n'`roll -c -ge 5 50d6`'\n\n'### Filter for dice that are less than 3 in a roll of seven twelve-sided dice'\n'`roll -f -lt 3 7d12`'\n

    set -l printHelp 0
    # argument 1 can be -c, -s or ~1d6
    set -l numArgs (count $argv)
    if test $numArgs -ge 1
        set diceCommand $argv[$numArgs]
    else
        echo $helpText
        return 1
    end

    # potential vars - summing, counting, filtering, diceTest, diceTestVal
    set summing 0
    set counting 0
    set filtering 0
    set diceTest 0
    set diceTestVal 0
    if string match --quiet --regex '^a-h$' a$diceCommand
        echo $helpText
        return 0
    else if not string match --quiet --regex '^\d+[dD]\d+$' $diceCommand
        echo $helpText
        return 1
    else if test $numArgs -eq 3
        echo $helpText
        return 1
    else if test $numArgs -gt 4
        echo $helpText
        return 1
    else if test $numArgs -eq 2
        if string match --quiet --regex '^a-s$' a$argv[1]
            set summing 1
        end
    else if test $numArgs -eq 4
        # find flag, find flag args
        if not string match --quiet --regex '^a-c$|a-f$' a$argv[1]
            echo $helpText
            return 1
        else
            if not string match --quiet --regex '^a-gt$|^a-ge$|^a-lt$|^a-le$|^a-eq$|^a-ne$' a$argv[2]
                echo $helpText
                return 1
            else
            if not string match --quiet --regex '^\d+$' $argv[3]
                echo $helpText
                return 1
            else
                if string match --quiet --regex '^a-c$' a$argv[1]
                set counting 1
                else
                set filtering 1
                end
                set diceTest $argv[2]
                set diceTestVal $argv[3]
            end
            end
        end
    end

    if test $printHelp -eq 1
        echo $helpText
        return 1
    else
        set diceResults
        set diceParams (string split d $diceCommand)
        for i in (seq 1 $diceParams[1])
            set -a diceResults (random 1 $diceParams[2])
        end
        if test $summing -eq 1
            set result 0
            for i in (seq 1 (count $diceResults))
                set result (math $result+$diceResults[$i])
            end
            echo $result
            return 0
        else if test $counting -eq 1
            set result 0
            for i in (seq 1 (count $diceResults))
                if test $diceResults[$i] $diceTest $diceTestVal
                    set result (math $result+1)
                end
            end
            echo $result
            return 0
        else if test $filtering -eq 1
            set result
            for i in (seq 1 (count $diceResults))
                if test $diceResults[$i] $diceTest $diceTestVal
                    set -a result $diceResults[$i]
                end
            end
            echo $result
            return 0
        else
            echo $diceResults
            return 0
        end
    end
    return 1
end
