# Custom context manager
import sys
import time

@value
struct Timer:
    var start_time: Int

    fn __init__(out self):
        self.start_time = 0

    fn __enter__(mut self) -> Self:
        self.start_time = time.perf_counter_ns()
        return self

    fn __exit__(mut self):
        end_time = time.perf_counter_ns()
        elapsed_time_ms = round(((end_time - self.start_time) / 1e6), 3)
        print("Elapsed time:", elapsed_time_ms, "ms")

def main():
    with open("try.txt", "r") as f:
        var content: String = f.read()
        print(content)

    with open("try.txt", "r") as f_in, open("try.txt", "w") as f_out:
        input_text = f_in.read()
        output_text = input_text.upper()
        f_out.write(output_text)
    
    with Timer():
        print("Beginning execution")
        if len(sys.argv()) > 1:
            raise "simulated error"
        print("Ending execution")