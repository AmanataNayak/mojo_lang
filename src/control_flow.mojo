def main():
    # if statemnts
    var temp_celsius = 25
    if temp_celsius <= 0:
        print("It is freezing. ")
    elif temp_celsius < 20:
        print("It is cool.")
    elif temp_celsius < 30:
        print("It is warm")
    else:
        print("It is hot")
    
    # conditonal expression
    temp_celsius = 15
    forecast = "warm" if temp_celsius > 20 else "cool"
    print("The forecast for today is", forecast)

    # while
    var n = 0
    while n < 5:
        n += 1
        if n == 3:
            break
        print(n, end=", ")
    print('')
    # for 
    for i in range(5):
        if i == 3:
            continue
        print(i, end=', ')
