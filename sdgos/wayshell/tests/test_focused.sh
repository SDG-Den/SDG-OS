#!/bin/bash
#===============================================================================
# Unit tests: Focused module event processing logic
#===============================================================================

PASS=0
FAIL=0

# Simulated focused module matching logic (same as wayshell.sh)
check_focused() {
    local event_app="$1" event_state="$2" expected_app="$3"
    [[ "$event_app" == "$expected_app" ]] && echo "$event_state"
}

test_focused_match() {
    local result
    result=$(check_focused "firefox" "focused" "firefox")
    [[ "$result" == "focused" ]] || { echo "FAIL: focused match"; return 1; }
    echo "PASS: focused match"
    return 0
}

test_unfocused_match() {
    local result
    result=$(check_focused "firefox" "unfocused" "firefox")
    [[ "$result" == "unfocused" ]] || { echo "FAIL: unfocused match"; return 1; }
    echo "PASS: unfocused match"
    return 0
}

test_app_id_mismatch() {
    local result
    result=$(check_focused "firefox" "focused" "com.mitchellh.ghostty")
    [[ -z "$result" ]] || { echo "FAIL: mismatch should be empty"; return 1; }
    echo "PASS: no match when app_id differs"
    return 0
}

test_different_apps() {
    local firefox_result ghostty_result
    firefox_result=$(check_focused "firefox" "focused" "firefox")
    ghostty_result=$(check_focused "firefox" "focused" "ghostty")
    [[ -n "$firefox_result" && -z "$ghostty_result" ]] || { echo "FAIL: different apps"; return 1; }
    echo "PASS: different apps match correctly"
    return 0
}

run_test() {
    local test_name="$1"
    if "$test_name"; then
        ((PASS++))
    else
        ((FAIL++))
    fi
}

run_test test_focused_match
run_test test_unfocused_match
run_test test_app_id_mismatch
run_test test_different_apps

echo "=== Results: $PASS passed, $FAIL failed ==="
exit $FAIL
