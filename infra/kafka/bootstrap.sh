#!/usr/bin/env bash
set -euo pipefail

CONF="/opt/kafka/config/kraft/kafka.properties"
DATA="/var/lib/kafka/data"

echo "[kafka-init] Using CONF=${CONF} DATA=${DATA}"

if [[ -f "${DATA}/meta.properties" ]]; then
  echo "[kafka-init] Already formatted; nothing to do."
  exit 0
fi

echo "[kafka-init] Formatting storage..."
/opt/kafka/bin/kafka-storage.sh format \
  -t "$(/opt/kafka/bin/kafka-storage.sh random-uuid)" \
  -c "${CONF}"

echo "[kafka-init] Done."
