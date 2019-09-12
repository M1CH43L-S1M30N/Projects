 require_relative "employee"
class Manager < Employee
    def initialize(name, salary, title, boss = nil)
      super(name, salary, title, boss)
        @employees = []
    end

    def bonus(multiplier)
      multiplier * total_sub_salary
        # total = 0
        # @employees.each do |emp|
        #     total += emp.salary
        # end 
        # total * multiplier
    end

    def total_sub_salary
      #iterate through employees
        #if just employee add salary to total
        #else add manager total_sub to total
      #return total
      total = 0
        @employees.each do |emp|
          total += emp.salary
          total += emp.total_sub_salary if emp.is_a?(Manager)
        end
      return total
    end


    def add_employee(employee)
      @employees << employee
    end
end

carly = Manager.new("carly", "web dev", 30000)
martin = Manager.new("martin", "dev", 12500, carly)
mike = Employee.new("mike", "intern", 2000, martin)
paul = Employee.new("paul", "hobo", 30, martin)

puts carly.bonus(2)
puts paul.bonus(20)