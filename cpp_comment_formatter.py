import sys

def wrap(lines):
    wrapped = ["/*", "*"*76 + "\n"]

    #get longest line
    longest_line = 0
    for line in lines:
        if len(line.strip()) > longest_line:
            longest_line = len(line.strip())
    
    main_indent = ((80 - longest_line) // 2) - 1

    for line in lines:
        padding = (80 - len(line.strip()))
        wrapped.append("*" + (" " * main_indent) + line.strip() + \
                        " " * (((padding) - 4) - main_indent) + "*\n")
        wrapped.append("*" * 77 + "/\n")
        return "".join(wrapped)

if __name__ == "__main__":
    input_lines = sys.stdin.read().splitlines()
    output = wrap(input_lines)
    print(output)
