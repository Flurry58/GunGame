extends Node


#Useful functions:

func subtract_list(A, B) -> Array:
	for item in range(len(A)):
		A[item] = A[item] - B[item]
	return A
