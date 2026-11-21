#!/bin/bash
if ! pgrep -f "node server.js" > /dev/null; then
  node /app/applet/server.js > /tmp/node.log 2>&1 &
fi
if ! pgrep -f "cloudflared" > /dev/null; then
  /tmp/cloudflared tunnel --protocol http2 --url http://localhost:3000 > /tmp/tunnel.log 2>&1 &
fi
