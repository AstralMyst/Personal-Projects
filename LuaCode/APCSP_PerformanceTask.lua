--variables begin (initialization section)
--[[
This is my performance task for the AP CSP Test I took in 2021 (sophomore year). I got a 4 on the test.
Basically just a word unscrambler that I had done with a partner. We added a bunch of features to improve the code and fit the criteria.
]]
print("Welcome to the \27[31mjumble game\27[0m")
print("===========================")
print("Instructions: Unscramble the words")
print("\27[31mWarning!\27[0m Very Difficult")

print("type '\27[34m!check unscrambled words\27[0m' to see solved words")
print("type '\27[34m!skip\27[0m' to skip (you start with 3)")
print("type '\27[34m!rescramble\27[0m' to rescramble the word")
print("===========================")
print("")

mode = 0
guessing = false
hs = 0 -- high score is reset
points = 0 -- points are reset
skips = 3 --gives you 3 free skips
streak = 0 --resets your streak

words = { -- list of words to unscramble
"anagram","antidisestablishmentarianism","coalesce","collegeboard","extravagant","fast","hippopotomonstrosesquippedaliophobia","illuminated","inflammatory","instigated","ironic","irregardless","supercalifragilisticexpialidocious","difficult","hard","impossible","pneumonoultramicroscopicsilicovolcanoconiosis","shrimp","misspell","pharaoh","lunch","modern","onomatopoeia","poop","torment","torture","word","linear","racecar","grandma","literally","random","computer","spine","lither","ginger","subtext",
}
  
hardwords = {  -- list of harder words to unscramble
"least","racecar","tales","tar","taste","tea","tesla","thing","rage","rat","reaps","regret","save","vase","seat","silent","enlist","listen","slate","small","spare","spear","spill","stale","state","steal","weird","wired","stressed","study","game","gear","god","grab","inch","chin","china","cider","pairs","paris","parse","pills","night","no","odor","on","mage","malls","mega","act","cried","desserts","dog","door","dusty","duty","eat","arc","art","ate","bean","big","brag","car","cat","table","list","slit","enlist"
}
-- without these list, we would need to create multiple variables. Not only does this approach allow us to easily add and remove words from the list, it is easy to identify what they mean and we don't have to create a scramble function for each different variable, which would not be ideal.

solvedwords = { -- list of unscrambled words
}

-- functions begin

function Clear()

if not os.execute("clear") then -- if clear is not file
    os.execute("cls")
elseif not os.execute("cls") then -- if cls not file
    for i = 1,25 do
        print("\n") -- create a bunch of new lines for clear effect
    end
end

end

function sleep(n) -- n = time var
  local st = os. time() -- st = system time
  repeat until os.time() > st + n -0.25 -- wait untill system time is system time + time var - 0.25 (change 0.25 to change time delay)
  return true
end

function scramble(str) -- randomize letters
   local letters = {}
   for letter in str:gmatch'.[\128-\191]*' do --gmatch = look for keyboard characters 128 to 191
      table.insert(letters, {letter = letter, rnd = math.random()}) -- randomize letters and insert to letters
   end
   table.sort(letters, function(a, b) return a.rnd < b.rnd end) -- set letters in a random order
   for i, v in ipairs(letters) do letters[i] = v.letter end -- return the scrambled word
   return table.concat(letters) -- combine letters in list.
end

while true do -- iteration

