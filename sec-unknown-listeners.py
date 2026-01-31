import psutil
import socket

def check_listeners():
    print("--- Network Listener Audit ---")
    print(f"{ 'Process':<25} {'Port':<10} {'Status':<15}")
    print("-" * 50)
    for conn in psutil.net_connections(kind='inet'):
        if conn.status == 'LISTEN':
            try:
                proc = psutil.Process(conn.pid)
                print(f"{proc.name():<25} {conn.laddr.port:<10} {conn.status:<15}")
            except:
                print(f"{ 'Unknown':<25} {conn.laddr.port:<10} {conn.status:<15}")

if __name__ == "__main__":
    check_listeners()
    input("\nPress Enter to exit")
