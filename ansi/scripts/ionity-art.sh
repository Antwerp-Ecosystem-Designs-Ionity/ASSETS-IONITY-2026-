#!/usr/bin/env bash
# AEDI terminal-art player. Policy 986 AED | (c) 2018-2026 Ionity (Pty) Ltd
# usage: ionity-art.sh [motd|banner|logo NAME|list]
D="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cols=$(tput cols 2>/dev/null || echo 100)
pick(){ for c in 160 100 80 60 40; do [ "$cols" -ge "$c" ] && { echo "$c"; return; }; done; echo 40; }
case "${1:-motd}" in
  motd)   cat "$D/banners/ionity-motd.ans";;
  banner) cat "$D/banners/ionity-global-banner.ans"; cat "$D/banners/signature-block.ans";;
  list)   ls "$D/logos" | sed 's/-[0-9]*col\.ans$//' | sort -u;;
  logo)   n="${2:-ionity-global-logo-primary}"; f="$D/logos/${n}-$(pick)col.ans"
          [ -f "$f" ] || f=$(ls "$D/logos/${n}-"*.ans 2>/dev/null | head -1)
          [ -f "$f" ] && cat "$f" || { echo "no art for $n"; exit 1; };;
  *) echo "usage: $0 [motd|banner|logo NAME|list]";;
esac
