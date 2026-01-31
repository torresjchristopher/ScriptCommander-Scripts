import ctypes

def clear_clipboard():
    print("--- Secure Clipboard Clear ---")
    if ctypes.windll.user32.OpenClipboard(None):
        ctypes.windll.user32.EmptyClipboard()
        ctypes.windll.user32.CloseClipboard()
        print("Clipboard cleared successfully.")
    else:
        print("Failed to open clipboard.")

if __name__ == "__main__":
    clear_clipboard()
    input("\nPress Enter to exit")

