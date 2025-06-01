# Traits is a set of requirement that a type must implement.
trait Quackable:
    fn quack(self):
        ...

# static method
trait HasStaticMethod:
    @staticmethod
    fn do_stuff():
        ...

fn fun_with_traits[type: HasStaticMethod]():
    type.do_stuff()

#trait composition
trait Flyable:
    fn fly(self):
        ...

fn quack_and_go[type: Quackable & Flyable](quacker: type):
    quacker.quack()
    quacker.fly()

@value 
struct FlyingDuck(Quackable & Flyable):
    fn quack(self):
        print("Quack")

    fn fly(self):
        print("whoosh!")

@value
struct Duck(Quackable):
    fn quack(self):
        print("Quack")

@value
struct StealthCow(Quackable):
    fn quack(self):
        print("Moo!")
    

fn make_it_quack[type: Quackable](maybe_a_duck: type):
    maybe_a_duck.quack()

def main():
    make_it_quack(Duck())
    make_it_quack(StealthCow())
    quack_and_go(FlyingDuck())

