#!/usr/bin/env bash
set -euo pipefail

declare -r CURRENT_DIR=$(dirname -- "$(readlink -f -- "$0")")

## Load all the modules
source "${CURRENT_DIR}/lib/common.sh"

for module in "${CURRENT_DIR}/lib"/*.sh; do
    if [[ -f "$module" && "$module" != *"common.sh" ]]; then
        source "$module"
    fi
done


main() {
    parse_args "$@"
}


trap cleanup INT TERM
main "$@"