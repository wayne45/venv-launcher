# venv-launcher

A single-command wrapper that runs any Python command inside an auto-managed virtual environment.

## Quick Start

```bash
mkdir my-project && cd my-project
curl -sL https://raw.githubusercontent.com/wayne45/venv-launcher/main/setup.sh | bash
```

Edit `requirements.txt`, then start using it.

## Usage

```bash
./venv.sh <command> [args...]
```

The first run creates `.venv/`, upgrades pip, and installs `requirements.txt`. Subsequent runs skip setup and execute immediately.

## Use a specific Python version

```bash
PYTHON=/opt/homebrew/opt/python@3.12/bin/python3.12 ./venv.sh python --version
```

Use the full path to avoid picking up non-Homebrew Pythons that may be on your `PATH`. Find yours with `brew --prefix python@3.12`.

Set `PYTHON` on the first run (when the venv is created). After that the venv locks to that version — no prefix needed.

## Examples

```bash
# Install a package
./venv.sh pip install -U heretic-llm

# Run a CLI tool installed in the venv
./venv.sh heretic Qwen/Qwen3-4B-Instruct-2507

# Run a Python script
./venv.sh python my_script.py
```

## Command log

Every command run via `./venv.sh` is recorded in `venv.log` with a timestamp:

```
2026-07-01 14:30:00 python my_script.py
2026-07-01 14:31:00 pip install requests
```

## Reset

```bash
./venv.sh clean
```

This removes `.venv/`. The next run will recreate it fresh.

## Pre-install dependencies

Add packages to `requirements.txt` — they'll be installed automatically on first setup.
