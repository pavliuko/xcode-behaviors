#!/bin/bash

# Script to open the currently active Xcode file in VSCode at the same cursor position
# Usage: Configure as an Xcode Behavior with a keyboard shortcut

# Check if VSCode is installed
if ! command -v code &> /dev/null; then
    echo "Error: VSCode command line tools not found. Install VSCode and add 'code' to your PATH."
    exit 1
fi

# Get file path using AppleScript (filter for source files)
file_path=$(osascript -e '
tell application "Xcode"
    try
        set allDocs to documents
        repeat with doc in allDocs
            try
                set docPath to path of doc
                -- Check if this is a source file (not project file)
                if docPath contains "/" and not (docPath ends with ".xcodeproj" or docPath ends with ".xcworkspace" or docPath ends with ".playground") then
                    -- Check for common source file extensions
                    if docPath ends with ".swift" or docPath ends with ".m" or docPath ends with ".mm" or docPath ends with ".h" or docPath ends with ".c" or docPath ends with ".cpp" or docPath ends with ".cc" or docPath ends with ".cxx" or docPath ends with ".py" or docPath ends with ".js" or docPath ends with ".ts" or docPath ends with ".java" or docPath ends with ".kt" or docPath ends with ".go" or docPath ends with ".rs" or docPath ends with ".rb" or docPath ends with ".php" or docPath ends with ".html" or docPath ends with ".css" or docPath ends with ".json" or docPath ends with ".xml" or docPath ends with ".txt" or docPath ends with ".md" then
                        return docPath
                    end if
                end if
            end try
        end repeat
        error "No source file found"
    on error errMsg
        error errMsg
    end try
end tell
' 2>/dev/null)

# Get line number using AppleScript (filter for same source file)
line_number=$(osascript -e '
tell application "Xcode"
    try
        set allDocs to documents
        repeat with doc in allDocs
            try
                set docPath to path of doc
                -- Check if this is a source file (same logic as above)
                if docPath contains "/" and not (docPath ends with ".xcodeproj" or docPath ends with ".xcworkspace" or docPath ends with ".playground") then
                    if docPath ends with ".swift" or docPath ends with ".m" or docPath ends with ".mm" or docPath ends with ".h" or docPath ends with ".c" or docPath ends with ".cpp" or docPath ends with ".cc" or docPath ends with ".cxx" or docPath ends with ".py" or docPath ends with ".js" or docPath ends with ".ts" or docPath ends with ".java" or docPath ends with ".kt" or docPath ends with ".go" or docPath ends with ".rs" or docPath ends with ".rb" or docPath ends with ".php" or docPath ends with ".html" or docPath ends with ".css" or docPath ends with ".json" or docPath ends with ".xml" or docPath ends with ".txt" or docPath ends with ".md" then
                        tell doc
                            set textSelection to selection
                            set selectedRange to selected character range of textSelection
                            set startLocation to location of selectedRange
                            
                            set docText to contents as string
                            set textBeforeCursor to text 1 thru startLocation of docText
                            set lineNumber to (count of paragraphs of textBeforeCursor)
                            return lineNumber
                        end tell
                    end if
                end if
            end try
        end repeat
        return 1
    on error
        return 1
    end try
end tell
' 2>/dev/null)

# Check if we got valid data
if [ -z "$file_path" ] || [ -z "$line_number" ]; then
    echo "Error: Could not get current file information from Xcode"
    exit 1
fi

# Check if file exists
if [ ! -f "$file_path" ]; then
    echo "Error: File does not exist: $file_path"
    exit 1
fi

# Find the project root directory
project_root=""
current_dir=$(dirname "$file_path")

# Look for .xcodeproj or .xcworkspace going up the directory tree
while [ "$current_dir" != "/" ]; do
    if [ -n "$(find "$current_dir" -maxdepth 1 -name "*.xcodeproj" -o -name "*.xcworkspace" 2>/dev/null)" ]; then
        project_root="$current_dir"
        break
    fi
    current_dir=$(dirname "$current_dir")
done

# If no project root found, use the file's directory
if [ -z "$project_root" ]; then
    project_root=$(dirname "$file_path")
    echo "Warning: No Xcode project found, using file directory: $project_root"
else
    echo "Found project root: $project_root"
fi

echo "Opening project in VSCode and navigating to $file_path at line $line_number..."

# Open the project directory in VSCode, then navigate to the specific file and line
code "$project_root"
sleep 0.5  # Give VSCode a moment to open the project
code --goto "$file_path:$line_number"

echo "Done!"
