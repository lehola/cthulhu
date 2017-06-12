require 'discordrb'

bot = Discordrb::Bot.new token: 'MzIxNzk1ODMwNjIzMjQwMjAy.DBjPZg.ZrkCTTTBlXr7VvZZ9nOmkwQQw-A', client_id: 321795830623240202

bot = Discordrb::Commands::CommandBot.new token: 'MzIxNzk1ODMwNjIzMjQwMjAy.DBjPZg.ZrkCTTTBlXr7VvZZ9nOmkwQQw-A', client_id: 321795830623240202, prefix: '!'


 #variables ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    cthulhu =  ['cthulhu', 'Cthulhu', 'CTHULHU', "cTHULHU"]
    
    hello = [("Hello cthulhu"), ("hello cthulhu"), ("Hello Cthulhu"), ("hello Cthulhu"),("HELLO CTHULHU"),
                                     ("Hey cthulhu"), ("hey cthulhu"), ("Hey Cthulhu"), ("hey Cthulhu"),("HEY CTHULHU"),
                                            ("Hi cthulhu"), ("hi cthulhu"), ("Hi Cthulhu"), ("HI CTHULHU")]
                                            
    eightballResponse = ["It is certain","My tenancles say yes, but my body says no" , "It is decidedly so", "Without a doubt", "Yes definitely", "You may rely on it", "As I see it, yes", "Most likely",
        "Outlook good", "Yes", "lol idk dude, go fuck yourself", "Signs point to yes", "Wow man, what the fuck. Seriously?", "Reply hazy try again. >Never<",
        "Ask again later, I'm busy", "No!", "Better not tell you now", "Eh, maybe. I dont care", "My sources say no", "Outlook not so good", "My reply is no", "Very doubtful", "Don't count on it", "Закро́й свой рот, су́ка!" ]

                          
    skeletons = [("Skeletons"), ("Skeleton"), ("skeleton"), ("skeletons"), ("SKELETONS"), ("SKELETON")]
     
    skeletonsReponse = ["*opens sack*", "*rattles bones*"]
     
    misspellings = ["Tulu", "tulu", "clulu", "Clulu", "clooloo","Clooloo", "cthulu","Cthulu", "cthullu","Cthullu", "cighulu","Cighulu","cathulu","Cathulu", "cthlu","Cthlu", 
    "Kathulu","kathulu", "Kutulu","kutulu", "Kthulhu","kthulhu", "Qthulu","qthulu", "Ktulu","ktulu", "Kthulhut","kthulhut", "Kulhu","kulhu", 
    "Kutunluu","kutunluu", "Ktulu","ktulu", "Cuitiliu","cuitiliu", "chtulhu", "Chtulhu"]
    
    misspellingsResponse = ["What the fuck did you just call me? Learn to spell faggot, Im Cthulhu!", "My name is Cthulhu, learn to spell it :middle_finger:", "Dude, what the fuck. That's not my name, IM FUCKING CTHULHU",
     "My name is Cthulhu :triumph:", "That's not my name man! I HAVE A NAME :disappointed_relieved: ", "Asshole, stop calling me that. Im Cthulhu", "Fuck off, I'm Lord Cthulhu! Spell my name right at least!",
     "Your spelling of my name, dishonors me, you should be ashamed. Its Cthulhu", "You mortals and your spelling errors. My name is Cthulhu"]

 #variables ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


bot.message(with_text: cthulhu) do |event|
  event.respond 'Mang!! :octopus:      :squid:      :octopus:      :squid:      :octopus:'
end

bot.message(with_text: hello ) do |event|
  event.respond ["Hello #{event.user.name}, go fuck yourself", "Hey #{event.user.name}", "Hi #{event.user.name}", 
                    "Ma dude #{event.user.name}! Hey!! :octopus: ", "#{event.user.name}! Hey, my bestie! :octopus:"].sample
end

bot.command([:eightball, :Eightball, :eball, :Eball, :'8ball', :'8Ball', :ball, :Ball, :'8bal', :'8Bal']) do |event, argument|
    if argument == nil
        event.respond("You forgot to ask the question with the magic eightball. Try for example, >!8ball Can unicorns fly?< :octopus:")
    else
        event.respond eightballResponse.sample
    end
  end



bot.command :me do |event|

     event.user.name
     
end


bot.message(containing: skeletons)  do |event|
  event.respond skeletonsReponse.sample
end
     
bot.message(containing: misspellings)  do |event|
  event.user.pm (misspellingsResponse.sample )
end

     
bot.command :userbotcheck do |event|

 event.user.current_bot? ? "#{event.user.name} is a bot. BEEP BOOP" : "#{event.user.name} is not a bot. BEEP BOOP"  #checks if user is a bot or not

end


bot.command( [:color, :Color], description: 'Allow you to change your color, give the hex code with the command to change. Example >!color FF0000< for red :octopus:', max_args: 1  ) do |event, argument|
   
  if argument != nil   
    if !argument[/\H/] == true
         
        id = event.author.roles[0].resolve_id
        role = event.server.role(id)
        role.color = Discordrb::ColorRGB.new(argument.hex)
        event.message.delete
    else
        event.respond "You must enter the value in hex format(without the hash tag). For example >!color 000FFF< :octopus: "
    end
  else event.respond "You have to enter the hex color with the command(without the hash tag). For instance >!color 000FFF< :octopus: "
      
  end
end 
     
     
bot.command(:flip, description: 'Fips a coin.' ) do |event|

    event.respond ("*Flips a coin with he's evil tentacles, it lands on*: "  + ["Heads", "Tails"].sample)
     
end





bot.command( [ :roll, :Roll, :rol, :Rol], description: 'Rolls a dice.', max_args: 1  ) do |event, argument|
    
    if argument == nil #if user enter nothing, the default number of sides to roll will be 666
       argument = 6
    end 
    
    result = Integer(argument) rescue false #checks if the user entered an int

    if result != false #if user did enter a number do, note must be an int
    
     if argument.to_i >= 1
         event.respond ("*rolls a die with #{argument} sides, the die lands on: #{rand(1..argument.to_i)}* ")
     else 
         event.respond ("You dumb-ass mortal. The die needs at least one side or more :octopus: ")
     end
     
    else
   
      event.respond ("Enter the number of sides with the command or enter nothing. For exmaple, >!roll< or >!roll 12< :octopus:")
    end

end


bot.command :mystatus do |event|

 event.user.status #displays the status of the user, online, idle, offline

end



bot.command([:set]) do |event|
 
 event.bot.game=("In The Pacific Ocean") #changes what cthulhu is playing
 event.message.delete

end


bot.run
