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

## Troubleshooting

- **Script not running**: Check execute permissions (`chmod +x script.sh`)
- **Path issues**: Use absolute paths in Xcode Behaviors
- **Shortcut conflicts**: Use `Cmd + Shift + [Letter]` combinations
