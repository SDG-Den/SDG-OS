#!/bin/bash
#===============================================================================
# Unit tests: Layout module event processing logic
#===============================================================================

PASS=0
FAIL=0

# Simulated layout module matching logic (same as wayshell.sh)
check_layout() {
    local event_layout="$1" event_state="$2" expected_layout="$3"
    [[ "$event_layout" == "$expected_layout" ]] && echo "$event_state"
}

test_active_match() {
    local result
    result=$(check_layout "M" "active" "M")
    [[ "$result" == "active" ]] || { echo "FAIL: active match"; return 1; }
    echo "PASS: active match"
    return 0
}

test_inactive_match() {
    local result
    result=$(check_layout "M" "inactive" "M")
    [[ "$result" == "inactive" ]] || { echo "FAIL: inactive match"; return 1; }
    echo "PASS: inactive match"
    return 0
}

test_no_match() {
    local result
    result=$(check_layout "DW" "active" "M")
    [[ -z "$result" ]] || { echo "FAIL: no match should be empty"; return 1; }
    echo "PASS: no match when layout differs"
    return 0
}

test_multiple_layouts() {
    local matched=""
    for pair in "M:active" "DW:inactive"; do
        local layout="${pair%%:*}" state="${pair##*:}"
        local result
        result=$(check_layout "$layout" "$state" "M")
        [[ -n "$result" ]] && matched="$matched $layout=$result"
    done
    [[ "$matched" == " M=active" ]] || { echo "FAIL: multiple layouts (got: $matched)"; return 1; }
    echo "PASS: multiple layouts only match correct one"
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

run_test test_active_match
run_test test_inactive_match
run_test test_no_match
run_test test_multiple_layouts

echo "=== Results: $PASS passed, $FAIL failed ==="
exit $FAIL
