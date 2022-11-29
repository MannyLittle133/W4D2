class Employee 
    attr_reader :name, :title, :salary
    attr_accessor :boss
    def initialize(name, title, salary, boss=nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        @boss.employees << self if !boss.nil?
        
    end


    def bonus(multiplier)
        self.salary * multiplier
    end
end

class Manager < Employee
    attr_accessor :name, :title, :salary, :employees, :boss
    def initialize(name, title, salary, boss=nil)
        super(name, title, salary, boss)
        @employees = []
    end

    def add_employee(employee)
        @employees << employee
    end

    def bonus(multiplier)
        workers = @employees
        marked = []
        finished = false

        while !finished
            finished = true
            i = 0
            while i < workers.length
                if workers[i].is_a?(Manager) && !marked.include?(i)
                    marked << i
                    workers.concat(workers[i].employees)
                    finished = false
                end
                i += 1
            end
        end
        return workers.inject(0) { |acc, cur| acc += cur.salary } * multiplier
    end

end

# add employees to populate array
# find sub salary/bonus method

ned = Manager.new("Ned", "Founder", 100)
darren = Manager.new("Darren", "TA Manager", 20, ned)
shawna = Employee.new("Shawna", 'TA', 12, darren)
david = Employee.new("David", 'TA', 10, darren)

puts ned.bonus(5)