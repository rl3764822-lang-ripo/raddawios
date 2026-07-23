# RaddawiOS Program in Python
# Console-based mini OS simulation

import sys

def raddawios_banner():
    print("=== Welcome to RaddawiOS ===")
    print("Type 'help' for commands, 'exit' to quit.")

def show_help():
    print("Available commands:")
    print("  help   - Show this help menu")
    print("  echo   - Repeat your input")
    print("  calc   - Simple calculator")
    print("  exit   - Quit RaddawiOS")

def echo_command():
    text = input("Enter text to echo: ")
    print("Echo:", text)

def calc_command():
    try:
        expr = input("Enter math expression (e.g., 2+3*4): ")
        result = eval(expr)
        print("Result:", result)
    except Exception as e:
        print("Error:", e)

def main():
    raddawios_banner()
    while True:
        cmd = input("RaddawiOS> ").strip().lower()
        if cmd == "help":
            show_help()
        elif cmd == "echo":
            echo_command()
        elif cmd == "calc":
            calc_command()
        elif cmd == "exit":
            print("Exiting RaddawiOS...")
            sys.exit(0)
        else:
            print("Unknown command. Type 'help'.")

if __name__ == "__main__":
    main()
