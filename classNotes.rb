class Clock
    def initialize
        @sec = 0
        @min = 0
        @hrs = 0
        
    end

    def run 
        while true
            sleep(1)
            tick
            print
        end
    end

    private

    def tick
        self.sec += 1
        # seconds = 1
        increment_min
        increment_hrs
    end

    def print 
        puts "#{self.hrs}:#{self.min}:#{self.sec} "
    end

    def increment_min
        if self.sec == 60
            self.min += 1
            self.sec = 0
        end
    end
end

