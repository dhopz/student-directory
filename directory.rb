student_count = 11

students = [
    {name: "Dr. Hannibal Lecter", cohort: :november, hobbies: "coding, basketball", country_of_birth: "England"},
    {name: "Darth Vader", cohort: :november, hobbies: "coding, cricket", country_of_birth: "England"},
    {name: "Nurse Ratched", cohort: :november, hobbies: "coding, football", country_of_birth: "England"},
    {name: "Michael Corleone", cohort: :november, hobbies: "coding, basketball", country_of_birth: "England"},
    {name: "Alex DeLarge", cohort: :november, hobbies: "coding, football", country_of_birth: "England"},
    {name: "The Wicked Witch of the West", cohort: :november, hobbies: "coding, basketball", country_of_birth: "England"},
    {name: "Terminator", cohort: :november, hobbies: "coding, basketball", country_of_birth: "Ireland"},
    {name: "Freddy Krueger", cohort: :november, hobbies: "coding, basketball", country_of_birth: "Australia"},
    {name: "The Joker", cohort: :november, hobbies: "coding, football", country_of_birth: "New Zealand"},
    {name: "Joffrey Baratheon", cohort: :november, hobbies: "coding, basketball", country_of_birth: "South Africa"},
    {name: "Norman Bates", cohort: :november, hobbies: "coding, knitting", country_of_birth: "Germany"}
  ]

def print_students_hobbies(students)
  students.each_with_index do |student,i|
    puts "#{i}: #{student[:hobbies]}, from #{student[:country_of_birth]}".center(8)
    puts student[:name][0].center(15,"*")
    end
end 

def print_students_with_numbers(students)
#reduce_list =  students.select { |student| student[:name][0] == "D" }
students.each_with_index do |student,i|
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
        #students << {name: name, cohort: :november}
        #puts "Now we have #{students.count} students"
        puts "Which cohort?"
        cohort = gets.chomp

        if cohort.empty?
            cohort = "December"
        end
        
        students << {name: name, cohort: cohort}
        puts "Now we have #{students.count} students"
        puts "Another Student?"

        name = gets.chomp
    end
    puts students
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

input_students
#print_header
#print_students_with_numbers(students)
#print(students)
#print_footer(students)
#print_students_hobbies(students)