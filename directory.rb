student_count = 11

students = [
    {name: "Dr. Hannibal Lecter", cohort: :november},
    {name: "Darth Vader", cohort: :november},
    {name: "Nurse Ratched", cohort: :november},
    {name: "Michael Corleone", cohort: :november},
    {name: "Alex DeLarge", cohort: :november},
    {name: "The Wicked Witch of the West", cohort: :november},
    {name: "Terminator", cohort: :november},
    {name: "Freddy Krueger", cohort: :november},
    {name: "The Joker", cohort: :november},
    {name: "Joffrey Baratheon", cohort: :november},
    {name: "Norman Bates", cohort: :november}
  ]

def print_students_with_numbers(students)
reduce_list =  students.select { |student| student[:name][0] == "D" }
reduce_list.each_with_index do |student,i|
    puts "#{i}: #{student[:name]}"
    #puts student[:name][0]
    end
end 

def print_students_beggining_with(students,letter)
    reduce_list =  students.select { |student| student[:name][0] == letter }
    reduce_list.each_with_index do |student,i|
        puts "#{i}: #{student[:name]}"
        #puts student[:name][0]
        end
    end

def print_students_shorter_than(students)
    reduce_list =  students.select { |student| student[:name].length <= 12 }
    reduce_list.each_with_index do |student,i|
        puts "#{i}: #{student[:name]}"
        puts student[:name].length
        #puts student[:name][0]
    end
end


def input_students
    puts "Please enter the names of the Students"
    puts "To Finish, just hit return twice"
    students = []
    name = gets.chomp

    while !name.empty? do
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
    end
    students
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end
  
def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]}) cohort"
    end
end
  
def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end

#students = input_students
print_header
print_students_with_numbers(students)
#print(students)
#print_footer(students)