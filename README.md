
# sysopctl

**Version**: v0.1.0

`sysopctl` is a custom system management command for macOS/linux, providing options to manage services, view system load, monitor processes, analyze logs, and back up files. It is designed to enhance system administration capabilities, as required by our customer

## Installation

1. **Clone the Repository**:
   Clone the repository to your local machine:
   ```bash
   git clone https://github.com/vardhan376/sysopctl_command.git
   ```

2. **Make the Script Executable**:
   Navigate into the cloned directory and make the script executable: 
   ```bash
   chmod +x sysopctl_mac.sh
   ```
   OR (For Linux):
   ```bash
   chmod +x sysopctl_linux.sh
   ```

3. **Create an Alias**: 
   To run the command easily from any location, set up an alias in the terminal. This alias will allow you to use sysopctl_mac instead of typing the full script path every time.
   ```bash
   alias sysopctl='./sysopctl_mac.sh'
   ```
   OR (For Linux):
   ```bash
   alias sysopctl='./sysopctl_linux.sh'
   ```

## Usage

Run `sysopctl_mac [command] [options]`.

### Commands

#### Service Management
- `service list` - List all running services.
- `service start <service-name>` - Start a service.
- `service stop <service-name>` - Stop a service.

#### System Monitoring
- `system load` - Display the current system load.
- `disk usage` - Show disk usage statistics.
- `process monitor` - Monitor system processes in real-time.

#### Log Analysis
- `logs analyze` - Analyze system logs for recent critical errors.

#### File Backup
- `backup <path>` - Back up a file or directory to `~/backup/`.

### Options
- `--help` - Display usage information.
- `--version` - Show the script version.

## Examples

Here are some example commands:

### List Running Services:
```bash
sysopctl service list
```

### Start a Service:
```bash
sysopctl service start com.apple.sshd
```

### Stop a Service:
```bash
sysopctl service stop com.apple.sshd
```

### Check Disk Usage:
```bash
sysopctl disk usage
```
### Monitor Processes:
```bash
sysopctl process monitor
```
### Analyze Logs:
```bash
sysopctl logs analyze
```
### Backup Files:
```bash
sysopctl backup ~/Documents
```
