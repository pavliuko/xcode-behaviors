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

Opens the entire Xcode project/workspace in Cursor and navigates to the currently active file at the exact caret position (line and column). 

**Features:**
- **Smart file detection**: Uses Xcode's window title to identify the currently active file
- **Precise caret positioning**: Maintains exact line and column position from Xcode
- **Automatic project detection**: Finds project root by locating `.xcodeproj` or `.xcworkspace` files
- **Comprehensive error handling**: Provides clear feedback for common issues
- **No delays needed**: Single command execution for optimal performance

**Requirements:** Cursor command line tools must be installed (`cursor` command available in PATH).

## Troubleshooting

### General Issues
- **Script not running**: Check execute permissions (`chmod +x script.sh`)
- **Path issues**: Use absolute paths in Xcode Behaviors
- **Shortcut conflicts**: Use `Cmd + Shift + [Letter]` combinations

### Cursor-Specific Issues
- **Cursor not opening**: Install Cursor command line tools by opening Cursor and running "Shell Command: Install 'cursor' command in PATH" from Command Palette (`Cmd+Shift+P`)
- **Wrong caret position**: Script uses Xcode's exact caret position (line and column); ensure the file is saved and caret is positioned correctly
- **File not found**: Ensure the file is open and active in Xcode's main window
- **"Edited" document error**: Save unsaved changes in Xcode before running the script

### Xcode Behavior Issues
If the script works in Terminal but not from Xcode Behaviors:

1. **Check Console.app**: Open Console.app and search for "open-in-cursor" to see debug output
2. **Verify script path**: Ensure you're using the absolute path in Xcode Behaviors: `/Users/[username]/Code/pavliuko/xcode-behaviors/open-in-cursor.sh`
3. **AppleScript permissions**: Grant Terminal/Xcode permission to control other applications in System Settings → Privacy & Security → Automation
4. **Test manually**: Run `./open-in-cursor.sh` from Terminal first to verify it works
5. **Common error messages**:
   - "Please save the current document before running this script" - Save unsaved files in Xcode
   - "No matching document found" - Ensure the file is open in Xcode
   - "No Xcode window found" - Make sure Xcode is active and has a window open

## Setup Instructions

### For open-in-cursor.sh:
1. **Install Cursor CLI**: Open Cursor → `Cmd+Shift+P` → "Shell Command: Install 'cursor' command in PATH"
2. **Set up Xcode Behavior**: 
   - Xcode → Settings → Behaviors → +
   - Name: "Open in Cursor"
   - Script path: `/Users/[your-username]/Code/pavliuko/xcode-behaviors/open-in-cursor.sh`
   - Assign keyboard shortcut (e.g., `Cmd+Shift+C`)
3. **Test**: Open a file in Xcode, position caret, and use your shortcut
