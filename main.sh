#!/usr/bin/env bash
set -euo pipefail
# shellcheck disable=SC1090,SC1091

## Works on Linux/macOS
declare -r CURRENT_DIR
CURRENT_DIR=$(dirname -- "$(readlink -f -- "$0")")

## Load all the modules
source "${CURRENT_DIR}/lib/common.sh"

for module in "${CURRENT_DIR}/lib"/*.sh; do
    if [[ -f "$module" && "$module" != *"common.sh" ]]; then
        # shellcheck source=/dev/null
        source "$module"
    fi
done


main() {
    parse_args "$@"
}


trap 'cleanup 130' INT TERM

main "$@"