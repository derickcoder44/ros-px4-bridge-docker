#!/bin/bash
# Start Micro XRCE-DDS Agent
set -e

LOG=${LOG:-$HOME/logs/microxrce_agent.log}
mkdir -p "$(dirname "$LOG")"

echo "Starting MicroXRCE-DDS Agent..."

nohup MicroXRCEAgent udp4 -p 8888 > "$LOG" 2>&1 &
PID=$!
echo $PID > $HOME/.microxrce_agent.pid

# Wait for agent to start
for i in $(seq 1 30); do
  if kill -0 "$PID" >/dev/null 2>&1 || pgrep -f MicroXRCEAgent >/dev/null; then
    echo "MicroXRCEAgent started successfully (PID: $PID)"
    echo "Log file: $LOG"
    exit 0
  fi
  sleep 1
done

echo "ERROR: MicroXRCEAgent failed to start" >&2
echo "Last 200 lines of log:" >&2
tail -n 200 "$LOG" >&2
exit 1
