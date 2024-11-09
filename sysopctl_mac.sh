#!/bin/bash

VERSION="v0.1.0"

# Basic options: --help and --version
if [[ "$1" == "--help" ]]; then
    echo "Usage: sysopctl [command] [options]"
    echo "Options:"
    echo "--help          Show help information"
    echo "--version       Show version information"
    echo ""
    echo "Commands:"
    echo "service list             List all running services"
    echo "system load              View current system load"
    echo "service start <name>     Start a specific service"
    echo "service stop <name>      Stop a specific service"
    echo "disk usage               Check disk usage"
    echo "process monitor          Monitor system processes"
    echo "logs analyze             Analyze system logs for critical errors"
    echo "backup <path>            Backup a specific file or directory"
    exit 0
elif [[ "$1" == "--version" ]]; then
    echo "sysopctl version $VERSION"
    exit 0
fi

# Command implementations
if [[ "$1" == "service" && "$2" == "list" ]]; then
    launchctl list
    exit 0
elif [[ "$1" == "system" && "$2" == "load" ]]; then
    uptime
    exit 0
elif [[ "$1" == "service" && "$2" == "start" && -n "$3" ]]; then
    sudo launchctl load -w /Library/LaunchDaemons/"$3".plist
    echo "Service $3 started."
    exit 0
elif [[ "$1" == "service" && "$2" == "stop" && -n "$3" ]]; then
    sudo launchctl unload -w /Library/LaunchDaemons/"$3".plist
    echo "Service $3 stopped."
    exit 0
elif [[ "$1" == "disk" && "$2" == "usage" ]]; then
    df -h
    exit 0
elif [[ "$1" == "process" && "$2" == "monitor" ]]; then
    top
    exit 0
elif [[ "$1" == "logs" && "$2" == "analyze" ]]; then
    log show --predicate 'eventMessage contains "error"' --info --last 1h
    exit 0
elif [[ "$1" == "backup" && -n "$2" ]]; then
    rsync -a "$2" ~/backup/
    echo "Backup of $2 completed."
    exit 0
else
    echo "Invalid command or option. Use --help for usage information."
    exit 1
fi
