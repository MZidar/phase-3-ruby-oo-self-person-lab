require 'pry'



class Person

    attr_reader :name, :happiness, :hygiene
    attr_accessor :bank_account

    def initialize (name, bank_account = 25, happiness = 8, hygiene = 8)
        @name = name
        @bank_account = bank_account
        @happiness = happiness
        @hygiene = hygiene
       
    end

    def limit_set(x, y)
        if x < 0
            self.instance_variable_set("@#{y}", 0)        
        elsif x > 10
            self.instance_variable_set("@#{y}", 10)
        else
            self.instance_variable_set("@#{y}", x)
        end
    end

    def happiness=(happiness)
        limit_set(happiness, "happiness")
    end

    def hygiene=(hygiene)
        limit_set(hygiene, "hygiene")
    end

    def seven?(level)
        if  level > 7
            return true
        else
            return false
        end
    end

    def happy?
        seven?(happiness)
    end

    def clean?
        seven?(hygiene)
    end

    def get_paid(amount)
        @bank_account += amount
        return "all about the benjamins"
    end

    def take_bath
        hygiene = @hygiene + 4
        self.hygiene=(hygiene)
        return "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        hygiene = @hygiene - 3
        happiness = @happiness + 2
        self.hygiene=(hygiene)
        self.happiness=(happiness)
        return "♪ another one bites the dust ♫"
    end

    def call_friend(friend)
        
        friend.happiness=(friend.happiness + 3)
        self.happiness=(happiness + 3)
        return "Hi #{friend.name}! It's #{self.name}. How are you?"
    end

    def start_conversation(friend, topic)
        case topic
        when topic = "politics"
            friend.happiness=(friend.happiness - 2)
            self.happiness=(happiness - 2)
            return "blah blah partisan blah lobbyist"
        when topic = "weather"
            friend.happiness=(friend.happiness + 1)
            self.happiness=(happiness + 1)
            return "blah blah sun blah rain"
       
        else
            return "blah blah blah blah blah"
        end
    end

end


binding.pry