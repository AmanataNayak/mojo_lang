struct MyPair:
    var first: Int
    var second: Int

    fn __init__(out self, first: Int, second: Int):
        self.first = first
        self.second = second

    fn dump(self):
        print(self.first, self.second)

