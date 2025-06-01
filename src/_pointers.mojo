# pointers
# Pointer is an indirect reference to one or more values stored in memory.
# the pointer is a value that holds an address to memeory, and provides APIs to store and retrieve values to that memeor.

# Pointer terminology
# Safe pointers: are designed to prevent memeory errors.
# Nullable pointers: can point to an invalid memeory location.
# Smart pointers: owne their pointees, which means that the value they point to may be deallocated when the pointer iteself destroyed.
# Memeory allocations: some pointer types can allocate memory store their pointess, which other pointers can point to pre-existing values.
# Unintialized memeory: Refers to memeory location that haven't intialized with a value, which may therfore contain random data.
# Copyable types: can be copied implicitly.


# Pointer Types
# Pointer: is a safe pointer that points to a single value that it doesn't own.
# OwnedPointer: is a smart pointer that points to a single value, an maintains exclusive ownership of that value.
# ArcPointer: is a reference counter smart pointer that points to an owned value with ownership potentially shared with other instance of ArcPointer.
# UnsafePointer: points to one or more consecutive memeory locations, and can refer to unintialized memory.

# Mapping of terminology with Types
# Safe: Pointer, OwnedPointer, ArcPointer
# Allocated memeory: OwnedPointer(implicitly), ArcPointer(implicitly), UnsafePointer(explicitly)
# Owns Pointees: OwnedPointer, ArchPointer
# Copyable: Pointer, ArcPointer
# Nullable: UnsafePointer
# can point to unintialized memeory: UnsafePointer
# can point to multiple valus: UnsafePointer.

from memory import OwnedPointer, ArcPointer, UnsafePointer
from collections import Dict


struct SharedDict:
    var attributes: ArcPointer[Dict[String, String]]

    fn __init__(out self):
        attributes_dict = Dict[String, String]()
        self.attributes = ArcPointer(attributes_dict)

    fn __copyinit__(out self, other: Self):
        self.attributes = other.attributes

    fn __setitem__(mut self, key: String, value: String):
        self.attributes[][key] = value

    fn __getitem__(self, key: String) -> String:
        return self.attributes[].get(key, default = "")


def main():
    var x: Int = 10
    var ptr = Pointer(to=x)
    var o_ptr = OwnedPointer(x)

    var attributes_dict = Dict[String, String]()
    attributes = ArcPointer(attributes_dict)

    thing1 = SharedDict()
    thing2 = thing1
    thing1["Flip"] = "Flop"
    print(thing2["Flip"])

    # Unsafe pointer
    var u_ptr: UnsafePointer[Int] # Unintialized 
    u_ptr = UnsafePointer[Int]() #  Null
    u_ptr = UnsafePointer[Int].alloc(1) # allocated unintialized memory

    var value: Int
    u_ptr.init_pointee_copy(10) # intilaized memory
    u_ptr.init_pointee_move(20) # intialized memory
    u_ptr = UnsafePointer(to=30) # intialized memory

    old_value = u_ptr[]    
    u_ptr[] = 50
    print(u_ptr[], old_value)

    # u_ptr.free()

    # stroing multiple values
    float_ptr = UnsafePointer[Float64].alloc(6)
    for offset in range(6):
        (float_ptr+offset).init_pointee_copy(0.0)

    float_ptr[2] = 3.0
    for offset in range(6):
        print(float_ptr[offset], end=", ")
