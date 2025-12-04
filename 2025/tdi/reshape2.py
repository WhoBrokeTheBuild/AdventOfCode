
# RESHAPE() is currently unimplemented...
def reshape2(data, shape):
    data = data.data()
    shape = shape.data()
    return data.reshape(shape[::-1])