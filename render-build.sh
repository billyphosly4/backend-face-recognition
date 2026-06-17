#!/usr/bin/env bash
set -euo pipefail
# Render build helper: upgrade pip and install requirements
python3 -m pip install --upgrade pip setuptools wheel
pip install -r requirements.txt
