class Employee

    def initialize(name, salary, title, boss = nil)
        @name = name
        @salary = salary
        @title = title
        @boss = boss         

    end

    def bonus(multiplier)
        @salary * multiplier

    end

    attr_reader :name, :salary, :title, :boss 

end

class Manager < Employee

    def initialize(name, salary, title, boss = nil)
        super
        @employees = []

    end

    def add_employee(employee)
        employees << employee
    end

    def bonus(multiplier)
        total_salaries = employees.sum {|employee| employee.salary}
        total_salaries * multiplier
    end

    attr_reader :employees
end

