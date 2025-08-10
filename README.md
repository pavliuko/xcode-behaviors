# xcode-behaviors

Custom Xcode behaviors and shell scripts for iOS/macOS development productivity.

## Quick Setup

1. Clone this repository
2. Make scripts executable: `chmod +x *.sh`
3. In Xcode: **Settings... → Behaviors → +** 
4. Configure behavior with script path and keyboard shortcut

## Available Behaviors

### Open Derived Data Folder
**Script**: `open-derived-data.sh`  

Opens the folder containing build products, indexes, and simulator data.

### Open Project in Cursor
**External Repository**: [cursor-behavior-for-xcode](https://github.com/pavliuko/cursor-behavior-for-xcode)

Opens the currently active file from Xcode in Cursor at the exact caret position (line and column). This functionality has been moved to its own dedicated repository for better maintenance and distribution.

## Troubleshooting

### General Issues
- **Script not running**: Check execute permissions (`chmod +x script.sh`)
- **Path issues**: Use absolute paths in Xcode Behaviors
- **Shortcut conflicts**: Use `Cmd + Shift + [Letter]` combinations

### External Behavior Issues
- **Cursor behavior**: For issues with the Cursor integration, see the [cursor-behavior-for-xcode repository](https://github.com/pavliuko/cursor-behavior-for-xcode)

### Xcode Behavior Issues
If behaviors work in Terminal but not from Xcode:

1. **Verify script path**: Ensure you're using the absolute path in Xcode Behaviors
2. **Check execute permissions**: Run `chmod +x script.sh` to make scripts executable
3. **AppleScript permissions**: Grant Terminal/Xcode permission to control other applications in System Settings → Privacy & Security → Automation
4. **Test manually**: Run scripts from Terminal first to verify they work
