import hashlib
import os

def audit_hosts():
    print("--- Hosts File Audit ---")
    hosts_path = r"C:\Windows\System32\drivers\etc\hosts"
    try:
        with open(hosts_path, 'r') as f:
            lines = [l.strip() for l in f.readlines() if l.strip() and not l.startswith('#')]
        if lines:
            print("WARNING: Custom entries found in hosts file:")
            for l in lines: print(f"  {l}")
        else:
            print("Hosts file is clean (only comments).")
    except Exception as e:
        print(f"Error reading hosts file: {e}")

if __name__ == "__main__":
    audit_hosts()
    input("\nPress Enter to exit")
