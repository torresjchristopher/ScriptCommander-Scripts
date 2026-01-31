import os
def bulk_rename(prefix):
    for f in os.listdir('.'):
        if os.path.isfile(f) and not f.endswith('.py'):
            os.rename(f, f"{prefix}_{f}")
    print("Done.")
if __name__ == "__main__":
    pre = input("Enter prefix: ")
    bulk_rename(pre)
    input("Press Enter to exit")
