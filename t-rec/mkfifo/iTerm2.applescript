tell application "Finder"
	set parent_path to the container of the (path to me) as text
	set p to POSIX path of parent_path as text
end tell
tell application "iTerm"
	set c to "/bin/zsh -l -c 'cd " & p & "; direnv exec " & p & " mask record; sleep 5'"
	set newWindow to (create window with default profile command c)
end tell
