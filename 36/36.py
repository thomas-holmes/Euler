#!/usr/bin/python2.7
def reverse_int(n):
	return int(str(n)[::-1])

if __name__ == "__main__":
	total = 0
	base_10_palindromes = []

	for x in range(1,1000000):
		if x == reverse_int(x):
			base_10_palindromes.append(x)
	
	for p in base_10_palindromes:
		b = int(bin(p)[2:])
		if b == reverse_int(b):
			total += p
	
	print(total)
