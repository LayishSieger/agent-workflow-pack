#!/usr/bin/env bash
# sync-from-upstreams.sh — refresh vendored skills from upstream main branches
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

echo "Fetching LayishSieger/agent-workflows..."
curl -sL "https://github.com/LayishSieger/agent-workflows/archive/refs/heads/main.tar.gz" | tar -xz -C "$TMP"
echo "Fetching mattpocock/skills..."
curl -sL "https://github.com/mattpocock/skills/archive/refs/heads/main.tar.gz" | tar -xz -C "$TMP"

AW="$TMP/agent-workflows-main/skills"
MP="$TMP/skills-main/skills"

# Layish
cp -a "$AW/init-workflows/." "$ROOT/skills/init-workflows/"
cp -a "$AW/loop-workflows/." "$ROOT/skills/loop-workflows/"
cp -a "$AW/host-workflows/." "$ROOT/skills/host-workflows/"

# Matt selected
for s in code-review diagnosing-bugs implement tdd to-spec to-tickets triage wayfinder domain-modeling; do
  mkdir -p "$ROOT/skills/$s"
  cp -a "$MP/engineering/$s/." "$ROOT/skills/$s/"
done
mkdir -p "$ROOT/skills/grill-me" "$ROOT/skills/grill-with-docs" "$ROOT/skills/grilling"
cp -a "$MP/productivity/grill-me/." "$ROOT/skills/grill-me/"
cp -a "$MP/engineering/grill-with-docs/." "$ROOT/skills/grill-with-docs/"
cp -a "$MP/productivity/grilling/." "$ROOT/skills/grilling/"

echo "Synced. Review git status and commit."
