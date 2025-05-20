# A function can have:
# Parameters: A function can optionally take one or more compile time parameter values used for metaprogramming.
# Arguments: A function can also optionally take one or more run time arguments.
# Return Value: A function can optionally return a value.
# Function body: Statements that are executed when you call the function.

def add(x: Int, y: Int) -> Int:
    return x + y

# Optional arguments
fn my_pow(base: Int, exp: Int = 2) -> Int:
    return base ** exp


# Variadic arguments
fn sum(*values: Int) -> Int:
    var sum: Int = 0
    for value in values:
        sum += value
    
    return sum

# Variadic Key word argument.
fn print_nicely(**kwargs: Int) raises:
    for key in kwargs.keys():
        print(key[], "=", kwargs[key[]])

# Positonal-Only and Keyword-only arguments
fn min(a: Int, b: Int, /) -> Int: # before / are positional only
    return a if a < b else b

fn kw_only_args(a1: Int, a2: Int, *, double: Bool) -> Int: # after star keyword only arguments
    var product = a1 * a2
    if double: 
        return product * 2
    else:
        return product

# Overloadd functions
fn sub(x: Int, y: Int) -> Int:
   return x - y

fn sub(x: Float16, y: Float16) -> Float16:
    return x - y

# Named results: Named function results allow a function to return a value that can't be moved or copied.

def get_name_tag(owned name: String, out name_tag: String):
    name_tag = name^

# Raising and non rasing function.

def raises_error():
    raise Error("There was an error")

# fn unhandled_error(): # this will give error because the error is not handled
#     raises_error()

# Explicitly handle the error
fn handle_error():
    try: 
        raises_error()
    except e:
        print("handled an error: ", e)

# Explicitly propagate the error
fn prpagate_error() raises:
    raises_error()

    
def main():
    x = add(5, 7)
    print(x)
    print(my_pow(3))
    print(sum(1, 2, 3, 4, 5))
    print_nicely(a=7, y=8)
    print(get_name_tag("Amanata"))

