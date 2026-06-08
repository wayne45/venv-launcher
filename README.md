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

## Examples

```bash
# Install a package
./venv.sh pip install -U heretic-llm

# Run a CLI tool installed in the venv
./venv.sh heretic Qwen/Qwen3-4B-Instruct-2507

# Run a Python script
./venv.sh python my_script.py
```

## Reset

```bash
./venv.sh clean
```

This removes `.venv/`. The next run will recreate it fresh.

## Pre-install dependencies

Add packages to `requirements.txt` — they'll be installed automatically on first setup.
