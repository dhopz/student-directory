student_count = 11

students = [
    {name: "Dr. Hannibal Lecter", cohort: "June", hobbies: "coding, basketball", country_of_birth: "England"},
    {name: "Darth Vader", cohort: :november, hobbies: "coding, cricket", country_of_birth: "England"},
    {name: "Nurse Ratched", cohort: :november, hobbies: "coding, football", country_of_birth: "England"},
    {name: "Michael Corleone", cohort: :november, hobbies: "coding, basketball", country_of_birth: "England"},
    {name: "Alex DeLarge", cohort: :november, hobbies: "coding, football", country_of_birth: "England"},
    {name: "The Wicked Witch of the West", cohort: :november, hobbies: "coding, basketball", country_of_birth: "England"},
    {name: "Terminator", cohort: :november, hobbies: "coding, basketball", country_of_birth: "Ireland"},
    {name: "Freddy Krueger", cohort: :november, hobbies: "coding, basketball", country_of_birth: "Australia"},
    {name: "The Joker", cohort: :november, hobbies: "coding, football", country_of_birth: "New Zealand"},
    {name: "Joffrey Baratheon", cohort: :november, hobbies: "coding, basketball", country_of_birth: "South Africa"},
    {name: "Norman Bates", cohort: "June", hobbies: "coding, knitting", country_of_birth: "Germany"}
  ]

#puts "There are this many #{students.count}"

@students = []

def group_by_cohorts(students,cohort_month)
    grouped_cohorts = students.group_by { |student, cohort| student[:cohort].itself }
    #puts grouped_cohorts
    puts grouped_cohorts[cohort_month]
end

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
    #students = []
    name = gets.chomp
    #name = gets.chop
    #name = gets[0..3]

    # while name.empty?
    #     puts "Need a Name"
    #     name = gets.chomp
    # end

    while !name.empty? do
        #students << {name: name, cohort: :november}
        #puts "Now we have #{students.count} students"
        puts "Which cohort?"
        cohort = gets.chomp

        if cohort.empty?
            cohort = "December"
        end
        
        @students << {name: name, cohort: cohort}
        
        number_of_students = @students.count
        if number_of_students == 1
            puts "Now we have 1 Student"
        else
            puts "Now we have #{@students.count} students"
        end

        puts "Another Student?"

        name = gets.chomp
        
    end
    
    @students
end

def save_students
    # open the file for writing
    file = File.open("students.csv", "w")

    # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end

    file.close

end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end
  
def print_student_list
    @students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]}) cohort"
    end
end
  
def print_footer
    puts "Overall, we have #{@students.count} great students"
    puts "-----"
end

# students = input_students

# if students.count < 1
#     puts "User Input 0 Students"
# else
#     print_header
#     #print_students_with_numbers(students)
#     print(students)
#     print_footer(students)
#     #print_students_hobbies(students)
#     #group_by_cohorts(students,"June")
# end

# def interactive_menu
#     students = []
#     loop do
#       # 1. print the menu and ask the user what to do
#       puts "1. Input the students"
#       puts "2. Show the students"
#       puts "9. Exit" # 9 because we'll be adding more items
#       # 2. read the input and save it into a variable
#       selection = gets.chomp
#       # 3. do what the user has asked
      
#       case selection
#         when "1"
#             students = input_students
#         when "2"
#             print_header
#             print(students)
#             print_footer(students)
#         when "9"
#             exit # this will cause the program to terminate
#         else
#             puts "I don't know what you meant, try again"
#         end
#     end
# end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the List to Students.csv"
    puts "9. Exit" 
end

def show_students
    print_header
    print_student_list
    print_footer
end

def process(selection)
    case selection
      when "1"
        input_students
      when "2"
        show_students
      when "3"
        save_students
      when "9"
        exit
      else
        puts "I don't know what you mean, try again"
    end
end

def interactive_menu
    loop do
      print_menu
      process(gets.chomp)
    end
end

interactive_menu

