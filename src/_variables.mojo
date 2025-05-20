# Variables
# All variables ar mutable.
# For constants use alias

# Types
# Signed Integeres: Int
# Unsigned integers: UInt
# Floating poiint Number: Float16, Float32, Float64

# Literal
# Integer = 1760
# Hexadecimal = 0xaa
# Octal literal = 0o88
# Binary literal = 0b0111
# Floating-Point literl = 3.14, 1.2e9

# Collections Types
# List: a dynamically-sized array of items.
# Dict: an associative array of key value pairs.
# Set: an unorderd collections of unique items.
# Optional: represent a value that may or may not be present

from collections import List, Dict, Set, Optional

# Late initialization
fn my_function(x: Int):
    var z: Float32

    if x != 0:
        z = 1.0
    else:
        z = foo()
    print(z)

fn foo() -> Float32:
    return 3.14

def main():
    # Implicitly declard variables
    # name = String("Ama")
    # user_id = 0

    # Eplicitly declared variables
    var name = String("Ama")
    var user_id: Int

    # SIMD: Single Instruction Multiple Data. Support high performance numeric processing
    var vec1 = SIMD[DType.int8, 4](2, 3, 5, 7)
    var vec2 = SIMD[DType.int8, 4](1, 2, 3, 4)
    var product = vec1 * vec2
    print(product)

    # Numeric type conversion
    simd1 = SIMD[DType.float32, 4](2.2, 3.3, 4.4, 5.5)
    simd2 = SIMD[DType.int16, 4](-1, 2, -3, 4)
    simd3 = simd1 * simd2.cast[DType.float32]()
    print("simd3: ", simd3)
    simd4 = simd2 + SIMD[DType.int16, 4](simd1)  
    print("simd4:", simd4)

    # Strings
    var s: String = "Testing"
    s += " Mojo strings"
    print(s)

    # String Literals
    var s1 = "Example"
    print(s1)

    # Booleans
    var conditionA = False
    var conditionB: Bool
    conditionB = not conditionA
    print(conditionA, conditionB)

    # Tuples
    # tuples are immutable and can hold multiple types.
    var example_tuple = Tuple[Int, String](1, "Example")

    # Assign multiple variables at once
    x, y = example_tuple
    print(x, y)

    # Get individual values with an index
    s = example_tuple[1]
    print(s)

    # List
    var list = List(2, 3, 5)
    list.append(7)
    list.append(11)
    print("Popping last item from list: ", list.pop())
    for idx in range(len(list)):
        print(list[idx], end=", ")

    # Dict
    var d= Dict[String, Float32]()
    d["plasticity"] = 3.1
    d["elasticity"] = 1.3
    d["electricity"] = 9.7

    for item in d.items():
        print(item[].key, item[].value)

    # Set
    i_like = Set[String]("sushi", "ice cream", "tacos", "pho")
    you_like = Set[String]("burgers", "tacos", "salad", "ice cream")
    we_like = i_like.intersection(you_like)

    print("We both like: ")
    for item in we_like:
        print('-', item[])

    # Optional
    # two ways to intialize Optional with a value
    var opt1 = Optional(5)
    var opt2: Optional[Int] = 5

    # two ways to initialize an optional with no value
    var opt3 = Optional[Int]()
    var opt4: Optional[Int] = None

    var opt: Optional[String] = String('Testing')
    if opt:
        var value_ref = opt.value()
        print(value_ref)

    var custom_greeting: Optional[String] = None
    print(custom_greeting.or_else("Hello"))

    custom_greeting = String('Hi')
    print(custom_greeting.or_else("Hello"))