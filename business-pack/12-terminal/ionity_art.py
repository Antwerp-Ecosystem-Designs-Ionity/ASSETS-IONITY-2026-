#!/usr/bin/env python3
"""AEDI terminal-art player. Policy 986 AED | (c) 2018-2026 Ionity (Pty) Ltd."""
import os,sys,shutil,glob
D=os.path.join(os.path.dirname(os.path.abspath(__file__)),"..")
def pick():
    c=shutil.get_terminal_size((100,30)).columns
    for n in (160,100,80,60,40):
        if c>=n: return n
    return 40
def show(p):
    sys.stdout.write(open(p,encoding="utf-8").read())
def main():
    a=sys.argv[1:] or ["motd"]
    if a[0]=="motd": show(f"{D}/banners/ionity-motd.ans")
    elif a[0]=="banner":
        show(f"{D}/banners/ionity-global-banner.ans"); show(f"{D}/banners/signature-block.ans")
    elif a[0]=="list":
        print("\n".join(sorted({os.path.basename(f).rsplit("-",1)[0] for f in glob.glob(f"{D}/logos/*.ans")})))
    elif a[0]=="logo":
        n=a[1] if len(a)>1 else "ionity-global-logo-primary"
        f=f"{D}/logos/{n}-{pick()}col.ans"
        if not os.path.exists(f):
            g=sorted(glob.glob(f"{D}/logos/{n}-*.ans"))
            if not g: print("no art for",n); return 1
            f=g[0]
        show(f)
    else: print("usage: ionity_art.py [motd|banner|logo NAME|list]")
if __name__=="__main__": sys.exit(main() or 0)
