import os
import sys
import requests
from datetime import datetime

def daily_briefing():
    print("--- Daily Briefing ---")
    print(f"Date: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    
    try:
        ip = requests.get('https://api.ipify.org', timeout=5).text
        print(f"Public IP: {ip}")
    except:
        print("Could not fetch IP.")
    
    print("\nSystem Checklist:")
    print("- Updates Checked: NO")
    print("- Backup Status: PENDING")
    
    input("\nPress Enter to exit")

if __name__ == "__main__":
    daily_briefing()
