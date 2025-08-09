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

- **Script not running**: Check execute permissions (`chmod +x script.sh`)
- **Path issues**: Use absolute paths in Xcode Behaviors
- **Shortcut conflicts**: Use `Cmd + Shift + [Letter]` combinations
- **Cursor not opening**: Install Cursor command line tools by opening Cursor and running "Shell Command: Install 'cursor' command in PATH" from Command Palette (`Cmd+Shift+P`)
- **Wrong line position**: Script uses Xcode's cursor position; ensure cursor is placed where you want to jump to in Cursor
