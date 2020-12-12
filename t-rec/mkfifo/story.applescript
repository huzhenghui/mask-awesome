tell application "Calculator" to activate
repeat with i from 1 to 9 by 1
	tell application "System Events" to tell process "Calculator" to keystroke i
	do shell script "/bin/sleep 1"
end repeat