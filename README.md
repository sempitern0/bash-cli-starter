# bash-cli-starter

A production-ready, modular template for building robust Bash CLI applications and tools. It comes pre-configured with ShellCheck linting, cross-platform CRLF-to-LF normalization, automated Makefile tasks, and Git pre-commit hooks.

## 🌟 Key Features

- **Modular Architecture**: Built-in separation of concerns (`cli.sh` entry point, `lib/` modules).
- **Automated Quality Checks**: Pre-configured `.shellcheckrc` tailored for library-based Bash projects.
- **Cross-Platform Compatibility**: Automatic line ending conversion (`CRLF` to `LF`) preventing Windows/WSL execution errors (`SC1017`).
- **Git Pre-Commit Hook**: Intercepts `git commit` to lint staged shell scripts automatically.
- **Makefile Automation**: Easy one-command setup for permissions, hook installations, and code linting.

## 📁 Repository Structure

```text
.
├── .gitattributes      # Forces LF line endings across all OS environments
├── .shellcheckrc       # ShellCheck rules tailored for modular scripts
├── Makefile            # Task automation runner
├── cli.sh              # Main CLI entry point script
├── lib/
│   ├── cli.sh          # Argument parsing and option handlers
│   └── common.sh       # Shared helper functions and system utilities
└── scripts/
    └── pre-commit      # Git pre-commit hook template
```

## 🚀 Getting Started

### Prerequisites

Ensure you have `git`, `make`, and `shellcheck` installed on your system.

- **macOS**: `brew install shellcheck`
- **Ubuntu/Debian**: `sudo apt-get install shellcheck`
- **Windows (PowerShell)**: `winget install koalaman.shellcheck`

### One-Command Setup

Run the setup target to make scripts executable, install the Git pre-commit hook, and verify linting:

```bash
make setup
```

## 🛠️ Usage & Makefile Commands

| Command                   | Description                                                             |
| :------------------------ | :---------------------------------------------------------------------- |
| `make setup`              | Full initial setup: grants permissions, installs hooks, and runs linter |
| `make lint`               | Fixes line endings and runs ShellCheck across all shell files           |
| `make install-hooks`      | Copies the pre-commit script to `.git/hooks/pre-commit`                 |
| `make chmod`              | Grants execution permissions (`+x`) to scripts and hooks                |
| `make install-shellcheck` | Attempts to auto-install ShellCheck using system package managers       |

## 🧪 Pre-commit Hook

Once installed, the pre-commit hook runs automatically whenever you execute `git commit`. It converts line endings to `LF` and verifies all staged `.sh` files with ShellCheck. If any linting errors occur, the commit is blocked until resolved.

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.
