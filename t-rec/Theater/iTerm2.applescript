tell application "Finder"
	set parent_path to the container of the (path to me) as text
	set p to POSIX path of parent_path as text
end tell
tell application "iTerm"
	set c to "/bin/zsh -l -c 'cd " & p & "; mask record'"
	set newWindow to (create window with default profile command c)
end tell
set isRunning to true
repeat while isRunning
	delay 1
	tell application "System Events" to set isRunning to exists (processes where name is "iTerm2")
end repeat