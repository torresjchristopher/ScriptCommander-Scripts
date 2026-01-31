import socket
def scan_ports(host):
    print(f"--- Scanning Common Ports on {host} ---")
    for port in [80, 443, 3306, 8080]:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(0.5)
        if s.connect_ex((host, port)) == 0:
            print(f"Port {port}: OPEN")
        s.close()
if __name__ == "__main__":
    scan_ports("127.0.0.1")
    input("\nPress Enter to exit")
