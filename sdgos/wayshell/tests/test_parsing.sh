#!/bin/bash
#===============================================================================
# Unit tests: Module parsing
#===============================================================================

PASS=0
FAIL=0

test_parse_zone_module() {
    local line="test_zone,notify-send on,notify-send off,zone,0,0,100,100"
    IFS=',' read -r name onexec offexec type args <<< "$line"
    [[ "$name" == "test_zone" ]] || { echo "FAIL: name"; return 1; }
    [[ "$onexec" == "notify-send on" ]] || { echo "FAIL: onexec"; return 1; }
    [[ "$offexec" == "notify-send off" ]] || { echo "FAIL: offexec"; return 1; }
    [[ "$type" == "zone" ]] || { echo "FAIL: type=$type"; return 1; }
    [[ "$args" == "0,0,100,100" ]] || { echo "FAIL: args=$args"; return 1; }
    echo "PASS: parse zone module"
    return 0
}

test_parse_layout_module() {
    local line="monocle_mod,echo on,echo off,layout,M"
    IFS=',' read -r name onexec offexec type args <<< "$line"
    [[ "$name" == "monocle_mod" ]] || { echo "FAIL: name"; return 1; }
    [[ "$type" == "layout" ]] || { echo "FAIL: type=$type"; return 1; }
    [[ "$args" == "M" ]] || { echo "FAIL: args=$args"; return 1; }
    echo "PASS: parse layout module"
    return 0
}

test_parse_focused_module() {
    local line="browser_focus,echo on,echo off,focused,firefox"
    IFS=',' read -r name onexec offexec type args <<< "$line"
    [[ "$name" == "browser_focus" ]] || { echo "FAIL: name"; return 1; }
    [[ "$type" == "focused" ]] || { echo "FAIL: type=$type"; return 1; }
    [[ "$args" == "firefox" ]] || { echo "FAIL: args=$args"; return 1; }
    echo "PASS: parse focused module"
    return 0
}

test_skip_comments() {
    local line="# this is a comment"
    local name
    name=$(echo "$line" | grep -oP '^[^#,]+' || echo "")
    [[ -z "$name" ]] || { echo "FAIL: comment not skipped"; return 1; }
    echo "PASS: skip comments"
    return 0
}

test_skip_empty() {
    local line=""
    [[ -z "$line" ]] || { echo "FAIL: empty not skipped"; return 1; }
    echo "PASS: skip empty lines"
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

run_test test_parse_zone_module
run_test test_parse_layout_module
run_test test_parse_focused_module
run_test test_skip_comments
run_test test_skip_empty

echo "=== Results: $PASS passed, $FAIL failed ==="
exit $FAIL
