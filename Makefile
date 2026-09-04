.PHONY: help lint chmod setup

# Default target when running just 'make'
.DEFAULT_GOAL := help

# Find main script and all library modules
SCRIPTS := $(wildcard *.sh)

help: ## Show this help message
	@echo "Usage: make [target]"
	@echo ""
	@echo "Available targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'

chmod: ## Make main script executable (chmod +x)
	@chmod +x main.sh
	@echo "✓ Granted execution permissions to main.sh"

install-shellcheck: ## Install ShellCheck automatically if missing
	@if ! command -v shellcheck >/dev/null 2>&1; then \
		echo "shellcheck not found. Installing automatically..."; \
		if command -v brew >/dev/null 2>&1; then \
			brew install shellcheck; \
		elif command -v apt-get >/dev/null 2>&1; then \
			sudo apt-get update && sudo apt-get install -y shellcheck; \
		elif command -v dnf >/dev/null 2>&1; then \
			sudo dnf install -y shellcheck; \
		elif command -v pacman >/dev/null 2>&1; then \
			sudo pacman -S --noconfirm shellcheck; \
		else \
			echo "✗ Package manager not recognized. Please install shellcheck manually."; \
			exit 1; \
		fi \
	fi

lint: install-shellcheck ## Run ShellCheck on all .sh scripts
	@echo "Fixing line endings (CRLF -> LF)..."
	@sed -i 's/\r$$//' .shellcheckrc $(SCRIPTS)
	@echo "Running ShellCheck..."
	@shellcheck $(SCRIPTS)
	@echo "✓ ShellCheck passed cleanly!"
	
setup: chmod lint ## Set permissions and run linter in one step