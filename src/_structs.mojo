# A Mojo struct is a data structure that allows you to encapsulate fields and methods that operate on an abstraction, 
# such as a data type or an object. Fields are variables that hold data relevant to the struct, and methods are 
# functions inside a struct that generally act upon the field data.

# Struct definition
struct MyPair:
    var first: Int
    var second: Int

    # constructor
    fn __init__(out self, first: Int, second: Int):
        self.first = first
        self.second = second

    fn get_sum(self) -> Int:
        return self.first + self.second

    # static methods
    @staticmethod
    fn log_info(message: String):
        print("Info: ", message)

def main():
    var mine = MyPair(2, 4)
    print(mine.get_sum())
    MyPair.log_info("Done")