#!/usr/bin/python2.7
def is_palindrome(n):
  nstr = str(n)
  if nstr != str(nstr)[::-1]:
    return False

  b = str(bin(n))[2:]
  return b == b[::-1]


if __name__ == "__main__":
  total = 0

  for x in range(1,1000000):
    if is_palindrome(x):
      total += x
  
  print(total)
