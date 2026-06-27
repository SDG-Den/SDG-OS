#!/bin/bash
#===============================================================================
# Unit tests: Zone module event processing logic
#===============================================================================

PASS=0
FAIL=0

# Simulated zone check logic (same as wayshell.sh)
check_zone() {
    local x="$1" y="$2" x1="$3" y1="$4" x2="$5" y2="$6"
    (( x >= x1 && x <= x2 && y >= y1 && y <= y2 ))
}

test_within_zone() {
    check_zone 5 5 0 0 30 1080 && echo "PASS: within zone" && return 0
    echo "FAIL: within zone"
    return 1
}

test_outside_zone() {
    check_zone 50 50 0 0 30 1080 && echo "FAIL: outside zone" && return 1
    echo "PASS: outside zone"
    return 0
}

test_boundary_top_left() {
    check_zone 0 0 0 0 30 1080 && echo "PASS: boundary top-left" && return 0
    echo "FAIL: boundary top-left"
    return 1
}

test_boundary_bottom_right() {
    check_zone 30 1080 0 0 30 1080 && echo "PASS: boundary bottom-right" && return 0
    echo "FAIL: boundary bottom-right"
    return 1
}

test_multiple_zones() {
    # Only left zone should match
    local in_left=false in_right=false
    check_zone 5 500 0 0 30 1080 && in_left=true
    check_zone 5 500 1890 0 1920 1080 && in_right=true
    $in_left && ! $in_right && echo "PASS: multiple zones" && return 0
    echo "FAIL: multiple zones"
    return 1
}

run_test() {
    local test_name="$1"
    if "$test_name"; then
        ((PASS++))
    else
        ((FAIL++))
    fi
}

run_test test_within_zone
run_test test_outside_zone
run_test test_boundary_top_left
run_test test_boundary_bottom_right
run_test test_multiple_zones

echo "=== Results: $PASS passed, $FAIL failed ==="
exit $FAIL
