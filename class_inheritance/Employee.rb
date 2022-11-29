class Employee 
    attr_reader :name, :title, :salary
    attr_accessor :boss
    def initialize(name, title, salary, boss=nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        
    end

    def bonus(multiplier)
        self.salary * multiplier
    end
end

class Manager < Employee
    def initialize
        super(name, title, salary, boss)
        @employee = []
    end

    def bonus(multiplier)

    end

end

# add employees to populate array
# find sub salary/bonus method