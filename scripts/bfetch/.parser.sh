#!/bin/bash

resolve_color_name() {
    local color="$1"

    # If the color starts with #, assume it's a hex code and return it
    if [[ "$color" =~ ^#[0-9A-Fa-f]{6}$ ]]; then
        echo "$color"
    else
        # Treat the color as a variable name and resolve its value
        resolved_color=$(eval "echo \$$color")
        if [ -n "$resolved_color" ]; then
            echo "$resolved_color"
        else
            # If the variable doesn't exist or is empty, return the input as-is
            echo "$color"
        fi
    fi
}

# Function to display text in color
display() {
    local color="$1"
    local text="$2"

    # Convert hex color to RGB
    local r=$((16#${color:1:2}))
    local g=$((16#${color:3:2}))
    local b=$((16#${color:5:2}))

    # Return the text with the color
    echo -e "\e[38;2;${r};${g};${b}m${text}\e[0m"
}

# Function to get default values from the default module
get_default_value() {
    local field="$1"
    echo "$default_module" | jq -r --arg field "$field" '.[$field]'
}

# Function to handle the logic of checking fields (exists or blank)
resolve_field() {
    local module="$1"
    local field="$2"
    local default_value

    # Get the default value from the default module
    default_value=$(get_default_value "$field")

    # Extract the field value from the module
    field_value=$(echo "$module" | jq -r --arg field "$field" '.[$field] // empty')

    # If the field does not exist or is blank, use the default value
    if [ -z "$field_value" ] || [ "$field_value" == "null" ]; then
        echo "$default_value"
    else
        echo "$field_value"
    fi
}

parse_modules() {
    # Get the default module
    default_module=$(jq -c '.modules[] | select(.name == "default")' "$CONFIG")

    # Get all non-default modules
    modules=$(jq -c '.modules[] | select(.name != "default")' "$CONFIG")

    # Loop through each module
    echo "$modules" | while IFS= read -r module; do
        # Extract fields, using default values if fields are blank or missing
        name=$(echo "$module" | jq -r '.name')
        default_color=$(echo "$module" | jq -r '.["default-color"] // empty')
        default_color=${default_color:-$(get_default_value "default-color")}
        label=$(echo "$module" | jq -r '.label // empty')
        label_color=$(echo "$module" | jq -r '.["label-color"] // empty')
        label_color=${label_color:-$(get_default_value "label-color")}
        icon=$(echo "$module" | jq -r '.icon // empty')
        icon_color=$(echo "$module" | jq -r '.["icon-color"] // empty')
        icon_color=${icon_color:-$(get_default_value "icon-color")}
        text_color=$(echo "$module" | jq -r '.["text-color"] // empty')
        text_color=${text_color:-$(get_default_value "text-color")}
        enabled=$(echo "$module" | jq -r '.enabled')

        # Skip disabled modules
        if [ "$enabled" != "true" ]; then
            continue
        fi

        # Dynamically resolve the variable value from std.sh
        resolved_value=$(eval "echo \$$name") # Get the value of the variable

        # Skip if the variable is not set or empty
        # if [ -z "$resolved_value" ]; then
        #     echo "Warning: Variable '$name' is not set or empty. Skipping..."
        #     continue
        # fi

        # Resolve colors dynamically
        resolved_default_color=$(resolve_color_name "$default_color")
        resolved_text_color=$(resolve_color_name "$text_color")
        resolved_label_color=$(resolve_color_name "$label_color")
        resolved_icon_color=$(resolve_color_name "$icon_color")

        # Prepare the output string
        output=""

        # Add label with resolved label color
        if [ -n "$label" ] && [ "$label" != "false" ]; then
            label_output=$(display "$resolved_label_color" "$label ")
            output+="$label_output"
        fi

        # Add icon with resolved icon color
        if [ -n "$icon" ] && [ "$icon" != "false" ]; then
            icon_output=$(display "$resolved_icon_color" "$icon ")
            output+="$icon_output"
        fi

        # Add resolved variable value with resolved text color
        value_output=$(display "$resolved_text_color" "$resolved_value")
        output+="$value_output"

        # Display the full output
        echo -e "$output"
    done
}

resolve_to_ansi() {
    local color="$1"

    # Check if the color is a variable name
    resolved_color=$(eval "echo \$$color")

    if [[ "$resolved_color" =~ ^#[0-9A-Fa-f]{6}$ ]]; then
        # Convert hex color to RGB
        local r=$((16#${resolved_color:1:2}))
        local g=$((16#${resolved_color:3:2}))
        local b=$((16#${resolved_color:5:2}))

        # Return ANSI escape sequence
        echo -e "\033[38;2;${r};${g};${b}m"
    elif [[ "$color" =~ ^#[0-9A-Fa-f]{6}$ ]]; then
        # Directly convert the hex input if it's not a variable
        local r=$((16#${color:1:2}))
        local g=$((16#${color:3:2}))
        local b=$((16#${color:5:2}))

        # Return ANSI escape sequence
        echo -e "\033[38;2;${r};${g};${b}m"
    else
        # Return reset color if no match
        echo -e "\033[0m"
    fi
}

main() {
    # Extract settings from the JSON
    settings=$(jq -c '.settings[] | select(.name == "ascii-settings")' "$CONFIG")
    path=$(echo "$settings" | jq -r '.["ascii-path"]')
    enabled=$(echo "$settings" | jq -r '.["use-ascii"]')
    color_name=$(echo "$settings" | jq -r '.["color"]')

    # Resolve the color name to ANSI
    ansi_color=$(resolve_to_ansi "$color_name")

    # Check if ASCII layout is enabled
    if [[ "$enabled" == "true" ]]; then
        # Use AWK to process the ASCII file with resolved color
        awk -v path="$path" -v ansi_color="$ansi_color" '
        BEGIN {
            reset = "\033[0m"; # Reset color
        }
        {
            # Apply color to each line
            print ansi_color $0 reset;
        }
        ' "$path" | paste - <(parse_modules) | column -s $'\t' -t
    else
        # Fallback: Just call parse_modules
        parse_modules
    fi
}
