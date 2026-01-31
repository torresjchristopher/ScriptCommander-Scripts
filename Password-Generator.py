import random
import string
import sys

def generate_password(length=16):
    chars = string.ascii_letters + string.digits + "!@#$%^&*"
    return ''.join(random.choice(chars) for _ in range(length))

if __name__ == "__main__":
    pwd = generate_password()
    print("--- Secure Password Generator ---")
    print(f"Generated Password: {pwd}")
    input("\nPress Enter to exit")
