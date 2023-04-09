# adapted from https://stackoverflow.com/a/18915067
set SSH_ENV "$HOME/.ssh/agent-environment"

function start_agent -d "start ssh-agent"
	/usr/bin/ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
	chmod 600 $SSH_ENV
	. $SSH_ENV > /dev/null
end

function fish_ssh_agent -d "use already started ssh-agent or start a new one"
	argparse "m/manual" -- $argv

	if test -f "$SSH_ENV"
		. "$SSH_ENV" > /dev/null
		if not ps -ef | grep $SSH_AGENT_PID | grep "ssh-agent -c\$" &> /dev/null
			start_agent
			[ ! $_flag_m ] && /usr/bin/ssh-add
		end
	else
		start_agent
		[ ! $_flag_m ] && /usr/bin/ssh-add
	end
end
