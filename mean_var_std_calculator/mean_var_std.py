import numpy as np

def calculate(list):
    if len(list) != 9:
        raise ValueError("List must contain nine numbers.")
    
    array = np.array(list).reshape(3,3)

    mean0 = np.mean(array, axis=0)
    mean1 = np.mean(array, axis=1)
    mean_ = np.mean(array)
    # print(f'{[mean0, mean1, mean_] = }')

    var0 = np.var(array, axis=0)
    var1 = np.var(array, axis=1)
    var_ = np.var(array)
    # print(f'{[var0, var1, var_] = }')

    std0 = np.std(array, axis=0)
    std1 = np.std(array, axis=1)
    std_ = np.std(array)
    # print(f'{[std0, std1, std_] = }')

    min0 = np.min(array, axis=0)
    min1 = np.min(array, axis=1)
    min_ = np.min(array)
    # print(f'{[min0, min1, min_] = }')

    max0 = np.max(array, axis=0)
    max1 = np.max(array, axis=1)
    max_ = np.max(array)
    # print(f'{[max0, max1, max_] = }')

    sum0 = np.sum(array, axis=0)
    sum1 = np.sum(array, axis=1)
    sum_ = np.sum(array)
    # print(f'{[sum0, sum1, sum_] = }')
    if min_.dtype == np.float64 or max_.dtype == np.float64 or max_.dtype == np.float64:
        min_ = float(min_)
        max_ = float(max_)
        sum_ = float(sum_)
    else:
        min_ = int(min_)
        max_ = int(max_)
        sum_ = int(sum_)


    calculations = {
        'mean': [mean0.tolist(), mean1.tolist(), float(mean_)],
        'variance': [var0.tolist(), var1.tolist(), float(var_)],
        'standard deviation': [std0.tolist(), std1.tolist(), float(std_)],
        'max': [max0.tolist(), max1.tolist(), max_],
        'min': [min0.tolist(), min1.tolist(), min_],
        'sum': [sum0.tolist(), sum1.tolist(), sum_],
    }
    
    return calculations
