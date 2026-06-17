#!/usr/bin/env bash
set -euo pipefail
# Render build helper: upgrade pip first, then install pinned requirements.
python3 -m pip install --upgrade pip setuptools wheel
python3 -m pip install --no-cache-dir -r requirements.txt
