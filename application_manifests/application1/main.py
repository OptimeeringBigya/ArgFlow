import sys
import logging


def step_runner(input_value, operation):
    if operation == "+":
        _y = int(input_value) + 10
    elif operation == "*":
        _y = int(input_value) * 10

    elif operation == "-":
        _y = int(input_value) * 10
    elif operation == "/":
        _y = int(input_value) * 10
    else:
        _y = input_value
    return _y


if __name__ == "__main__":
    res = step_runner(sys.argv[1], sys.argv[2])
    print(res)
    logging.info(res)
