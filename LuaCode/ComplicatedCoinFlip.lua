-- all the fun variable event stuff
-- https://github.com/torch/sys/blob/master/colors.lua for colors
local combatDuration = 8 --this is not constant, depends on plr count and such
local maxStatPoints = 5
local bool_randomEvents = true -- makes luck almost useless lol
local alternative_spoofed_neutrino = true
local timescale = 1



local combat = {
  {"Equipping their daggers, ⨷ throws them with incredible force at ⊗.", 2, 3,"⊗ tumbles to the ground, unable to evade the barrage.","⊗ ducks and rolls out of the way, turning to face ⨷."}, -- text, check plr 1 stat x, plr 2 stat y, 1 vic, 2 vic

  {"A wild ⊗ appears! ⨷ use thunderbolt!", 2, 2,"It was super effective!","⨷ missed!"},

  {"As ⊗ steps around the corner, ⨷ draws their weapon and fires.", 3, 4,"The shot hits ⊗ square in the shoulder, knocking them back.","⨷ misses and ⊗ turns to face them."},
  
  {"⨷ and ⊗ engage in a lengthy skirmish. The swords clatter and spark against the other in a masterful dance of blades.", 2, 2,"⨷ manages to deal a substantial blow, sending ⊗ stumbling back.","⊗ manages to parry each blade, pushing ⨷ back against a wall."},

  {"Leaping from behind, ⨷ tackles ⊗ from behind, sending both tumbling to the ground.", 2, 2,"⨷ pummels ⊗ with a flurry of attacks.","⊗ forces ⨷ off of them, stumbling to their feet."},

  {"Grabbing ⊗, ⨷ pushes them against the wall, raising his fist to strike.", 2, 2,"⨷ unleashes a barrage of attacks, before finally releasing ⊗ from their grasp.","⊗ blocks ⨷'s fist and they shove them back."},

  {"⨷ dashes towards ⊗, weapon drawn.", 3, 3,"⨷ leaps into the air. ⊗ turns to block but isn't fast enough and was injured","⊗ leaps out of the way as ⨷'s blade strikes the ground."},
  
  {"⊗ pounces on ⨷ but misses. ⨷ draws their weapon, ready to strike.", 3, 3,"⨷ strikes down ⊗ before they can react, causing a gashing wound in their side.","⊗ jumps back on their feet, leaping away as ⨷ thrusts forth."},

  {"⨷ sneaks up on ⊗, preparing to attack.", 3, 4,"⨷ slashes at ⊗ before they can react, leaving a major wound in their side.","⨷ steps on a twig, alerting ⊗ of their presence and causing them to leap back just as ⨷ slashes at them."},

  {"⨷, spotting ⊗ in the distance, aims their weapon, firing.", 4, 3,"⨷'s projectile whistles through the air, landing right on ⊗, leaving a massive puncture wound. Bullseye.","⊗ notices ⨷'s projectile, diving to the ground out of the way."},
  
  {"⨷ knocks ⊗ to the ground.", 2, 2,"⨷ lands a few hits on ⊗ before they manage to break free.","⊗ wrestles free, escaping unharmed.'"},

  {"⨷ chucks a textbook at ⊗.", 2, 3,"⨷'s textbook hits ⊗ right in the face, sending ⊗ tumbling to the ground.","⊗ dodges with ease."},

  {"⨷ slings a rock at ⊗.", 2, 3,"⨷'s rock hits ⊗ right in the face, sending ⊗ tumbling to the ground.","⊗ dodges with ease."},

  {"⨷ and ⊗ encounter a bear.", 4, 4,"The bear targets ⊗, managing to deal crushing damage to them before ⊗ can get away.","Targeting ⊗, it charges towards them but they dodge with ease."},
  
  {"⊗, being chased by ⨷, tries to knock a tree down to block ⨷'s path.", 3, 2,"Too slow, ⨷ pounces on ⊗ as the tree thuds to the ground. ⨷ slashes at ⊗ with their blade, leaving a permanent scar.","The tree falls. ⨷ dodges with ease but this momentary pause gives ⊗ enough time to gather themselves."},
}
local good_events = {-- string, stat, value
  { "⨷ comes across a clearing. There are various berry bushes around. ⨷ harvests a few, restoring their hunger and ⊗ health. They leave, feeling slightly better off.", 1, 0.5},

  { "While traversing the woods, ⨷ stops to take in the view. Rejuvinated and inspired, ⨷ is healed ⊗.", 1, 1},

  { "After a long hunt, ⨷ sits down and treats themself to a nice meal. Feeling refreshed, they find themselves faster by ⊗", 3, 1},
  
  {"⨷ finds a small cave and what appears to be an abandonned camp. After clearing the area, ⨷ rests, feeling refreshed and regaining ⊗ health.", 1,1},
  
  {"⨷, while on a scouting mission, encounters a corpse. Upon closer inspection, ⨷ finds a steel blade of high quality. Picking it up, ⨷'s damage increases by ⊗'", 2,1},
  
  {"⨷ finds an empty building while on a scouting mission. Within, they find a clean pair of boots. Putting them on, they feel much more comfortable. +⊗ to speed.'", 3,1},

  {"⨷ stumbles across temple ruins. Taking a moment to pray to the Forgotten God. In return, they are blessed, and their luck increases by ⊗.'", 4,1},
}
local bad_events = {
  { "While scouting, ⨷ stumbles over a rock, causing them to trip and lose ⊗ health.", 1, -1},

  { "As they line up to check out while shopping, ⨷ realizes they left their wallet at home. Out of embarassment they lose ⊗ strength", 2, -1},

  { "⨷ hurts itself in confusion! ⊗ damage!", 1, -1},

  { "⨷ sprains their ankle while chasing their enemy, losing ⊗ mobility.", 3, -1},

  { "⨷ sneezed and nobody said bless you. They lose ⊗ luck.", 4, -1},
  
  { "⨷ took an arrow to the knee. Lose ⊗ mobility.", 3, -2},

  { "⨷ is in immense pain after falling on their arm. Possibly dislocated, they lose ⊗ strength.", 2, -2},

  { "⨷ dislocates their knee after tripping on low hanging branches, moving slower by ⊗.", 3, -2},

  { "⨷ suffers from food poisoning after eating raw food. Strength capacity decreased by ⊗.", 2, -1},

  { "⨷ accidently knocks over an ancient tome, cursing their family for generations. Lose ⊗ luck.", 2, -5},

  { "After a poor hunting trip, ⨷ goes to bed hungry, losing ⊗ health. They hope to find food soon.", 1, -0.5},
  
  { "⨷ seems to have lost their weapon. Their combat capabilities have decreased by ⊗.", 2, -2},

  { "A murder of crows have been flying above ⨷ for a while. A bad omen, ⨷ feels their luck fall by ⊗.", 4, -1},
  
  { "⨷ tripped and cut their leg. With a deep gash, ⨷'s mobility has decreased by ⊗", 3, -2},
  
  { "While tracking the enemy, ⨷ unknowinly steps into a spike trap, stabbing them in the chest.", 1, -3},

  { "Struggling to find food, ⨷ is forced to continue their travels, starving and losing ⊗ health.", 1, -0.5},
  
  { "⨷ accessed forbidden knowledge", 1, -10},
  
  { "As the cold sweeps in, ⨷ suffers from frostbite, growing weaker by ⊗.", 2, -1},
  
  { "⨷ cuts their leg on a sharp branch, causing immense pain. They move ⊗ slower.", 3, -1},
  
  { "After killing an albatross, ⨷ feels a sense of gloom, seemingly having angered a higher being. Luck falls by ⊗.", 4, -1},
}

