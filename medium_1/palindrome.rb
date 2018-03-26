# Write a method that can determine if a given string is a palindrome

# - ignore non letters
# - case insensitive, can't use #reverse, can't use regex

  ALPHA = ('a'..'z')

  def palindrome?(str)
    front = []
    back = []
    str.downcase.chars.each do |char|
      if ALPHA.include?(char)
        front.push(char)
        back.unshift(char)
      end
    end
    front == back
  end

p palindrome?('nofon')
p palindrome?('Race Car')
p palindrome?('hello')
