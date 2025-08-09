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
**Script**: `open-in-cursor.sh`  

Opens the entire Xcode project/workspace in Cursor and navigates to the currently active file at the same cursor position. Automatically detects the project root by finding `.xcodeproj` or `.xcworkspace` files. Requires Cursor command line tools to be installed (`cursor` command available in PATH).

## Troubleshooting

### General Issues
- **Script not running**: Check execute permissions (`chmod +x script.sh`)
- **Path issues**: Use absolute paths in Xcode Behaviors
- **Shortcut conflicts**: Use `Cmd + Shift + [Letter]` combinations

### Cursor-Specific Issues
- **Cursor not opening**: Install Cursor command line tools by opening Cursor and running "Shell Command: Install 'cursor' command in PATH" from Command Palette (`Cmd+Shift+P`)
- **Wrong line position**: Script uses Xcode's cursor position; ensure cursor is placed where you want to jump to in Cursor

### Xcode Behavior Issues
If the script works in Terminal but not from Xcode Behaviors:

1. **Check Console.app**: Open Console.app and search for "open-in-cursor" to see debug output
2. **Verify script path**: Ensure you're using the absolute path in Xcode Behaviors: `/Users/[username]/Code/pavliuko/xcode-behaviors/open-in-cursor.sh`
3. **AppleScript permissions**: Grant Terminal/Xcode permission to control other applications in System Settings → Privacy & Security → Automation
4. **Test manually**: Run `./open-in-cursor.sh` from Terminal first to verify it works
5. **Accessibility permissions**: Check if Xcode has Accessibility permissions in System Settings → Privacy & Security → Accessibility