local neutral = {
  {"⨷ is tired, and stops to rest.",2,0}, -- leave in this format so i dont have to do a check lmao
  {"⨷ reflects on their life decisions.",2,0},
  {"⨷ makes their way up a mountain for a better view.",2,0},
  {"⨷ comes across a fork in the road.",2,0},
  {"⨷ hears a rustling noise.",2,0},
  {"⨷ contemplates life and death.",2,0},
  {"⨷ watches the sunset.",2,0},
  {"⨷ studies thier surrounding.",2,0},
  {"⨷ decides to pack up camp.",2,0},
  {"⨷ stumbles across an abandoned camp. There is nothing there.",2,0},
  {"⨷ finds some building ruins. There is nothing there.",2,0},
  {"⨷ encounters a corpse. It's body is rotting away.",2,0},
  {"⨷ sets up a trap",2,0},
  {"⨷ observes their enemy in the distance.",2,0},
  {"⨷ investigates the source of an ominous noise.",2,0},
  {"⨷ stabs a guy before realizing they were not part of the competition",2,0},
  {"⨷ interviews the local wildlife.",2,0},
  {"⨷ recieved a message about their car's extended warranty",2,0},
  {"⨷ establishes communication with higher beings.",2,0},
  {"Something watches ⨷ from the distance.",2,0},
  {"⨷ dreams of freedom.",2,0},
  {"⨷ is starting to think they might be in a simulation.",2,0},
  {"⨷ goes out for a joy ride.",2,0},
  {"⨷ finds a cool looking stick.",2,0},
  {"⨷ finds an old castle.",2,0},
  {"⨷ listens to some jazz.",2,0},
  {"⨷ feels lonely.",2,0},
  {"⨷ examines a weird looking mole on their skin.",2,0},
  {"⨷ fears for their life.",2,0},
  {"⨷ is chased by an angry goose.",2,0},
  {"⨷ rides a moose.",2,0},
  {"⨷ watches the snow fall.",2,0},
  {"⨷ thinks about life by the campfire.",2,0},
  {"⨷ is lost.",2,0},
  {"⨷ thinks this is stupid.",2,0},
  {"⨷ thinks it's too dark to see.",2,0},
  {"⨷ stops to listen.",2,0},
  {"⨷ finds a dead racoon in a trash can.",2,0},
  {"⨷ finds signs of alien life.",2,0},
  {"⨷ watches the stars.",2,0},
  {"⨷ wants this to be over.",2,0},
  {"⨷ thinks their name is stupid.",2,0},
}

