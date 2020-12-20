tell application "Music" to activate
tell application "System Events" to tell process "Music" to keystroke "f" using {command down}
delay 1
tell application "System Events" to tell process "Music" to (key code 53)
delay 1
tell application "System Events" to tell process "Music" to (key code 126 using {option down})
delay 1
repeat with i from 1 to 5 by 1
	tell application "Music" to activate
	tell application "System Events" to tell process "Music" to (key code 125)
	delay 1
end repeat
