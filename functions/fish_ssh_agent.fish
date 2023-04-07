# adapted from https://stackoverflow.com/a/18915067
set SSH_ENV "$HOME/.ssh/agent-environment"

function start_agent
	/usr/bin/ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
	chmod 600 $SSH_ENV
	. $SSH_ENV > /dev/null
	/usr/bin/ssh-add
end

function fish_ssh_agent --description "Start ssh-agent if not started yet, or uses already started ssh-agent."
	if test -f "$SSH_ENV"
		. "$SSH_ENV" > /dev/null
		if not ps -ef | grep $SSH_AGENT_PID | grep "ssh-agent -c\$" &> /dev/null
			start_agent
		end
	else
		start_agent
	end
end
