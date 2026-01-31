import requests
def get_public_ip():
    try:
        print(f"Public IP: {requests.get('https://api.ipify.org').text}")
    except:
        print("Failed.")
if __name__ == "__main__":
    get_public_ip()
    input("Press Enter")
