"""Python serial number generator."""

from tracemalloc import start


class SerialGenerator:
    """Machine to create unique incrementing serial numbers.
    
    >>> serial = SerialGenerator(start=100)

    >>> serial.generate()
    100

    >>> serial.generate()
    101

    >>> serial.generate()
    102

    >>> serial.reset()

    >>> serial.generate()
    100
    """

    def __init__(self, start):
        "Create unique incrementing serial number from the number, start."
        self.start = start
        self.num = 0

    def __repr__(self):
        return f"(SerialGenerator start={self.start} next={self.start + 1})"

    def generate(self):
        "Generate a number starting from self.start"
        if self.num == 0:
            self.num = self.start
            return self.num
        else:
            self.num += 1
            return self.num
    
    def reset(self):
        "reset the number to be the original start number."
        self.num = self.start
        self.num = 0



