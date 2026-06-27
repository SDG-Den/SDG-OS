#!/bin/bash
#===============================================================================
# Layout Module — Detect layout activation/deactivation events
#===============================================================================
# Description:
#   Subscribes to `mmsg watch all-tags` and emits JSON when any tag's layout
#   becomes active or inactive on any monitor.
#
# Output format (JSON lines):
#   {"layout":"M","state":"active","monitor":"DP-1","tag":1}
#   {"layout":"M","state":"inactive","monitor":"DP-1","tag":1}
#
# Dependencies:
#   - jq
#   - mmsg
#===============================================================================

declare -A ACTIVE_LAYOUTS

make_key() {
    echo "${1}:${2}:${3}"
}

process_tags_update() {
    local json="$1"
    local monitors monitor tag layout is_active key new_keys=""

    monitors=$(jq -c '.all_tags[]' <<< "$json" 2>/dev/null)

    while IFS= read -r entry; do
        [[ -z "$entry" ]] && continue
        monitor=$(jq -r '.monitor' <<< "$entry" 2>/dev/null)
        [[ -z "$monitor" ]] && continue

        while IFS= read -r tag_entry; do
            [[ -z "$tag_entry" ]] && continue
            tag=$(jq -r '.index' <<< "$tag_entry" 2>/dev/null)
            layout=$(jq -r '.layout' <<< "$tag_entry" 2>/dev/null)
            is_active=$(jq -r '.is_active' <<< "$tag_entry" 2>/dev/null)
            key=$(make_key "$monitor" "$tag" "$layout")
            new_keys="$new_keys $key"

            if [[ "$is_active" == "true" ]]; then
                if [[ -z "${ACTIVE_LAYOUTS[$key]}" ]]; then
                    echo "{\"layout\":\"$layout\",\"state\":\"active\",\"monitor\":\"$monitor\",\"tag\":$tag}"
                fi
                ACTIVE_LAYOUTS["$key"]="active"
            fi
        done < <(jq -c '.tags[]' <<< "$entry" 2>/dev/null)
    done <<< "$monitors"

    for key in "${!ACTIVE_LAYOUTS[@]}"; do
        if [[ ! " $new_keys " =~ $key ]]; then
            IFS=':' read -r monitor tag layout <<< "$key"
            echo "{\"layout\":\"$layout\",\"state\":\"inactive\",\"monitor\":\"$monitor\",\"tag\":$tag}"
            unset "ACTIVE_LAYOUTS[$key]"
        fi
    done
}

if ! command -v mmsg &>/dev/null || ! command -v jq &>/dev/null; then
    echo "layout.sh: mmsg and jq are required" >&2
    exit 1
fi

while read -r line; do
    process_tags_update "$line"
done < <(mmsg watch all-tags 2>/dev/null)
