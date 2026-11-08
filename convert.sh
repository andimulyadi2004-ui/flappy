#!/usr/bin/env bash
cd "$(dirname "$0")/assets"
for f in *.svg; do
  o="${f%.svg}.png"
  if ffmpeg -y -loglevel error -i "$f" "$o" 2>/dev/null; then echo "ffmpeg OK $o"
  elif command -v rsvg-convert >/dev/null; then rsvg-convert "$f" -o "$o" && echo "rsvg OK $o"
  else echo "SKIP $f (pakai SVG langsung)"; fi
done
