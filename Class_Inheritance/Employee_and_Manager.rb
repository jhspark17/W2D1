class Employee

  attr_reader :salary
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end


end

class Manager < Employee

    def initialize(name, title, salary, boss)
        @employees = []
        super
    end

    def bonus(multiplier)
        multiplier * get_sub_salary
    end

    def get_sub_salary
        sum = 0
        @employees.each do |employee|
            if employee.class == Manager
                sum += employee.get_sub_salary
            end
            sum += employee.salary
        end
        sum
    end

    def add_employee(employee)
        @employees << employee
    end
end

if __FILE__ == $PROGRAM_NAME

    david = Employee.new("David", "TA", 10000, "Darren")
    shawna = Employee.new("Shawna", "TA", 12000, "Darren")
    darren = Manager.new("Darren", "TA Manager", 78000, "Ned")
    ned = Manager.new("Ned", "Founder", 1000000, nil)

    darren.add_employee(shawna)
    darren.add_employee(david)
    ned.add_employee(darren)

   p ned.bonus(5)
   p  darren.bonus(4)
   p david.bonus(3)

        



end