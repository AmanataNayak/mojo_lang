# Ownership summary
# Every value has only one owner at a time.
# When the lifetime of the owner ends, mojo destroy the value.
# If there are existing refrences to a value, mojo extends the lifetime of the owner.

# Variables and references
# A variable own its value. A struct own its fields.
# A refrence allow to access a value owned by another variable. A refrence can have either mutable or immutable access.

# Argument convention
# read: the function receives an immutable refrence.
# mut: The function receives a mutable refernce.
# owned: the function take ownership of a value. The callee might receive a newly-created value or a copy of an existing value.
# ref: the function gets a refrence with an parametic mutability.
# out: A special convention used for the self arguement in constructors and for named results.

# Borrowed arguemnts(read): its the default argument convention.
fn print_list(list: List[Int]):
    print(list.__str__())

# Mutable arguments(mut): the function receives a mutable reference.
fn mutate(mut l: List[Int]):
    l.append(5)

# Transfer arguments (owned and ^)
# the owned keyword does not guarantee that the recived value is the original value - it guarantees only that the function get unique onwernship of a value.
# The caller pass the arguemt with the ^ transfer sigil. which ends the life time of that variable and ownership is transferred into function.
# The caller does not use the ^ transfer sigil, Mojo copies the value. if the type isn't copyable, this is a complie time error.
# The caller passes in a newly-create "owned" value, no variable owns the value and it can be transferred directly to the calllee.

def take(owned s: String):
    s += "!"
    print(s)

# origins: compiler uses origin to track the lifetime of variables and validity the refrences.
# what variables "owns" this value?
# Can the value be mutated using this reference?

# Origin Types
# 1. ImmutableOrigin
# 2. MutableOrigin
struct ImmutableRef[origin: ImmutableOrigin]:
    pass

struct MutableRef[origin: MutableOrigin]:
    pass

struct ParametricRef[is_mutable: Bool, origin: Origin[is_mutable]]:
    pass

# Origin values
# 1. Static origin: StaticConstantOrigin representing immutable values that las for the duration of the program.
# 2. Derived origing: __origin_of() function return the origin associated with valeue passed in.
# 3. Inferred origin:  You can use inferred parameters to capture the origin of a value passed in to a function.
# 4. Wildcard Origin: The ImmutableAnyOrigin and MutableAnyOrigin aliases are special cases indicating refrence that might acces any live value.


# Working with refrence
def add_ref(ref a: Int, b: Int) -> Int:
    return a + b

# Origin explicitly
def take_str_ref[is_mutable: Bool, origin: Origin[is_mutable]](ref [origin] s: String):
    @parameter
    if is_mutable: 
        print("Mutable ", s)
    else:
        print("Immutable ", s)

# ref return value
# ref return value allow a function to return a mutable or immutable refrence to a value
struct NameList:
    var names: List[String]

    def __init__(out self, *names: String):
        self.names = List[String]()
        for name in names:
            self.names.append(name[])

    def __getitem__(ref self, index: Int) -> ref [self.names] String:
        if (index >=0 and index < len(self.names)):
            return self.names[index]
        else:
            raise Error("Index out of bounds")

def pass_refs(s1: String, owned s2: String):
    take_str_ref(s1)
    take_str_ref(s2)

def main():
    var values = List(1, 2, 3, 4)
    mutate(values)
    print_list(values)
    
    # Np variable owns the value, so we can pass it directly to the function.
    take(String("Hello"))
    
    # copy the value
    var message = String("Hello")
    take(message) # hello!
    print(message) # hello 

    # Move the value 
    var message2 = String("Hi")
    take(message2^)
    # print(message2) # error: message2 is no longer valid

    # ref 
    pass_refs("Hello", "Goodbye")
    list = NameList("Thor", "Athena", "Dana", "Vrinda")
    print(list[2])
    list[2] += "?"
    print(list[2])