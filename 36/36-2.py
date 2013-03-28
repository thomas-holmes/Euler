#!/usr/bin/python2.7
def reverse_int(n):
  return int(str(n)[::-1])

def is_palindrome(n):
  decPalindrome = (n == reverse_int(n))
  if not decPalindrome:
    return False

  b = int(bin(n)[2:])
  return b == reverse_int(b)

if __name__ == "__main__":
  answer = [x for x in range(1,1000000) if is_palindrome(x)]
  print(sum(answer))
