#!/bin/bash
#===============================================================================
# Test runner — runs all Wayshell tests
#===============================================================================

DIR="$(cd "$(dirname "$0")" && pwd)"
ALL_PASS=0
ALL_FAIL=0

for test_script in "$DIR"/test_*.sh; do
    [[ "$(basename "$test_script")" == "run_all.sh" ]] && continue
    echo ""
    echo "=========================================="
    echo " Running: $(basename "$test_script")"
    echo "=========================================="
    if bash "$test_script"; then
        echo "SUITE PASSED"
    else
        echo "SUITE FAILED"
        ((ALL_FAIL++))
    fi
done

echo ""
echo "=========================================="
echo " Summary: $ALL_PASS suites passed, $ALL_FAIL suites failed"
echo "=========================================="
exit $ALL_FAIL