--[[End of fun variable event stuff]]

local randomNamelist = {
"Alpha","Bravo","Charlie","Channel","Castle","Delta","Echo","Epsilon","Foxtrot","Foxbat","Golf","Hotel","Home","India","Juliett","Jammer","Kilo","Kappa","Lima","Letter","Mike","November","Number","Oscar","Omega","Papa","Pheonix","Phi","Quebec","Romeo","Return","Sierra","Sidewind","Tango","Uniform","Upslion","Victor","Whiskey","X-ray","Yankee","Zulu","Zebra"
}

function Clear()
  if os.execute("cls") then
    os.execute("cls")
  elseif not os.execute("cls") then -- if clear is not file
    os.execute("clear")
  elseif not os.execute("clear") then -- if cls not file
    for i = 1, 25 do
      print("\n") -- create a bunch of new lines for clear effect
    end
  end
end

function sleep(n) -- n = time var
  local st = os.time() -- st = system time
  repeat
  until os.time() > st + n - 0.25 -- wait untill system time is system time + time var - 0.25 (change 0.25 to change time delay)
  return true
end

local entered = true
while entered == true do
  local fighters = {
  }
  local dead = {}
  local days = 0
  
  local validcheck = false
  repeat
    Clear()
    print("\27[0;35mWelcome to the Ultimate Arena!\27[0m")
    print("Made by Kody Ho")
    print("Put various characters to fight to the death. Last one standing wins.")
    print("\27[1;33mBasic Info:\27[0m")
    print("- Combat is done by comparing the stats between two characters")
    print("- Higher stats don't guarantee victory, only increases the chance of hit.")
    print("- Luck stat increases chances for characters to avoid damage")
    print("\27[31m- Avoid using non-alphabetic characters in names.\27[0m")
    print("\27[31m- There must be a minimum of 2 contestants to play.\27[0m")
    print("\n")
    print("\27[1;32mEnter the number of contestants, or type 'settings' to visit settings?\27[0m")
    optionsamt = io.read()
    if optionsamt:match("^%-?%d+$") == tonumber(optionsamt) then
      if string.lower(optionsamt) == "settings" then
        print("[1] Change statpoints")
        print("[2] Change Timescale")
        print("[3] Exit")
        local settings = true
        while settings == true do
          local response = io.read()
          if response == "1" then
            local changingstat = true
            while changingstat == true do
            print("Set to what? (5 default)")
            local amt = io.read()
            if tonumber(amt) ~= nil then
              if tonumber(amt) > 0 then
                maxStatPoints = math.floor(amt)
                  changingstat = false
                  print("Set to "..amt..".")
              else
              print("\27[31mContestants can only have a minimum of 0 statpoints\27[0m")
              end
            else
              print("\27[31mPlease enter a valid option\27[0m")
            end
            end
          elseif response == "2" then
            local changingtime = true
            while changingtime == true do
            print("What speed? (1 default)")
            local amt = io.read()
            if tonumber(amt) ~= nil then
              if tonumber(amt) > 0 then
                timescale = math.floor(amt)
                  changingtime = false
                  print("Timescale to "..amt..".")
              else
              print("\27[31mTimespeed must be more than 0\27[0m")
              end
            else
              print("\27[31mPlease enter a valid option\27[0m")
            end
            end
          elseif response == "3" then
            settings = false
            print("[1] Change statpoints")
            print("[2] Exit")
          else
            print("\27[31mPlease enter a valid option\27[0m")
          end
        end
      else
      print("\27[31mPlease enter a valid option\27[0m")
      end
    elseif tonumber(optionsamt) < 2 then
      print("\27[31mYou need at least 2 contestents!\27[0m")
    else
      validcheck = true
    end
  until validcheck == true
  Clear()
  for i = 1, optionsamt do
    local placeholdplr = {}
    print("What is \27[34mcontestent " .. tostring(i) .. "'s\27[0m name?'")
    print("Leave blank for random name.")
    local name = io.read()
    if name == "" then
      name = randomNamelist[math.random(1,#randomNamelist)]..tostring(i)
      name = name:lower():gsub("^%l", string.upper)
    end
    table.insert(placeholdplr, name)
    Clear()
    local statpoints = maxStatPoints
    local stattable = { 0, 0, 0, 0 }
    repeat
      print("Distribute \27[34m" .. name .. "'s\27[0m stat points")
      print("\27[34m" .. statpoints .. " points:\27[0m")
      print("[1] Vitality - " .. stattable[1])
      print("[2] Strength - " .. stattable[2])
      print("[3] Speed - " .. stattable[3])
      print("[4] Luck - " .. stattable[4])
      print("[5] Randomize")

      repeat
        local dist_ = io.read()

        local validcheck = false
        if dist_:match("^%-?%d+$") == tonumber(dist_) then
          if dist_ == "boss" and alternative_spoofed_neutrino == true then
            stattable[1] = 50+stattable[1]
            validcheck = true
          elseif dist_ == "+" and alternative_spoofed_neutrino == true then
            print("How much?")
            local value = io.read()
            if tonumber(value) ~= nil then
              statpoints = statpoints + value
              validcheck = true
            else
            print("\27[31mInvalid stat point\27[0m")
            end
          else
            Clear()
            print("\27[34mChoosing random stats\27[0m")
            repeat
              local rand_stat = math.random(1, 4)
              stattable[rand_stat] = stattable[rand_stat] + 1
              statpoints = statpoints - 1
            until statpoints == 0
            validcheck = true
            print("Vitality: "..stattable[1]..", Strength: "..stattable[2]..", Speed: "..stattable[3]..", Luck: "..stattable[4])
            print("Type anything to continue")
            local pause = io.read()
          end
        elseif tonumber(dist_) < 1 or tonumber(dist_) > 5 then
          print("\27[31mInvalid stat point\27[0m")
        elseif tonumber(dist_) == 5 then
          Clear()
          print("\27[34mChoosing random stats\27[0m")
          repeat
            local rand_stat = math.random(1, 4)
            stattable[rand_stat] = stattable[rand_stat] + 1
            statpoints = statpoints - 1
          until statpoints == 0
          validcheck = true
          print("Vitality: "..stattable[1]..", Strength: "..stattable[2]..", Speed: "..stattable[3]..", Luck: "..stattable[4])
          print("Type anything to continue")
          local pause = io.read()
        else
          stattable[math.floor(tonumber(dist_))] = stattable[math.floor(tonumber(dist_))] + 1
          validcheck = true
          statpoints = statpoints - 1
        end
      until validcheck == true
      Clear()
    until statpoints <= 0
    table.insert(placeholdplr, 5 + stattable[1]) -- insert health
    table.insert(placeholdplr, stattable) -- insert stats
    table.insert(placeholdplr, 0) -- insert kill count
    table.insert(placeholdplr, 0) -- insert luck count
    table.insert(fighters, placeholdplr)
  end

  function translatecombat(input,fighter1,fighter2)
    return input:gsub("⨷","\27[34m"..tostring(fighter1).."\27[0m"):gsub("⊗","\27[34m"..tostring(fighter2).."\27[0m")
  end
  print("\27[31mReady?\27[0m")
  sleep(1/timescale)
  print("Go!")
  local fightCount = 0
  repeat
    sleep(2/timescale)
    print("\n")
    print("\27[1;33mDay "..tostring(days).."\27[0m")
    days = days + 1
local chance = math.random(1, 6+(#fighters/2))
    if chance <= math.floor(#fighters/2) then -- encounter
      print("\27[31m//ENCOUNTER//\27[0m")
      fightCount = fightCount+1
      local fighter1 = fighters[math.random(1, #fighters)]
      repeat
        fighter2 = fighters[math.random(1, #fighters)]
      until fighter2 ~= fighter1
      for i = 1, math.random(1+math.floor(#fighters/4),((combatDuration+math.floor(#fighters/4))*math.floor((days+100)/100))) do
        if fighter2[2] > 0 and fighter1[2] > 0 then
          local fight = combat[math.random(1, #combat)]
          local text = translatecombat(fight[1],fighter1[1],fighter2[1])
        print(text)

          
          local checktype = ""
          if fight[2] == 2 then
            checktype = "\27[1;31mstrength\27[0m"
          elseif fight[2] == 3 then
            checktype = "\27[1;33mspeed\27[0m"
          elseif fight[2] == 4 then
            checktype = "\27[0;35mluck\27[0m"
          end
          print(fighter1[1].."'s "..checktype..": "..tostring(fighter1[3][fight[2]]))
          if fight[3] == 2 then
            checktype = "\27[1;31mstrength\27[0m"
          elseif fight[3] == 3 then
            checktype = "\27[1;33mspeed\27[0m"
          elseif fight[3] == 4 then
            checktype = "\27[0;35mluck\27[0m"
          end
          print(fighter2[1].."'s "..checktype..": "..tostring(fighter2[3][fight[3]]))

          
          sleep(2/timescale)
          if fighter1[3][fight[2]]+math.random(0,fighter1[3][4]) >= fighter2[3][fight[3]]+math.random(-2,fighter2[3][4]) then
          text = translatecombat(fight[4],fighter1[1],fighter2[1])
          print("\27[1;33mHit!\27[0m "..text)
          fighter2[2]=fighter2[2]-(fighter1[3][2]+2)/2

          print("\27[0;32m"..fighter2[1].." has "..fighter2[2].."/"..tostring(fighter2[3][1]+5).." health\27[0m")
          else
          text = translatecombat(fight[5],fighter1[1],fighter2[1])
          print("\27[1;31mMiss!\27[0m "..text)
          end
        if fighter2[2] <= 0 then
            print("\27[1;31m"..fighter2[1].." has died;\27[0m")
          table.insert(dead,{(fighter2[1].." was killed by "..fighter1[1]),fighter2[4],fighter2[5],fighter2[1]})
            fighter1[4] = fighter1[4] + 1
        end
          local placehold = fighter1
          fighter1 = fighter2
          fighter2 = placehold
          print("\n")
          sleep(2/timescale)
        end
      end
    print("\27[31m//COMBAT END//\27[0m")
    print("\n")


    else -- encounter
      for i = 1,math.random(1,3) do
        local randomPlayer = fighters[math.random(1, #fighters)]
        repeat
          randomPlayer = fighters[math.random(1, #fighters)]
        until randomPlayer[2] > 0
        local luckchance = math.random(0,5+maxStatPoints)
        local randomEvent
        if bool_randomEvents == true and luckchance > maxStatPoints then
          randomEvent = neutral[math.random(1, #neutral)]
        elseif luckchance <= randomPlayer[3][4] and bool_randomEvents == true then
          print("\27[0;32mGood Luck!\27[0m")
            randomPlayer[5] = randomPlayer[5] + 1
            randomEvent = good_events[math.random(1, #good_events)]
        elseif bool_randomEvents == true then
      print("\27[0;31mBad Luck!\27[0m")
          randomPlayer[5] = randomPlayer[5] - 1
          randomEvent = bad_events[math.random(1, #bad_events)]
        end
        local text = randomEvent[1]:gsub("⨷","\27[34m"..tostring(randomPlayer[1]).."\27[0m"):gsub("⊗","\27[34m".. math.abs(randomEvent[3]).."\27[0m")
        print(text)
        if randomEvent[2] == 1 then
          randomPlayer[2] = randomPlayer[2] + randomEvent[3]
          print("\27[0;32m"..randomPlayer[1].." has "..randomPlayer[2].."/"..tostring(randomPlayer[3][1]+5).." health\27[0m")
          if randomPlayer[2] <= 0 then
            print("\27[1;31m"..randomPlayer[1].." has died;\27[0m")
            table.insert(dead,{(randomPlayer[1].." died to bad luck"),randomPlayer[4],randomPlayer[5],randomPlayer[1]})
          end
        else
          randomPlayer[3][randomEvent[2]] = randomPlayer[3][randomEvent[2]] + randomEvent[3]
        if randomPlayer[3][randomEvent[2]] < 0 then
          randomPlayer[3][randomEvent[2]] = 0
        elseif randomPlayer[3][randomEvent[2]] > 6 then
        randomPlayer[3][randomEvent[2]] = 6
        end
          
        --print(randomPlayer[2]..", "..randomPlayer[3][2]..", "..randomPlayer[3][3]..", "..randomPlayer[3][4])
      end
      end
    end
    for i, v in pairs(fighters) do
      if v[2] <= 0 then
        table.remove(fighters, i)
        print("\27[31m"..#fighters.." remain.\27[0m")
      end
    end
  until #fighters <= 1
  print("\n")
  print("\27[31m//GAME OVER//\27[0m")
  print("\27[0;33m"..fighters[1][1].." emerges victorious!\27[0m")
  print(days.." Days")
  print(fightCount.." skirmishes.")
  print(#dead.." casualties.")
  for i,v in pairs(dead) do
    print("\27[31m[Death "..tostring(i).."] "..v[1].."\27[0m")
  end
  print("\n")
  print("\27[1;33mSpecial Mentions:\27[0m")
  local mostkills = {fighters[1][1],fighters[1][4]}
  local bestluck = {fighters[1][1],fighters[1][5]}
  local worstluck = {fighters[1][1],fighters[1][5]}
  for i,v in pairs(dead) do
    local lkills = (v[2])
    local lluck = (v[3])
    if lkills > (mostkills[2]) then
      mostkills = {v[4],lkills}
    end
    if lluck > (bestluck[2]) then
      bestluck = {v[4],lluck}
    elseif lluck < (worstluck[2]) then
      worstluck = {v[4],lluck}
    end
  end
  print("\27[1;33mMost kills: "..mostkills[1].." with "..mostkills[2].."\27[0m")
  print("\27[1;33mLuckiest: "..bestluck[1].." with "..bestluck[2].." good events\27[0m")
  print("\27[1;33mWorst Luck: "..worstluck[1].." with "..math.abs(worstluck[2]).." bad events\27[0m")
  print("\n")
  print("[1] Play again")
  local playagain = io.read()
  if playagain ~= "1" then 
    entered = false
  end
  Clear()
end