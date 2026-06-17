#!/usr/bin/env bash
set -euo pipefail
# Write Firebase service account JSON from env var to a temp file
if [ -n "${FIREBASE_SERVICE_ACCOUNT:-}" ]; then
  printf "%s" "$FIREBASE_SERVICE_ACCOUNT" > /tmp/firebase-credentials.json
  export GOOGLE_APPLICATION_CREDENTIALS=/tmp/firebase-credentials.json
fi

# Ensure entrypoint is executed from the repository root
cd "$(dirname "$0")"

# Start Gunicorn (replace app:app if your module/variable is different)
exec gunicorn app:app --bind 0.0.0.0:${PORT:-5000} --workers 2 --threads 4