if mode == 0 then
print("Type [1] to start")
local read = io.read()
if read == "1" or read == "[1]" then
mode = 1
numberword = math.random(1,#words) -- set intial words
sleep(1) -- countdown
Clear()
print("3")
sleep(1)
Clear()
print("2")
sleep(1)
Clear()
print("1")
sleep(1)
Clear()
correctword = words[numberword] 
print(scramble(correctword)) -- print the word

else
print('\27[31mInvalid Response\27[0m')      
end
else

-- variables end
-- function end
-- code begin
guessing = true
while guessing == true do
typedword = io.read() -- io is the library used to read and manipulate files
  print("") -- empty line

  if typedword == correctword then -- if player types the right word
    Clear()
    guessing = false
    points = points + 1 -- add point
    streak = streak + 1 -- add 
    print("Good job")
    print("You are on a "..points.." word streak.")
    if points > hs then
    hs = points
    end

      table.insert(solvedwords, 1, correctword) -- move word to solved words
      if mode == 1 or #hardwords == 0 then
      table.remove(words, numberword)
      elseif mode == 2 or #words == 0 then
      table.remove(hardwords, numberword) 
      end    
      if streak == 5 then -- adds skip if streak of 5
      skips = skips + 1
      streak = 0
      print("Nice 5 streak! You get another skip!")
      if mode ~= 2 and #hardwords > 0 then
      mode = 2
      print("\27[31mNice streak, but its about to get harder!\27[0m")
      end
      end

      if #hardwords == 0 then
        mode = 1
      elseif #words == 0 then
        mode = 2
      end
        
      if mode == 1 or #hardwords == 0 then
      if #words > 0 then
      numberword = math.random(1,#words) -- set intial words
      correctword = words[numberword]
      end      
      elseif mode == 2 or #words == 0 then
      if #hardwords > 0 then
      numberword = math.random(1,#hardwords) -- set intial words
      correctword = hardwords[numberword]
      end
      end
      print(scramble(correctword)) -- print the word
        
  elseif typedword == "!skip" then -- skips the current word
    if skips > 0 then
  skips = skips - 1
    guessing = false
    Clear()
  print("Word skipped! You now have "..skips.." skips remaining!")
  print("the correct word was "..correctword..".")
          
      table.insert(solvedwords, 1, correctword) -- move word to solved words
         if mode == 1 or #hardwords == 0 then
      if #words > 0 then
      table.remove(words, numberword)
      numberword = math.random(1,#words) -- set intial words
      correctword = words[numberword]
      end      
      elseif mode == 2 or #words == 0 then
      if #hardwords > 0 then
      table.remove(hardwords, numberword) 
      numberword = math.random(1,#hardwords) -- set intial words
      correctword = hardwords[numberword]
      end
      end
      print(scramble(correctword)) -- print the word     
   else
  print("You have no skips bozo")
    end
  elseif typedword == "!check unscrambled words" or typedword == "check solved words" or typedword == "check solved" then --checks unscrambled words


        
  if #solvedwords == 0 then -- if there are more than 0 solved words
    print("")
    print("you have no unscrambled words!")
  else
    print("")
    for i,v in pairs(solvedwords) -- for all values in solvedwords list, print them.
    do print(v)
    end
  end
  elseif typedword == "!rescramble" then
    if #words > 0 and #hardwords > 0 then
      print(scramble(correctword)) -- print the word
    end
  else
  
    Clear()
    guessing = false
    points = 0 -- reset streak
    streak = 0
    print("wrong word bozo")
    print("You lost your streak.")
    print("the correct word was "..correctword..".") -- call printpoints() function
    if mode ~= 1 and #hardwords > 0 then
    mode = 1
    if #words > 0 then
    print("\27[31mLooks like it's too hard for you.\27[0m")
    else
    print("\27[31mNo more normal words.\27[0m")
    end
    end
      if #hardwords == 0 then
        mode = 1
      elseif #words == 0 then
        mode = 2
      end
  
      if mode == 1 or #hardwords == 0 then
      if #words > 0 then
      numberword = math.random(1,#words) -- set intial words
      correctword = words[numberword]
      end      
      elseif mode == 2 or #words == 0 then
      if #hardwords > 0 then
      numberword = math.random(1,#hardwords) -- set intial words
      correctword = hardwords[numberword]
      end
      end
      print(scramble(correctword)) -- print the word  
        
   end
end
  print(" ") -- empty line to separate prompts

  if #words == 0 and #hardwords == 0 then
  print("You Win!")
  print("Your high score is "..hs..".")
  sleep(3)
  Clear()
  print("Thanks for playing")
  break
  end
    
end -- end iteration
end

  



--reference words list


words = { -- list of words to unscramble
"anagram","antidisestablishmentarianism","coalesce","collegeboard","extravagant","fast","hippopotomonstrosesquippedaliophobia","illuminated","inflammatory","instigated","ironic","irregardless","supercalifragilisticexpialidocious","difficult","hard","impossible","pneumonoultramicroscopicsilicovolcanoconiosis","shrimp","misspell","pharaoh","lunch","modern","onomatopoeia","poop","torment","torture","word","linear","racecar","grandma","literally","random","computer"
}
  
hardwords = {  -- list of harder words to unscramble
"least","racecar","tales","tar","taste","tea","tesla","thing","rage","rat","reaps","regret","save","vase","seat","silent","enlist","listen","slate","small","spare","spear","spill","stale","state","steal","weird","wired","stressed","study","game","gear","god","grab","inch","chin","china","cider","pairs","paris","parse","pills","night","no","odor","on","mage","malls","mega","act","cried","desserts","dog","door","dusty","duty","eat","arc","art","ate","bean","big","brag","car","cat","table","list","slit","enlist"
}